//
//  Sheet_Basic.swift
//  Z_Example
//
//  Created by Flapper on 2/23/24.
//

import SwiftUI


struct Sheet_Basic: View {
    var body: some View{
        Sheet_Basic_ios17below()
        
            Sheet_Basic_IOS16()
            Sheet_Basic_ios17below()
        
    }
}



struct Sheet_Basic_IOS16: View {
    @State private var showingCredits = false

    var body: some View {
        VStack{
            
        }

    }
}



@available (iOS, obsoleted: 17.0)
@available (macOS, obsoleted: 14.0)
@available (tvOS, obsoleted: 17.0)
@available (watchOS, obsoleted: 10.0)
struct Sheet_Basic_ios17below: View {
    
    @State var isShownSheet = false
    @State var isShownFullScreenCover = false
    
    var body: some View {
 
        VStack {
            
            Button {
                self.isShownSheet.toggle()
            } label: {
                Text("Show sheet")
            }
            .sheet(isPresented: $isShownSheet) {
                Text("sheet view")
                    .onTapGesture {
                        self.isShownSheet.toggle()
                    }.presentationDetents([.fraction(0.7)])
            }
            .padding()
            
            Button {
                self.isShownFullScreenCover.toggle()
            } label: {
                Text("Show Full Screen Cover")
                    .onTapGesture {
                        self.isShownFullScreenCover.toggle()
                    }
            }
            .fullScreenCover(isPresented: $isShownFullScreenCover) {
                Text("Full Screen Cover")
                    .onTapGesture {
                        self.isShownFullScreenCover.toggle()
                    }
            }
        }
    }
}

fileprivate struct HalfSheetView<Content>: UIViewControllerRepresentable where Content : View {

    private let content: Content
    
    @inlinable init(@ViewBuilder content: () -> Content) {
        debugPrint("HalfSheetView initialize...")
        self.content = content()
    }
    
    func makeUIViewController(context: Context) -> HalfSheetController<Content> {
        return HalfSheetController(rootView: content)
    }
    
    func updateUIViewController(_: HalfSheetController<Content>, context: Context) {
        
    }
}

fileprivate class HalfSheetController<Content>: UIHostingController<Content> where Content : View {
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if let presentation = sheetPresentationController {
            presentation.detents = [.medium(), .large()]
            presentation.prefersGrabberVisible = true
            presentation.largestUndimmedDetentIdentifier = .medium
        }
    }
}


#Preview {
    Sheet_Basic()
}
