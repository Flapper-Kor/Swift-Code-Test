//
//  DynamicSFSymbol.swift
//  Images, shapes, and media
//
//  Created by Slash on 2023/08/02.
//

import SwiftUI

struct DynamicSFSymbol: View {
    
    @State private var value = 0.0

    var body: some View {
        VStack {
            Image(systemName: "wifi", variableValue: 0.5)
            
            HStack {
                Image(systemName: "aqi.low", variableValue: value)
                Image(systemName: "wifi", variableValue: value)
                Image(systemName: "chart.bar.fill", variableValue: value)
                Image(systemName: "waveform", variableValue: value)
            }

            Slider(value: $value)
        }
        .font(.system(size: 72))
        .foregroundStyle(.blue)
        .padding()
    }
}

struct DynamicSFSymbol_Previews: PreviewProvider {
    static var previews: some View {
        DynamicSFSymbol()
    }
}
