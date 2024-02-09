//
//  LoginViewController.swift
//  FirebaseLoginSample
//
//  Created by 이희웅 on 2023/06/18.
//

import UIKit
import FirebaseAuth

class LoginViewController : UIViewController{
    @IBOutlet var emailLoginButton: UIButton!
    @IBOutlet var googleLoginButton: UIButton!
    @IBOutlet var appleLoginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        [self.emailLoginButton, self.googleLoginButton, self.appleLoginButton]
            .forEach{
                $0?.layer.borderWidth = 1
                $0?.layer.borderColor = UIColor.white.cgColor
                $0?.layer.cornerRadius = 30
            }

        if Authentication.auth.currentUser != nil{
            self.showMainViewController()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.navigationBar.isHidden = true
        

    }
    @IBAction func tabGoogleLoginButton(_ sender: UIButton) {
        //로그인 google
        Authentication.googleSignIn(view: self){ result, error in
            if let error = error{
                debugPrint("Authentication googleSignIn Error : \(error.localizedDescription)")
            }else{
                self.showMainViewController()
            }
            
        }
    }
    @IBAction func tapAppleLoginButton(_ sender: UIButton) {
        // 로그인 apple
    }
}

extension LoginViewController {
    private func showMainViewController(){
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let mainViewcontroller = storyboard.instantiateViewController(withIdentifier: "MainViewController")
        mainViewcontroller.modalPresentationStyle = .fullScreen
        navigationController?.show(mainViewcontroller, sender: nil)
    }
}
