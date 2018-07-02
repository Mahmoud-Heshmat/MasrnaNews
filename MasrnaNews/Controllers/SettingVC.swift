//
//  SettingVC.swift
//  MasrnaNews
//
//  Created by Ahmad ALGhamdi on 7/2/18.
//  Copyright © 2018 Y2M. All rights reserved.
//

import UIKit
import StoreKit

class SettingVC: UIViewController {

    @IBOutlet weak var fahrenheit: UIButton!
    @IBOutlet weak var celsuis: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let defaults = UserDefaults.standard
        let type = defaults.string(forKey: "type")
        
        if type == "fah" {
            fahrenheit.setTitleColor(UIColor(named: "MainColor"), for: .normal)
            celsuis.setTitleColor(UIColor.darkGray, for: .normal)
        }else{
            celsuis.setTitleColor(UIColor(named: "MainColor"), for: .normal)
            fahrenheit.setTitleColor(UIColor.darkGray, for: .normal)
        }
    }

    @IBAction func rateBtn(_ sender: Any) {
        if #available(iOS 10.3, *) {
            //call ios API method for review view.
            SKStoreReviewController.requestReview()
        }
    }
    
    @IBAction func fahrBtn(_ sender: Any) {
        let defaults = UserDefaults.standard
        defaults.set("fah", forKey: "type")
        
        fahrenheit.setTitleColor(UIColor(named: "MainColor"), for: .normal)
        celsuis.setTitleColor(UIColor.darkGray, for: .normal)
    }
    
    @IBAction func celsBtn(_ sender: Any) {
        let defaults = UserDefaults.standard
        defaults.set("cels", forKey: "type")
        
        celsuis.setTitleColor(UIColor(named: "MainColor"), for: .normal)
        fahrenheit.setTitleColor(UIColor.darkGray, for: .normal)
    }
}

