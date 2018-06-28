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

class WeatherVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
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
                    
                    
                    if let forecast = json["forecast"]["txt_forecast"].dictionary {
                        for result in (forecast["forecastday"]?.arrayValue)! {
//                            let title = result["title"].stringValue
//                            let icon_url = result["icon_url"].stringValue
//                            let fcttext = result["fcttext"].stringValue
//                            let fcttext_metric = result["fcttext_metric"].stringValue
                        }
                    }
                    
                    if let forecast = json["forecast"]["txt_forecast"].dictionary {
                        for result in (forecast["simpleforecast"]!["forecastday"].arrayValue) {
                            let title = result["title"].stringValue
                            print("titilssss \(title)")
                        }
                    }
                    
                    break
                }
                
        }
    }
}
