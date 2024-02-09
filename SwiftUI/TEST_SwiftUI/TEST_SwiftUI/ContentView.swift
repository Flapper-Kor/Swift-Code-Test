import SwiftUI



struct ContentView: View {
    @State private var isPresented = false

    var body: some View {
        HStack(spacing: 10) {
            Text("나랏말싸미 듕귁에 달아 문자와로 서르 사맛디 아니할쎄")
                .padding()
                .frame(maxHeight: .infinity)
                .background(Color.blue)
               
            Text("이런 전차로 어린 백셩이 니르고져 홇베이셔도")
                .padding()
                .frame(maxHeight: .infinity)
                .background(Color.green)
                
            Text("마참네 제 뜨들 시러펴디 몯핧 노미하니아 내 이랄 윙하야 어엿비너겨 새로 스믈 여듫 짜랄 맹가노니")
                .padding()
                .frame(maxHeight: .infinity)
                .background(Color(CGColor(red: 50/255, green: 50/255, blue: 50/255, alpha: 0.7)))
               
        }
        //높이가 동일하게
        .fixedSize(horizontal: false, vertical: true)
        .frame(maxHeight: 200)
        .kerning(2.0)
        .background(Color.purple)
    }
}

//struct ContentView: View {
//    @State var presentingModal = false
//
//    var body: some View {
//        VStack {
//            Button("Present") { self.presentingModal = true }
//                   .sheet(isPresented: $presentingModal) { ModalView(presentedAsModal: self.$presentingModal) }
//        }
//        .padding()
//    }
//}
//
//struct ModalView: View {
//    @Binding var presentedAsModal: Bool
//    var body: some View {
//        Button("dismiss") { self.presentedAsModal = false }
//    }
//}
