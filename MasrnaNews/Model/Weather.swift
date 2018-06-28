//
//  Weather.swift
//  MasrnaNews
//
//  Created by Ahmad ALGhamdi on 6/28/18.
//  Copyright © 2018 Y2M. All rights reserved.
//

import Foundation

public class Weather{
    
    var day_title:String?
    var day_icon_url:String?
    var day_fcttext:String?
    var day_fcttext_metric:String?
    var night_title:String?
    var night_icon_url:String?
    var night_fcttext:String?
    var night_fcttext_metric:String?
    var date:String?
    var highfahrenheit:String?
    var highcelsius:String?
    var lowfahrenheit:String?
    var lowcelsius:String?
    var conditions:String?
    var icon_url:String?
    
    init(day_title:String, day_icon_url:String, day_fcttext:String, day_fcttext_metric:String, night_title:String, night_icon_url:String, night_fcttext:String, night_fcttext_metric:String, date:String, highfahrenheit:String, highcelsius:String, lowfahrenheit:String, lowcelsius:String, conditions:String, icon_url:String) {
        
        self.day_title = day_title
        self.day_icon_url = day_icon_url
        self.day_fcttext = day_fcttext
        self.day_fcttext_metric = day_fcttext_metric
        self.night_title = night_title
        self.night_icon_url = night_icon_url
        self.night_fcttext = night_fcttext
        self.night_fcttext_metric = night_fcttext_metric
        self.date = date
        self.highfahrenheit = highfahrenheit
        self.lowfahrenheit = lowfahrenheit
        self.lowcelsius = lowcelsius
        self.conditions = conditions
        self.icon_url = icon_url
    }
    
}
