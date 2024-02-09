import UIKit
import Lottie

class CardDetailViewController: UIViewController{
    var promotionDetail: PromotionDetail?
    
    @IBOutlet weak var lottieView: LottieAnimationView!
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var periodLabel: UILabel!
    @IBOutlet weak var conditionLabel: UILabel!
    @IBOutlet weak var benefitConditionLabel: UILabel!
    @IBOutlet weak var benefitDetialLabel: UILabel!
    @IBOutlet weak var benefitDateLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let animationView = LottieAnimationView(name: "money")
        lottieView.contentMode = .scaleAspectFit
        lottieView.addSubview(animationView)
        animationView.frame = lottieView.bounds
        animationView.loopMode = .loop
        animationView.play()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        guard let detail = promotionDetail else {return}
        
        titleLabel.text = """
            \(detail.companyName)카드 쓰면
            \(detail.amount)만원 드려요
            """
        periodLabel.text = detail.period
        conditionLabel.text = detail.condition
        benefitDateLabel.text = detail.benefitDate
        benefitDetialLabel.text = detail.benefitDetail
        benefitConditionLabel.text = detail.benefitCondition
    }
}
