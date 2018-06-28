//
//  NewsCell.swift
//  MasrnaNews
//
//  Created by Ahmad ALGhamdi on 6/28/18.
//  Copyright © 2018 Y2M. All rights reserved.
//

import UIKit

class NewsCell: UITableViewCell {
    
    @IBOutlet weak var newsLabel: UILabel!
    @IBOutlet weak var newsDate: UILabel!
    
    func setNews(news:String){
        newsLabel.text = news
    }
    func setDate(date:String){
        newsDate.text = date
    }

}
