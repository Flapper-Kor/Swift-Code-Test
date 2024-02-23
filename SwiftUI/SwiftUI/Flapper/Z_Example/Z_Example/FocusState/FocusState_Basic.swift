//
//  FocusState_Basic.swift
//  Z_Example
//
//  Created by Flapper on 2/22/24.
//
/*
 @FocusState 는 하나의 뷰에 포커싱을 제어하기 위해 사용한다.
 뷰를 떠나는 순간 상태를 잃는다.
 */
import SwiftUI

struct FocusState_Basic: View {
    @State private var username = ""
    @State private var password = ""

    var body: some View {
        NavigationView {
            NavigationLink {
                LoginForm(username: $username, password: $password)
            } label: {
                Text("Join")
            }
        }
    }
}

// 아래는 @FocusState에 관한 간단한 예시
// FocusState 중 하나라도 비어있을 경우 해당 필드로 포커스가 이동
// 단 이러한 포커스 state 는 아래 예처럼 hashable 사용해야 하고
// 서로 다른 뷰에 중복된 equals 값의 사용을 피한다. 또 중첩된 focused modifier 는 사용하지 않는다.
// @FocusState 문서 참조
struct LoginForm: View{
    enum Field: Hashable {
        case usr
        case pwd
    }

    @Binding var username : String
    @Binding var password : String
    @FocusState private var focusedField: Field?

    var body: some View {
        List { // List 와 비슷한 역할
            TextField("Username", text: $username)
                .focused($focusedField, equals: .usr)

            SecureField("Password", text: $password)
                .focused($focusedField, equals: .pwd)

            Button("Sign In") {
                if username.isEmpty {
                    // 여기가 비어있으면, 이 필드로 이동함
                    focusedField = .usr
                } else if password.isEmpty {
                    focusedField = .pwd
                } else {
                    handleLogin(name: $username, password: $password)
                }
            }
        }
    }
    
    public func handleLogin(name: Binding<String>, password: Binding<String>){
        print(name, password)
    }
}



#Preview {
    ContentView()
}
