//
//  NewsDetailVC.swift
//  MasrnaNews
//
//  Created by Ahmad ALGhamdi on 6/28/18.
//  Copyright © 2018 Y2M. All rights reserved.
//

import UIKit

class NewsDetailVC: UIViewController {

    var SingleItem: News?
    
    @IBOutlet weak var detailText: UITextView!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if !((SingleItem?.title?.isEmpty)!) {
            titleLabel.text = SingleItem?.title
        }
        
        if !((SingleItem?.body?.isEmpty)!) {
            detailText.text = SingleItem?.body
        }
        
    }
    
    
    @IBAction func shareBtn(_ sender: Any) {
    }
    
}
