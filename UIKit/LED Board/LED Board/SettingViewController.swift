//
//  SettingViewController.swift
//  LED Board
//
//  Created by 이희웅 on 2022/12/31.
//

import UIKit


// 설정 값 전달은 delegate pattern 으로 전달
protocol LEDBoardSettingDelegate : AnyObject{
    func changedSetting(text : String?, textColor : UIColor, backgroundColor : UIColor)
}

class SettingViewController: UIViewController{
    @IBOutlet weak var textField: UITextField!
    
    @IBOutlet weak var yellowButton: UIButton!
    @IBOutlet weak var purpleButton: UIButton!
    @IBOutlet weak var greenButton: UIButton!
    @IBOutlet weak var blackButton: UIButton!
    @IBOutlet weak var blueButton: UIButton!
    @IBOutlet weak var orangeButton: UIButton!
    
    weak var delegate: LEDBoardSettingDelegate?
    
    var ledText: String?
    
    var textColor: UIColor = .yellow
    var backgroundColor: UIColor = .black
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureView()
    }
    
    private func configureView(){
        if let ledText = self.ledText {
            self.textField.text = ledText
        }
        self.changeTextColor(color: self.textColor)
        self.changeBackgroundColor(color: self.backgroundColor)
        
    }
    
    @IBAction func tapTextColorBotton(_ sender: Any) {
        
        if sender is UIButton{
            if sender as? UIButton == self.yellowButton {
                self.changeTextColor(color: .yellow)
                self.textColor = .yellow
            }else if sender as? UIButton == self.purpleButton {
                self.changeTextColor(color: .purple)
                self.textColor = .purple
            }else if sender as? UIButton == self.greenButton {
                self.changeTextColor(color: .green)
                self.textColor = .green
            }
        }
    }
    
    @IBAction func tabBackgroundColorButton(_ sender: UIButton) {
        if sender == self.blackButton {
            self.changeBackgroundColor(color: .black)
            self.backgroundColor = .black
        }else if sender == self.blueButton {
            self.changeBackgroundColor(color: .blue)
            self.backgroundColor = .blue
        }else if sender == self.orangeButton {
            self.changeBackgroundColor(color: .orange)
            self.backgroundColor = .orange
        }
    }
    
    @IBAction func tabSaveButton(_ sender: UIButton) {
        self.delegate?.changedSetting(
            text: self.textField.text,
            textColor: self.textColor,
            backgroundColor: self.backgroundColor)
        
        self.navigationController?.popViewController(animated: true)
    }
    
    private func changeTextColor(color : UIColor){
        self.yellowButton.alpha = color == UIColor.yellow ?  1 : 0.2
        self.purpleButton.alpha = color == UIColor.purple ? 1 : 0.2
        self.greenButton.alpha = color == UIColor.green ? 1 : 0.2
    }
    
    private func changeBackgroundColor(color : UIColor){
        self.blackButton.alpha = color == UIColor.black ?  1 : 0.2
        self.blueButton.alpha = color == UIColor.blue ? 1 : 0.2
        self.orangeButton.alpha = color == UIColor.orange ? 1 : 0.2
    }
}
