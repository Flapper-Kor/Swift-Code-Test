//
//  UsingAttributedString9.swift
//  Text
//
//  Created by Slash on 2023/07/29.
//

import SwiftUI

struct UsingAttributedString9: View {
    var body: some View {
        Text(message)
    }
    
    var message: AttributedString {
        let amount = Measurement(value: 200, unit: UnitLength.kilometers)
        var result = amount.formatted(.measurement(width: .wide).attributed)

        let distanceStyling = AttributeContainer.font(.title)
        let distance = AttributeContainer.measurement(.value)
        result.replaceAttributes(distance, with: distanceStyling)

        return result
    }
}

struct UsingAttributedString9_Previews: PreviewProvider {
    static var previews: some View {
        UsingAttributedString9()
    }
}
