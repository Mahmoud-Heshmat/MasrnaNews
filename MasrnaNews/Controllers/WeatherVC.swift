//
//  WeatherVC.swift
//  MasrnaNews
//
//  Created by Ahmad ALGhamdi on 6/28/18.
//  Copyright © 2018 Y2M. All rights reserved.
//

import UIKit
import SwiftyJSON
import Alamofire
import Kingfisher

class WeatherVC: UIViewController {

    @IBOutlet weak var iconImage: UIImageView!
    @IBOutlet weak var conditionLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var maxDegreeLabel: UILabel!
    @IBOutlet weak var minDegreeLabel: UILabel!
    
    var icon:String?
    var condition:String?
    var date:String?
    var maxDegreeC:String?
    var minDegreeC:String?
    var maxDegreeF:String?
    var minDegreeF:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UIApplication.shared.statusBarView?.backgroundColor = UIColor(named: "MainColor")
        getNews()
        
    }
    
    func getNews() {
        let url = URLs.GET_WEATHER(index: "1")
        
        Alamofire.request(url, method: .post, encoding: URLEncoding.default, headers: nil)
            .validate(statusCode: 200..<500)
            .responseJSON { response in
                
                switch response.result
                {
                case .failure(let error):
                    print(error)
                    
                case .success(let value):
                    //print("blogs \(String(describing: value))")
                    let json = JSON(value)
                    
                    var x2 = 1
                    var x1 = 1
                    
                    
                    if let forecast = json["forecast"]["txt_forecast"].dictionary {
                        for result in (forecast["forecastday"]?.arrayValue)! {
                            let title = result["title"].stringValue
                            let icon_url = result["icon_url"].stringValue
                            let fcttext = result["fcttext"].stringValue
                            let fcttext_metric = result["fcttext_metric"].stringValue
                            
                            if x1 == 1 {
                                x1 = 2
                                self.title = title
                                self.icon = icon_url
                                print("title is \(title)")
                            }
                        }
                    }
                    
                    if let forecast = json["forecast"]["simpleforecast"].dictionary {
                        for result in (forecast["forecastday"]?.arrayValue)! {
                            let conditions = result["conditions"].stringValue
                            let icon_url = result["icon_url"].stringValue
                            let date = result["date"].dictionary
                            let high = result["high"].dictionary
                            let low = result["low"].dictionary
                            
                            if x2 == 1 {
                                x2 = 2
                                self.minDegreeC = low?["celsius"]?.stringValue
                                self.minDegreeF = low?["fahrenheit"]?.stringValue
                                self.maxDegreeC = high?["celsius"]?.stringValue
                                self.maxDegreeF = high?["fahrenheit"]?.stringValue
                                self.condition = conditions
                                self.date = "\(date?["weekday"]?.stringValue ?? "") , \(date?["day"]?.stringValue ?? "")  \(date?["monthname"]?.stringValue ?? "")"
                            }
                            //print("titilssss \(title!["epoch"] )")
                        }
                    }
                    self.loadViews()
                    break
                }
        }
    }
    
    func loadViews() {
        
        let image_url = URL(string: icon!)
        let resource = ImageResource(downloadURL: image_url!, cacheKey:  icon!)
        iconImage.kf.indicatorType = .activity
        iconImage.kf.setImage(with: resource, placeholder: nil)
        
        let defaults = UserDefaults.standard
        let type = defaults.string(forKey: "type")
        if type == "fah" {
            minDegreeLabel.text = minDegreeC! + " F"
            maxDegreeLabel.text = maxDegreeC! + " F"
        }else{
            minDegreeLabel.text = minDegreeC! + " C"
            maxDegreeLabel.text = maxDegreeC! + " C"
        }
        
        conditionLabel.text = condition
        dateLabel.text = date
    }
}
