//
//  SegueViewController.swift
//  ScreenTransition
//
//  Created by 이희웅 on 2022/11/12.
//

import UIKit

class SeguePushViewController: UIViewController {
    @IBOutlet weak var nameLabel: UILabel!
    var name : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print("SeguePushViewController 뷰가 로드되었다.")
        
        if let name = name{
            self.nameLabel.text = name
            self.nameLabel.sizeToFit()
            self.nameLabel.textAlignment = NSTextAlignment.center
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("SeguePushViewController 뷰가 나타날 것이다.")
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("SeguePushViewController 뷰가 나타났다.")
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("SeguePushViewController 뷰가 사라질 것이다.")
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("SeguePushViewController 뷰가 사라졌다.")
    }
    
    @IBAction func tabBackButton(_ sender: Any) {
        // 이전 스택의 네비게이션 컨트롤러로 이동
        self.navigationController?.popViewController(animated: true)
        
//        // 첫화면으로 이동
//        self.navigationController?.popToRootViewController(animated: true)
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
