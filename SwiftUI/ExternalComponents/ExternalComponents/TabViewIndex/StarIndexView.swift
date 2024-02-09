//
//  StarIndexView.swift
//  ExternalComponents
//
//  Created by Slash on 2023/07/06.
//

import SwiftUI

struct StarIndexView: View {
  
    // MARK: - Public Properties

    var numberOfPages: Decimal
    var currentIndex: Decimal


    // MARK: - Drawing Constants

    private let lineWidth: CGFloat = 1.0
//    private let cornerRadius: CGFloat = 15.0
    private let length: CGFloat = 30.0
    private let foregroundColor = Color.white

    // increase currentIndex to compensate for arrays that start with index 0
    private var startTrim: CGFloat {
//        numberOfPages.truncatingRemainder(dividingBy: 2) == 0
//        ? CGFloat((1 / numberOfPages) * currentIndex) // even
//        : CGFloat((1 / numberOfPages) * currentIndex) // odd
        CGFloat(Double(truncating: ((1 / numberOfPages) * currentIndex) as NSNumber))
    }

    private var endTrim: CGFloat {
        CGFloat(Double(truncating: ((1 / numberOfPages) * (currentIndex + 1)) as NSNumber))
//        CGFloat((1 / numberOfPages) * (currentIndex + 1))
    }


    // MARK: - Body
    var body: some View {
        let _ = print(startTrim, endTrim)
        VStack{
            Spacer()
            ZStack {
                Star(corners: Double(truncating: numberOfPages as NSNumber), smoothness: 0.5)
                    .trim(from: startTrim, to: endTrim)
                    .stroke(foregroundColor, lineWidth: lineWidth)
//                    .rotationEffect(.degrees(-90))
                
                Star(corners: Double(truncating: numberOfPages as NSNumber), smoothness: 0.5)
                    .stroke(foregroundColor.opacity(0.3), lineWidth: lineWidth)
            }
            .frame(width: length, height: length)
            .padding(10)
        }
    } // end of body
}


struct StarIndexView_Previews: PreviewProvider {
    static var previews: some View {
        StarIndexView(numberOfPages: 10, currentIndex: 0)
    }
}
