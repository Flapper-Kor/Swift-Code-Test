import Foundation

struct CreditCard: Codable{
    let id:Int
    let rank:Int
    let name:String
    let cardImageURL:String
    let promotionDetail: PromotionDetail
    
    let isSelected: Bool?
}
struct PromotionDetail: Codable{
    var companyName : String
    var period: String
    var amount: Int
    var condition: String
    var benefitCondition: String
    var benefitDetail: String
    var benefitDate: String
}
