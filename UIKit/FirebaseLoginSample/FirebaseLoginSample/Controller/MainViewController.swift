//
//  MainViewController.swift
//  FirebaseLoginSample
//
//  Created by 이희웅 on 2023/06/18.
//

import UIKit
import FirebaseAuth

class MainViewController : UIViewController{
    @IBOutlet var welcomeLabel: UILabel!
    @IBOutlet weak var updatePasswordButton: UIButton!
    private var handle: AuthStateDidChangeListenerHandle?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 뒤로가기 버튼 (pop gesture) 불가능하도록
        navigationController?.interactivePopGestureRecognizer?.isEnabled = false
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //
        handle = Auth.auth().addStateDidChangeListener { auth, user in
            if auth.currentUser != nil {
              // User is signed in.
                self.setLabel()
            } else {
              // No user is signed in.
                self.setLabel()
            }
        }
        
        navigationController?.navigationBar.isHidden = true
                
        let isEailSignIn = Authentication.auth.currentUser?.providerData.first?.providerID == "password"
        updatePasswordButton.isHidden = !isEailSignIn
    }
    
    func setLabel(){
        let email = Authentication.auth.currentUser?.email ?? "고객"
        welcomeLabel.text = """
        환영합니다
        \(email)님
        """
    }
    
    @IBAction func tapLooutButton(_ sender: UIButton) {
        do{
            try Authentication.signOut(){
                self.navigationController?.popToRootViewController(animated: true)
            }
        }catch let signOutError as NSError {
            print("ERROR: signout \(signOutError.localizedDescription)")
        }
    }
    
    @IBAction func tapUpdatePassword(_ sender: UIButton) {
        let email = Authentication.auth.currentUser?.email ?? ""
        Authentication.auth.sendPasswordReset(withEmail: email)
    }
}
