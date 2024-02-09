//
//  ViewController.swift
//  Calculator
//
//  Created by 이희웅 on 2023/01/02.
//

import UIKit


enum Operation {
    case Add
    case Subtract
    case Divide
    case Multiply
    case Unknown
}

class ViewController: UIViewController {

    @IBOutlet weak var numberOutputLabel: UILabel!
    
    var displayNumber = ""                  // 레이블과 바인딩
    var firstOperand = ""                   // 초기 연산자
    var secondOperand = ""                  // 입력된 연산자
    var result = ""                         // 결과값을 저장
    var currentOperation : Operation = .Unknown //현재 계산기에 입력된 연산자의 값을 저장하는 변수
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func tabNumberButton(_ sender: RoundButton) {
//        guard let numberValue = sender.title(for: .normal) else { return }
//        위의 코드를 사용하면 값이 nil 인 문자열 옵셔널을 받게 된다.
//        따라서 아래의 값을 활용한다.
        
        guard let numberValue = sender.titleLabel?.text else {
            return }
        if self.displayNumber.count < 9 {
            self.displayNumber  += numberValue
            self.numberOutputLabel.text = self.displayNumber
        }
    }
    @IBAction func tabClearButton(_ sender: UIButton) {
        self.displayNumber = ""
        self.firstOperand = ""
        self.secondOperand = ""
        self.result = ""
        self.currentOperation = .Unknown
        self.numberOutputLabel.text = ""
    }
    @IBAction func tapDotButton(_ sender: UIButton) {
        if self.displayNumber.count < 8, !self.displayNumber.contains("."){
            self.displayNumber += self.displayNumber.isEmpty ? "0." : "."
            self.numberOutputLabel.text = self.displayNumber
        }
    }
    @IBAction func tabDivideButton(_ sender: UIButton) {
        self.Operation(.Divide)
    }
    @IBAction func tabMutiplyButton(_ sender: UIButton) {
        self.Operation(.Multiply)
    }
    @IBAction func tabSubtractButton(_ sender: UIButton) {
        self.Operation(.Subtract)
    }
    @IBAction func tabAddButton(_ sender: UIButton) {
        self.Operation(.Add)
    }
    @IBAction func tabEqualButton(_ sender: UIButton) {
        self.Operation(self.currentOperation)
    }
    
    func Operation(_ operation : Operation){
        if self.currentOperation != .Unknown{
            if !self.displayNumber.isEmpty{
                self.secondOperand = self.displayNumber
                self.displayNumber = ""
                
                guard let firstOperand = Double(self.firstOperand) else {return}
                guard let secondOperand = Double(self.secondOperand) else {return}
                
                switch self.currentOperation{
                case .Add :
                    self.result = "\(firstOperand + secondOperand)"
                case .Subtract:
                    self.result = "\(firstOperand - secondOperand)"
                case .Multiply:
                    self.result = "\(firstOperand * secondOperand)"
                case .Divide:
                    self.result = "\(firstOperand / secondOperand)"
                default :
                    break
                }
                
//                self.secondOperand = self.firstOperand
                
                
                if let result = Double(self.result), result.truncatingRemainder(dividingBy: 1) == 0 {
                    self.result = "\(Int(result))"
                }
                
                self.firstOperand = self.result
                self.numberOutputLabel.text = self.result
            }
            self.currentOperation = operation
        } else{
            self.firstOperand = self.displayNumber
            self.currentOperation = operation
            self.displayNumber = ""
        }
    }
}

