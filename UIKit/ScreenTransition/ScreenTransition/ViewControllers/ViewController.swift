//
//  ViewController.swift
//  ScreenTransition
//
//  Created by 이희웅 on 2022/11/12.
//

import UIKit

class ViewController: UIViewController, SendDataDelegate{
    func SendData(name: String) {
        self.nameLabel.text = name
        self.nameLabel.sizeToFit()
    }

    @IBOutlet weak var nameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print("ViewController 뷰가 로드되었다.")
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("ViewController 뷰가 나타날 것이다.")
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("ViewController 뷰가 나타났다.")
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("ViewController 뷰가 사라질 것이다.")
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("ViewController 뷰가 사라졌다.")
    }

    @IBAction func tabCodePushButton(_ sender: Any) {
        
//        guard let viewController = self.storyboard?.instantiateViewController(identifier: "CodePushViewController") else { return }
        // 아래는 메인뷰 컨트롤러에서 다른 뷰에 변수값 직접 전달을 위한 타입 지정
        guard let viewController = self.storyboard?.instantiateViewController(identifier: "CodePushViewController") as? CodePushViewController else { return }
        // 변수의 직접 전달
        viewController.name = "이 화면은 코드 사용하여 view navigator stack 방식으로 구현한 창 생성 화면입니다."
        
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
    @IBAction func tapCodePresentButton(_ sender: Any) {
        guard let viewController = self.storyboard?.instantiateViewController(identifier: "CodePresentViewController") as? CodePresentViewController else { return }
        
        viewController.name = "이 화면은 코드를 사용하여 present 으로 구현 한 창 생성 화면입니다."
        
        viewController.delegate = self
        
        // 네비게이션 컨트롤러의 표시형태 변경하고 싶다면
        viewController.modalPresentationStyle = .fullScreen
        self.present(viewController, animated: true)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let viewController = segue.destination as? SeguePushViewController{
            viewController.name = "viewController's Name"
        }
    }
    
}

