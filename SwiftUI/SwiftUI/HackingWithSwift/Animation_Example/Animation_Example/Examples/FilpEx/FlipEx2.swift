import SwiftUI

struct FlipEx2 : View {

    @State var showBack = false

    let sample1 = "If you know you have an unpleasant nature and dislike people, this is no obstacle to work."
    let sample2 = "One thing is for sure – a sheep is not a creature of the air."

    var body : some View {

        let front = CardFace(text: sample1, background: Color.yellow)
        let back = CardFace(text: sample2, background: Color.green)
        
        
        let animatedToggle = Button(action: {
        withAnimation(Animation.linear(duration: 0.8)) {
            self.showBack.toggle()
        }
        }) { Text("Toggle") }

        let k = FlipableView(frontView: front, backView: back, showBack: $showBack)
        
        VStack(alignment: .leading) {
            k
        }.navigationTitle("플립 테스트")
      }
}

struct FlipableView<FrontView: View, BackView: View>: View {

      let frontView: FrontView
      let backView: BackView

      @Binding var showBack: Bool

      var body: some View {
          ZStack() {
                frontView
                  .modifier(FlipOpacity(percentage: showBack ? 0 : 1))
                  .rotation3DEffect(Angle.degrees(showBack ? 180 : 360), axis: (0,1,0))
                backView
                  .modifier(FlipOpacity(percentage: showBack ? 1 : 0))
                  .rotation3DEffect(Angle.degrees(showBack ? 0 : 180), axis: (0,1,0))
          }
          .onTapGesture {
                withAnimation {
                      self.showBack.toggle()
                }
          }
      }
}

private struct FlipOpacity: AnimatableModifier {
   var percentage: CGFloat = 0
   
   var animatableData: CGFloat {
      get { percentage }
      set { percentage = newValue }
   }
   
   func body(content: Content) -> some View {
      content
           .opacity(Double(percentage.rounded()))
   }
}
