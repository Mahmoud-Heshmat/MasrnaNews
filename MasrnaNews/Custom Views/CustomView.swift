//
//  CustomView.swift
//  DR_Sen
//
//  Created by Ahmad ALGhamdi on 3/15/18.
//  Copyright © 2018 Ahmad ALGhamdi. All rights reserved.
//

import UIKit

extension UIView{
    
    @IBInspectable var CornerRaduis : CGFloat {
        get{ return self.layer.cornerRadius}
        set{ self.layer.cornerRadius = newValue}
    }
    
    @IBInspectable var shadowOffsetWidth : CGFloat {
        get{ return self.layer.shadowOffset.width}
        set{ self.layer.shadowOffset.width = newValue}
    }
    
    @IBInspectable var shadowOffsetHeight : CGFloat {
        get{ return self.layer.shadowOffset.height}
        set{ self.layer.shadowOffset.height = newValue}
    }
    
    @IBInspectable var shadowOpacity : CGFloat {
        get{ return CGFloat(self.layer.shadowOpacity)}
        set{ self.layer.shadowOpacity = Float(newValue)}
    }
    
    @IBInspectable var shadowColor : UIColor {
        get{ return UIColor( cgColor : self.layer.shadowColor!)}
        set{ self.layer.shadowColor = newValue.cgColor}
    }
    
    @IBInspectable var BorderWidth : CGFloat {
        get{ return self.layer.borderWidth}
        set{ self.layer.borderWidth = newValue}
    }
    
    @IBInspectable var BorderColor : UIColor {
        get{ return UIColor( cgColor : self.layer.borderColor!)}
        set{ self.layer.borderColor = newValue.withAlphaComponent(0.3).cgColor}
    }
    
}

extension UITextField {
    @IBInspectable var PlaceholderColor : UIColor {
        get{ return self.PlaceholderColor}
        set{ self.attributedPlaceholder = NSAttributedString(string: self.placeholder != nil ? self.placeholder! : "", attributes: [NSAttributedStringKey.foregroundColor : newValue])}
    }
}

extension UIColor{
    
    func getCustomBlueColor() -> UIColor{
        
    return UIColor(red:0.043, green:0.576 ,blue:0.588 , alpha:1.00)
        
    }
}


extension UIApplication {
    var statusBarView: UIView? {
        return value(forKey: "statusBar") as? UIView
    }
}

extension CALayer {
    
    func addBorder(edge: UIRectEdge, color: UIColor, thickness: CGFloat, personalInfoView: UIView) {
        
        let border = CALayer()
        
        switch edge {
        case .top:
            border.frame = CGRect(x: 0, y: 0, width: frame.width, height: thickness)
        case .bottom:
//            border.frame = CGRect(x: 0, y: frame.height - thickness, width: frame.width, height: thickness)
             border.frame = CGRect(x: 0, y: frame.height - thickness, width: personalInfoView.frame.width, height: thickness)
        case .left:
            border.frame = CGRect(x: 0, y: 0, width: thickness, height: frame.height)
        case .right:
            border.frame = CGRect(x: frame.width - thickness, y: 0, width: thickness, height: frame.height)
        default:
            break
        }
        
        border.backgroundColor = color.cgColor;
        
        addSublayer(border)
    }
}


