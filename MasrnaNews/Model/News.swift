//
//  News.swift
//  MasrnaNews
//
//  Created by Ahmad ALGhamdi on 6/28/18.
//  Copyright © 2018 Y2M. All rights reserved.
//

import Foundation

public class News {
    
    var title:String?
    var id:String?
    var image:String?
    var body:String?
    var link:String?
    var video:String?
    var type:String?
    var time:String?
    
    init(title:String, id:String, image:String, body:String, link:String, video:String, type:String, time:String) {
        
        self.title = title
        self.id = id
        self.image = image
        self.body = body
        self.link = link
        self.video = video
        self.type = type
        self.time = time
    }
}
