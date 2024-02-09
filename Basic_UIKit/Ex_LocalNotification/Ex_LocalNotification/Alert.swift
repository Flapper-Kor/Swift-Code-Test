import Foundation

struct Alert:Codable{
    var id:String = UUID().uuidString
    let date:Date
    var isOn:Bool
    
    var time:String{
        let timeformatter = DateFormatter()
        
        timeformatter.dateFormat = "hh:mm"
        return timeformatter.string(from: date)
    }
    
    var meridiem:String{
        let meridiemFormatter = DateFormatter()
        meridiemFormatter.dateFormat = "a"
        meridiemFormatter.locale = Locale(identifier: "ko")
        return meridiemFormatter.string(from:date)
    }
}
