//
//  CodePresentViewController.swift
//  ScreenTransition
//
//  Created by 이희웅 on 2022/11/12.
//

import UIKit

protocol SendDataDelegate : AnyObject {
    func SendData(name : String)
}

class CodePresentViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    var name : String?
    
    weak var delegate : SendDataDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print("CodePresentViewController 뷰가 로드되었다.")
        
        // 옵셔널 바인딩 setter로 구현하지 않고 이렇게 구현함
        if let name = name {
            self.nameLabel.text = name
            self.nameLabel.sizeToFit()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("CodePresentViewController 뷰가 나타날 것이다.")
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("CodePresentViewController 뷰가 나타났다.")
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("CodePresentViewController 뷰가 사라질 것이다.")
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("CodePresentViewController 뷰가 사라졌다.")
    }
    
    @IBAction func tabBackButton(_ sender: Any) {
        self.delegate?.SendData(name: "Sring by delegate")
        
        self.presentingViewController?.dismiss(animated: true)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
