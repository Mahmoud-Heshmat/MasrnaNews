

import Foundation

struct URLs {
    
  
    static let main = "http://y2m.esy.es/news/"
   
    
    static let GET_NEWS_URL = main + "get_news.php"
    
    public static func GET_WEATHER(index: String)->String{
        return "http://y2m.esy.es/news/get_weather_data.php?id=\(index)"
    }
    
}


