//
//  EnterEmailViewController.swift
//  FirebaseLoginSample
//
//  Created by 이희웅 on 2023/06/18.
//

import UIKit

class EnterEmailViewController : UIViewController{
    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var errorMessageLabel: UILabel!
    @IBOutlet var nextButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nextButton.layer.cornerRadius = 30
        
        nextButton.isEnabled = false
        emailTextField.delegate = self
        passwordTextField.delegate = self
        emailTextField.becomeFirstResponder()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = false
    }
    
    @IBAction func tabNextButton(_ sender: UIButton) {
        //firebase 이메일/비밀번호 인증
        let email = emailTextField.text ?? ""
        let password = passwordTextField.text ?? ""
        
        // 신규 사용자 생성 - >
        Authentication.SignUp(withEmail: email, password: password){[weak self] authResult, error in
            guard let self = self else {return}
            if let error = error{
                let code = (error as NSError).code
                switch code{
                case 17007: // 이미 가입한 계정일 때
                    //로그인
                    Authentication.signIn(withEmail: email, password: password){
                        [weak self] _, error in
                        guard let self = self else {return}
                        
                        if let error = error {
                            self.errorMessageLabel.text = error.localizedDescription
                        }else{
                            showMainViewController()
                        }
                    }
                default:
                    self.errorMessageLabel.text = error.localizedDescription
                }
            }else{
                showMainViewController()
            }
        }
    }
}

/**
 따로 빼놓는 이유
 특정 뷰를 호출하는 메서드는 별도의 클래스로 빼는 것이 좋은지 고민중...
 */
extension EnterEmailViewController {
    private func showMainViewController(){
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let mainViewcontroller = storyboard.instantiateViewController(withIdentifier: "MainViewController")
        mainViewcontroller.modalPresentationStyle = .fullScreen
        navigationController?.show(mainViewcontroller, sender: nil)
    }
}

extension EnterEmailViewController : UITextFieldDelegate{

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)
        return false
    }
    
    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextField.DidEndEditingReason) {
        let isEmailEmpty = emailTextField.text == ""
        let isPasswordEmpty = passwordTextField.text == ""
        
        nextButton.isEnabled = !isEmailEmpty && !isPasswordEmpty
    }
}
