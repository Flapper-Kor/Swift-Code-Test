//
//  HalfSheetController.swift
//  ModalExample
//
//  Created by 이희웅 on 2023/06/09.
//

import SwiftUI

class HalfSheetController<Content>: UIHostingController<Content> where Content : View {
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if let presentation = sheetPresentationController {
            presentation.detents = [.medium(), .large()]
            presentation.prefersGrabberVisible = true
            presentation.largestUndimmedDetentIdentifier = .medium
        }
    }
}

struct HalfSheetController_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
