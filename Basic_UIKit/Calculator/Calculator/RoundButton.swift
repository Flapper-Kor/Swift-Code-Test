//
//  RoundButton.swift
//  Calculator
//
//  Created by 이희웅 on 2023/01/02.
//

import UIKit

// IBDesignable 어노테이션은 변경된 설정값을 스토리보드에서 실시간으로 확인할 수 있도록 해준다.
// 하지만 남용하면 스토리보드를 불러올 때마다 빌드를 실행하여 렌더링 하는 것이므로 시스템의 성능저하가 일어날 수 있다.
@IBDesignable
class RoundButton: UIButton {
    // IBInspectable 어노테이션을 붙이면 스토리보드에서 해당 변수의 설정값을 변경할 수 있도록 해준다.
    @IBInspectable var isRound : Bool = false{
        didSet{
            if isRound{
                self.layer.cornerRadius = self.frame.height / 2
            }
        }
    }
}
