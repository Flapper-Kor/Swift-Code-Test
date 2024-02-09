//
//  UsingAttributedString4.swift
//  Text
//
//  Created by Slash on 2023/07/28.
//

import SwiftUI

struct UsingAttributedString4: View {
    @State var offset = 0
    @State var isVisible = false
    @State var isActive = false
    let timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        VStack{
            Spacer()
            Text(message)

            Spacer()
            Button {
//                sinval += 1
                
//                taskForAsync()

//                moreEfficientIncrease(isActive: $isActive)
                
                isActive.toggle()
                
            } label: {
                if isActive {
                    Text("Stop")
                }else{
                    Text("Start")
                }
            }
            Spacer()
            
            Button {
//                sinval += 1
                
//                taskForAsync()

                moreEfficientIncrease(isActive: $isActive)
                
//                isActive.toggle()
                
            } label: {
                if isActive {
                    Text("Stop")
                }else{
                    Text("Start")
                }
            }
            
            
            
            
            Button {
                isVisible.toggle()
            } label: {
                Text("TEST")
            }
            
            if(isVisible){
                Text("TEST For Async")
            }
            Spacer(minLength: 50)
            
        }
        // best solution - smooth with animation and toggle
        // but consider how much resource are used by timer
        .onReceive(timer) { _ in
            withAnimation {
                if isActive {
                    self.offset += 1
                } else {

                }
            }
        }
    }
    
    var message: AttributedString {
        let string = "The letters go up and down"
        var result = AttributedString()
        
        for (index, letter) in string.enumerated() {
            var letterString = AttributedString(String(letter))
            letterString.baselineOffset = sin(Double(index + offset)) * 5
            result += letterString
        }
        result.font = .largeTitle
        
        return result
    }
    
    func moreEfficientIncrease(isActive : Binding<Bool>){
        isActive.wrappedValue.toggle()
        Task {
            while isActive.wrappedValue {
                self.offset += 1
                try await Task.sleep(nanoseconds: 100_000_000)
            }
        }
    }
    
    func increase() async {
        var i = 0
        while i < 20{
            self.offset += 1
            i += 1
            sleep(UInt32(0.9 * 2))
        }
    }
    
    func taskForAsync(){
        Task{
            await increase()
        }
    }
}

struct UsingAttributedString4_Previews: PreviewProvider {
    static var previews: some View {
        UsingAttributedString4()
    }
}
