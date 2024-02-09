//
//  SquircleIndexView.swift
//  ExternalComponents
//
//  Created by Slash on 2023/07/05.
//

import SwiftUI

struct SquircleIndexView: View {
  
    // MARK: - Public Properties

    let numberOfPages: Decimal
    let currentIndex: Decimal


    // MARK: - Drawing Constants

    private let lineWidth: CGFloat = 4.0
    private let cornerRadius: CGFloat = 15.0
    private let length: CGFloat = 30.0
    private let foregroundColor = Color.white

    // increase currentIndex to compensate for arrays that start with index 0
    private var startTrim: CGFloat {
        CGFloat(Double(truncating: ((1 / numberOfPages) * currentIndex) as NSNumber))
    }

    private var endTrim: CGFloat {
        CGFloat(Double(truncating: ((1 / numberOfPages) * (currentIndex + 1)) as NSNumber))
    }


    // MARK: - Body
    var body: some View {
//        let _ = print(startTrim, endTrim)
        VStack{
            Spacer()
            ZStack {
                RoundedRectangle(cornerRadius: cornerRadius, style: .continuous)
                    .trim(from: startTrim, to: endTrim)
                    .stroke(foregroundColor, lineWidth: lineWidth)
                    .rotationEffect(.degrees(-90))
                
                RoundedRectangle(cornerRadius: cornerRadius, style: .continuous)
                    .stroke(foregroundColor.opacity(0.3), lineWidth: lineWidth)
            }
            .frame(width: length, height: length)
            .padding(10)
        }
    } // end of body
}

struct SquircleIndexView_Previews: PreviewProvider {
    static var previews: some View {
        SquircleIndexView(numberOfPages: 10, currentIndex: 0)
    }
}
