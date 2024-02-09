//
//  ViewController.swift
//  Timer
//
//  Created by 이희웅 on 2023/06/07.
//

import UIKit
import AudioToolbox

class ViewController: UIViewController {

    @IBOutlet var timerLabel: UILabel!
    @IBOutlet var progressView: UIProgressView!
    @IBOutlet var datePicker: UIDatePicker!
    @IBOutlet var cancelButton: UIButton!
    @IBOutlet var toggleButton: UIButton!
    @IBOutlet var imageView: UIImageView!
    
    var duration = 60
    var timerStatus : TimerStatus = .end
    var timer: DispatchSourceTimer?
    var currentSeconds = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureToggle()
        // Do any additional setup after loading the view.
    }

    func setTimerInfoViewVisible(isHidden: Bool){
        self.timerLabel.isHidden = isHidden
        self.progressView.isHidden = isHidden
        self.datePicker.isHidden = !isHidden
    }
    
    func configureToggle(){
        self.toggleButton.setTitle("시작", for: .normal)
        self.toggleButton.setTitle("일시정지", for: .selected)
    }
    func startTimer(){
        if self.timer == nil{
            self.timer = DispatchSource.makeTimerSource(flags: [], queue: .main)
            // 메인스레드 : 메인스레드는 인터페이스 스레드라고도 불리며 인터페이스(UI)와 관련된 작업은 메인스레드에서 구현되어야 함
            self.timer?.schedule(
                deadline: .now() /* +3  : 3초 뒤 실행 */,
                repeating: 1)
            self.timer?.setEventHandler(handler: { [weak self] in
                guard let self = self else { return }
                self.currentSeconds -= 1
//                debugPrint(self.currentSeconds)
                
                let hour = self.currentSeconds / 3600
                let minutes = self.currentSeconds % 3600 / 60
                let seconds = (self.currentSeconds % 3600 ) % 60
                self.timerLabel.text = String(format:"%02d:%02d:%02d", hour, minutes, seconds)
                
                // progress view 에 timer 상태 반영
                self.progressView.progress = Float(self.currentSeconds) / Float(self.duration)
//                debugPrint(self.progressView.progress)
                UIView.animate(withDuration: 0.5, delay: 0, animations: {
                    self.imageView.transform = CGAffineTransform(rotationAngle: .pi)
                })
                UIView.animate(withDuration: 0.5, delay: 0.5, animations: {
                    self.imageView.transform = CGAffineTransform(rotationAngle: .pi * 2)
                })
                
                if self.currentSeconds ?? 0 <= 0{
                    // 타이머 종료
                    self.stopTimer()
                    // 오디오 알람
                    AudioServicesPlaySystemSound(1005)
                }
            })
            self.timer?.resume()
        }
    }
    
    func stopTimer(){
        
        if self.timerStatus == .pause{
            timer?.resume()
        }
        self.timerStatus = .end
        self.cancelButton.isEnabled = false
//        self.setTimerInfoViewVisible(isHidden: true)
        UIView.animate(withDuration: 0.5, animations: {
            self.timerLabel.alpha = 0
            self.progressView.alpha = 0
            self.datePicker.alpha = 1
        })
        self.toggleButton.isSelected = false
        self.timer?.cancel()
        self.timer = nil
        // 타이머가 suspend() 상태에서는 수행해야 할 작업이 있음을 의미하므로 여기에 nil을 대입하면 런타임 에러가 발생
        
        // 타이머를 종료할 때 화면을 벗어나도 타이머가 계속 동작하지 않도록 nil을 할당하여 메모리에서 해제
    }
    
    @IBAction func tapCancelButton(_ sender: Any) {
        switch self.timerStatus{
        case .start, .pause:

            self.stopTimer()
        default:
            break
        }
    }
    
    @IBAction func tapToggleButton(_ sender: Any) {
        
        // 현재 데이트 피커에 설정된 값이 초단위로 저장된 프로퍼티
        self.duration = Int(self.datePicker.countDownDuration)
        debugPrint(self.duration)
        
        switch self.timerStatus{
        case .end:
            self.currentSeconds = self.duration
            self.timerStatus = .start
//            self.setTimerInfoViewVisible(isHidden: false)
            UIView.animate(withDuration: 0.5, animations: {
                self.timerLabel.alpha = 1
                self.progressView.alpha = 1
                self.datePicker.alpha = 0
            })
            self.toggleButton.isSelected = true
            self.cancelButton.isEnabled = true
            self.startTimer()
            
        case .start:
            self.timerStatus = .pause
            self.toggleButton.isSelected = false
//            self.setTimerInfoViewVisible(isHidden: true)
            self.timer?.suspend()
            
        case .pause:
            self.timerStatus = .start
            self.toggleButton.isSelected = true
            self.timer?.resume()
            
        default:
            debugPrint("timerStatus Break.......")
            break
        }
    }
}
