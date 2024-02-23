//
//  OverrideAnimation.swift
//  Animation_Example
//
//  Created by Slash on 2023/07/09.
//
/*
 Updated for Xcode 15 beta 1

 SwiftUI provides a withTransaction() function that allows us to override animations at runtime, for example to remove an implicit animation and replace it with something custom.

 For example, this code toggles some text between small and large sizes, animating all the way because it has an implicit animation attached:
 */
import SwiftUI

struct OverrideAnimation: View {
    @State private var isZoomed = false

    var body: some View {
        
        
        VStack {
            // 1. 일반적인 애니메이션
            Button("normal") {
                isZoomed.toggle()
            }

            Spacer()
            .frame(height: 30)
            
            // transaction 인스턴스 생성 후 withTransaction 함수로 애니메이션 적용
            // 기존에 있는 애니메이션 효과는 overriding(덮어써짐) 됨을 확인가능하다.
            Button("transaction") {
                var transaction = Transaction(animation: .linear)
                transaction.disablesAnimations = true

                withTransaction(transaction) {
                    isZoomed.toggle()
                }
            }
            Spacer()
            .frame(height: 100)
            
            Text("Zoom Text")
            .font(.title)
            .scaleEffect(isZoomed ? 3 : 1)
            .animation(.easeInOut(duration: 2), value: isZoomed)
            
            
            // 같은 애니메이션 이벤트에 대한 애니메이션을 재정의 하여 사용하고 싶으면 싶으면
            // 다른 콤포넌트에서 modifier를 사용해 적용 가능하다.
            // 이 또한 modifier 에서 인스턴스의 프로퍼티를 덮어쓰는 함수를 일시적으로 전달하기 때문에
            // 해당 트랜젝션에서의 애니메이션은 오버라이딩 된다.
            Text("Zoom Text 2")
            .font(.title)
            .scaleEffect(isZoomed ? 3 : 1)
            .transaction { t in
                t.animation = .none
//                t.animation = .easeIn
            }
            .animation(.easeInOut(duration: 2), value: isZoomed) // 이 구문은 적용되지 않음

            
            Spacer()
            .frame(height: 100)

            // 코드의 순서에 상관없이 오버라이딩 되는 우선순위는
            // transaction modifier  -> transcation 프로퍼티 선언 -> animation modifier
        }
    }
}

struct OverrideAnimation_Previews: PreviewProvider {
    static var previews: some View {
        OverrideAnimation()
    }
}
