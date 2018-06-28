//
//  HomeVC.swift
//  MasrnaNews
//
//  Created by Ahmad ALGhamdi on 6/28/18.
//  Copyright © 2018 Y2M. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class HomeVC: UIViewController {

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var newsTable: UITableView!
    
    var newsList: [News] = []
    var searchResult: [News] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        newsTable.separatorStyle = .none
        getNews()
    }
    
    func getNews() {
        let url = URLs.GET_NEWS_URL
        
        Alamofire.request(url, method: .post, encoding: URLEncoding.default, headers: nil)
            .validate(statusCode: 200..<500)
            .responseJSON { response in
                
                switch response.result
                {
                case .failure(let error):
                    print(error)
                    
                case .success( _):
                    if let jsonDict = response.result.value as? [String:Any],
                        let dataArray = jsonDict["news"] as? [[String:Any]] {

                        let id = dataArray.flatMap { $0["id"] as? String }
                        let title = dataArray.flatMap { $0["title"] as? String }
                        let body = dataArray.flatMap { $0["body"] as? String }
                        var link = dataArray.flatMap { $0["link"] as? String }
                        let image = dataArray.flatMap { $0["image"] as? String }
                        let video = dataArray.flatMap { $0["video"] as? String }
                        let type = dataArray.flatMap { $0["type"] as? String }
                        let time = dataArray.flatMap { $0["time"] as? String }

                        for (index, _) in id.enumerated() {

                            self.newsList.append(News(title: title[index], id: id[index], image: image[index], body: body[index], link: link[index], video: video[index], type: type[index], time: time[index]))
                        }
                        self.searchResult = self.newsList
                        self.newsTable.reloadData()

                    }
                    
                }
                
        }
    }
    
}

extension HomeVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchResult.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = newsTable.dequeueReusableCell(withIdentifier: "newsCell", for: indexPath) as! NewsCell
        cell.setNews(news: searchResult[indexPath.row].title!)
        cell.setDate(date: searchResult[indexPath.row].time!)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("index path is \(indexPath.row)")
        performSegue(withIdentifier: "detailSegue", sender: indexPath)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let dis = segue.destination as? NewsDetailVC {
            let indexPath = sender as? IndexPath
            let Singleitem=searchResult[(indexPath?.row)!]
            dis.SingleItem = Singleitem
        }
    }
}

extension HomeVC: UISearchBarDelegate, UISearchDisplayDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        guard !searchText.isEmpty else {
            searchResult = newsList
            newsTable.reloadData()
            return
        }
        
        searchResult = newsList.filter({ (News) -> Bool in
            return (News.title?.lowercased().contains(searchText.lowercased()))!
        })
        newsTable.reloadData()
    }
}
