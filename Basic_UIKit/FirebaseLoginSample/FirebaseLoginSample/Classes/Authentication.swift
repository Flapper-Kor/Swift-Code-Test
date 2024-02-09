//
//  Authentication.swift
//  ddd
//
//  Created by 이희웅 on 2023/06/21.
//

import FirebaseCore
import FirebaseAuth
import GoogleSignIn

/**
    this class is managing firebase Login
    To make it easy to replace the authentication module, if possible, provide APIs wrapped in views and controllers.
    
    basic methods is signup, signin, signout
 */
class Authentication {
    
    public static var auth = Auth.auth()
    
//    var handle: AuthStateDidChangeListenerHandle?
    
//    init(){
////        handle = Auth.auth().addStateDidChangeListener { auth, user in
////            if auth.currentUser != nil {
////              // User is signed in.
////                self.auth = Auth.auth()
////            } else {
////              // No user is signed in.
////                self.label.text = Auth.auth().currentUser?.description
////            }
////        }
//    }
    
    class func googleSignIn (view :UIViewController,
                             GIDSignInComplete : @escaping ()->() = {},
                             userNil : @escaping ()->() = {},
                             authCompletion : @escaping (AuthDataResult?, Error?)->() = {_, _ in }
    ){
        guard let clientID = FirebaseApp.app()?.options.clientID else { return }
        
        // Create Google Sign In configuration object.
        let config = GIDConfiguration(clientID: clientID)
        GIDSignIn.sharedInstance.configuration = config

        // Start the sign in flow!
        GIDSignIn.sharedInstance.signIn(withPresenting: view) { result, error in
            guard error == nil else {
                GIDSignInComplete()
//                view.label.text = error?.localizedDescription
//            debugPrint("error \(error?.localizedDescription ?? "non")")
            return
            }

            guard let user = result?.user,
            let idToken = user.idToken?.tokenString
            else {
                userNil()
                return
            }
            let credential = GoogleAuthProvider.credential(
                withIDToken: idToken,
                accessToken: user.accessToken.tokenString)
            
            Auth.auth().signIn(with: credential, completion: authCompletion)
        }
    }
    class func googleSignIn (view :UIViewController,
                             authCompletion : @escaping (AuthDataResult?, Error?)->() = {_, _ in }
    ){
        guard let clientID = FirebaseApp.app()?.options.clientID else { return }
        
        // Create Google Sign In configuration object.
        let config = GIDConfiguration(clientID: clientID)
        GIDSignIn.sharedInstance.configuration = config

        // Start the sign in flow!
        GIDSignIn.sharedInstance.signIn(withPresenting: view) { result, error in
            guard error == nil else {
                debugPrint(error as Any)
            return
            }

            guard let user = result?.user,
            let idToken = user.idToken?.tokenString
            else {
                return
            }
            let credential = GoogleAuthProvider.credential(
                withIDToken: idToken,
                accessToken: user.accessToken.tokenString)
            
            Auth.auth().signIn(with: credential, completion: authCompletion)
        }
    }
    
    class func signIn(withEmail email : String,
                         password : String,
                         completion : @escaping ((AuthDataResult?, Error?) -> ()) = { _, _ in }
    ){
        Auth.auth().signIn(withEmail: email,
                           password: password,
                           completion : completion)
    }
    
    /**
     fireBase Auth SignOut 방법은 로그인 서비스 프로바이더에 관계 없이 인증서버 기준 로그아웃을 실행하면 되는 것이므로 동일하다.
     */
    class func signOut(completion : ()->() = {}) throws {
        let firebaseAuth = Auth.auth()
        do {
            try firebaseAuth.signOut()
            completion()
        } catch let signOutError as NSError {
            throw signOutError
        }
    }
    
    class func SignUp(withEmail email : String,
                      password : String,
                      completion : @escaping ((AuthDataResult?, Error?) -> ()) = { _, _ in }
    ){
        Auth.auth().createUser(
            withEmail: email,
            password: password,
            completion: completion)
    }
}
