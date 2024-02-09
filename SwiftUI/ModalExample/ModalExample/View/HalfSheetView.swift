//
//  HalfModalView.swift
//  ModalExample
//
//  Created by 이희웅 on 2023/06/09.
//

import SwiftUI

struct HalfSheetView<Content>: UIViewControllerRepresentable where Content : View {

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

struct HalfModalView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
