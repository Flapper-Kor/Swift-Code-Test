import SwiftUI

extension AnyTransition{
    static var moveAndFade: AnyTransition{
//        AnyTransition.slide
//        AnyTransition.move(edge: .trailing)
        .asymmetric(
            insertion: .move(edge:.trailing).combined(with:.opacity),
            removal: .scale.combined(with: .opacity))
    }
}


struct HikeView: View {
    var hike: Hike
    @State private var showDetail = false
    
    var body: some View {
        VStack {
            HStack {
                HikeGraph(hike: hike, path: \.elevation)
                    .frame(width: 50, height: 30)

                VStack(alignment: .leading) {
                    Text(hike.name)
                        .font(.headline)
                    Text(hike.distanceText)
                }

                Spacer()

                Button {
//                    withAnimation(.easeInOut(duration: 0.8)){
                    withAnimation{
                        showDetail.toggle()
                    }
                    
                } label: {
                    Label("Graph", systemImage: "chevron.right.circle")
                        .labelStyle(.iconOnly)
                        .imageScale(.large)
                        .rotationEffect(.degrees(showDetail ? 90 : 0))
//                        .animation(nil, value: showDetail)
                        // 애니메이션 적용 범위는 에니메이션 modifier 적용 이전의 모든 개체에 포함된다.
                        .scaleEffect(showDetail ? 1.5 : 1)
                        .padding()
//                        .animation(.spring(response: 0.5, dampingFraction: 1, blendDuration: 0.5), value: showDetail)
                }
            }

            if showDetail {
                HikeDetail(hike: hike)
                    .transition(.moveAndFade)
            }
        }
    }
}

struct HikeView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            HikeView(hike: ModelData().hikes[0])
                .padding()
            Spacer()
        }
    }
}
