//
//  customGradient.swift
//  samaKitchen
//
//  Created by tro on 5/19/18.
//  Copyright © 2018 Ahmad ALGhamdi. All rights reserved.
//

import Foundation

import UIKit
@IBDesignable

class CustomGradient: UIView {
    
    @IBInspectable var FirstColor : UIColor = UIColor.clear {
        didSet{
            updateView()
        }
    }
    
    @IBInspectable var SecondColor : UIColor = UIColor.clear {
        didSet{
            updateView()
        }
    }
    
    
    
    override class var layerClass : AnyClass {
        get{
            return CAGradientLayer.self
        }
    }
    
    func updateView() {
        let Layer = self.layer as! CAGradientLayer
        Layer.colors = [FirstColor.cgColor , SecondColor.cgColor]
    }
    
}
