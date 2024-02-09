//
//  ViewController.swift
//  Example_RemoteConfig
//
//  Created by 이희웅 on 2023/06/30.
//

import UIKit
import FirebaseRemoteConfig
import FirebaseAnalytics

class ViewController: UIViewController {
    var remoteConfig: RemoteConfig?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.remoteConfig = RemoteConfig.remoteConfig()
        let settings = RemoteConfigSettings()
        settings.minimumFetchInterval = 0
        self.remoteConfig?.configSettings = settings
        
        self.remoteConfig?.setDefaults(fromPlist: "RemoteConfigDefaults")
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.fetchConfig()
    }
}

extension ViewController {
    
    func fetchConfig(){
        guard let remoteConfig = self.remoteConfig else {return}
        
        remoteConfig.fetch { (status, error) -> Void in
            if status == .success {
                print("Config fetched!")
                remoteConfig.activate { changed, error in
                    debugPrint("FAH ---- Remoteconfig success")
                    if let error = error {
                        print(error.localizedDescription)
                        print("activate error")
                    }else{
                        
                    }
                }
            } else {
                print("Config not fetched")
                print("Error: \(error?.localizedDescription ?? "No error available.")")
            }
            
            if !self.isNoticeHidden(remoteConfig){
                // 공지 보이게 세팅 되어 있을 경우
                let noticeVC = NoticeViewController(nibName: "NoticeViewController", bundle: nil)
                
                noticeVC.modalPresentationStyle = .custom
                noticeVC.modalTransitionStyle = .crossDissolve
                
                let title = (remoteConfig["title"].stringValue ?? "").replacingOccurrences(of: "\\n", with: "\n")
                let detail = (remoteConfig["detail"].stringValue ?? "").replacingOccurrences(of: "\\n", with: "\n")
                let date = (remoteConfig["date"].stringValue ?? "").replacingOccurrences(of: "\\n", with: "\n")
                
                noticeVC.noticeContents = (title:title, detail:detail, date:date)
                self.present(noticeVC, animated: true, completion: nil)
                
            }else{
                print("here")
                print(remoteConfig["title"].stringValue as Any)
                print(remoteConfig["isHidden"].boolValue)
                self.showEventAlert()
            }
        }
    }
    
    func isNoticeHidden(_ remoteConfig : RemoteConfig) -> Bool{
        return remoteConfig["isHidden"].boolValue
    }
}

extension ViewController{
    func showEventAlert() {
        guard let remoteConfig = remoteConfig else { return }
        
        remoteConfig.fetch {[weak self] status, _ in
            if status == .success {
                remoteConfig.activate(completion: nil)
            } else {
                print("Config not fetched")
            }
            
            let message = remoteConfig["message"].stringValue ?? ""
            let confirmAction = UIAlertAction(title: "확인하기", style: .default) { action in
                Analytics.logEvent("event_button_tapped", parameters: nil)
            }
            let cancelAction = UIAlertAction(title: "취소", style: .cancel, handler: nil)
            
            let alertController = UIAlertController(title: "깜짝 이벤트", message: message, preferredStyle: .alert)
            
            alertController.addAction(confirmAction)
            alertController.addAction(cancelAction)
            
            self?.present(alertController, animated: true, completion: nil)
        }
    }
}
