//
//  IndexStyle_CustomIndexStyle.swift
//  Z_Example
//
//  Created by Flapper on 2/23/24.
//

import SwiftUI

struct IndexStyle_CustomIndexStyle: View {
    
    @State private var currentIndex = 0
    private let colors: [Color] = [.red, .blue, .green, .yellow]
    
    var body: some View {
        TabView(selection: $currentIndex) {
            ForEach(colors.indices, id: \.self) { index in
                colors[index]
                .tag(index)
            }
        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
        
        .overlay {
            HStack {
                SquircleIndexView(
                    numberOfPages: Decimal(colors.count),
                    currentIndex: Decimal(currentIndex))
                
                StarIndexView(
                    numberOfPages: Decimal(colors.count),
                    currentIndex: Decimal(currentIndex))
//                    numberOfPages: Double(colors.count),
//                    currentIndex: Double(currentIndex))
            }
        }
    }
}

fileprivate struct SquircleIndexView: View {
  
    // MARK: - Public Properties

    var numberOfPages: Decimal
    var currentIndex: Decimal


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


fileprivate struct StarIndexView: View {
  
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


fileprivate struct Star: Shape {
// store how many corners the star has, and how smooth/pointed it is
//    let corners: Int
//    let smoothness: Double
    
    var corners: Double
    var smoothness: Double

    func path(in rect: CGRect) -> Path {
        // draw from the center of our rectangle
        let center = CGPoint(x: rect.width / 2, y: rect.height / 2)
        
        // if coners < 1 return to circle
        guard corners > 1 else {
            var path = Path()
            path.addRoundedRect(in: rect, cornerSize: CGSize(width: rect.width / 2, height: rect.height / 2))
            return path
        }

        // start from directly upwards (as opposed to down or to the right)
        var currentAngle = -CGFloat.pi / 2

        // calculate how much we need to move with each star corner
        let angleAdjustment = .pi * 2 / Double(corners * 2)

        // figure out how much we need to move X/Y for the inner points of the star
        let innerX = center.x * smoothness
        let innerY = center.y * smoothness

        // we're ready to start with our path now
        var path = Path()

        // move to our initial position
        path.move(to: CGPoint(x: center.x * cos(currentAngle), y: center.y * sin(currentAngle)))

        // track the lowest point we draw to, so we can center later
        var bottomEdge: Double = 0

        // loop over all our points/inner points
        for corner in 0..<Int(corners) * 2  {
            // figure out the location of this point
            let sinAngle = sin(currentAngle)
            let cosAngle = cos(currentAngle)
            let bottom: Double

            // if we're a multiple of 2 we are drawing the outer edge of the star
            if corner.isMultiple(of: 2) {
                // store this Y position
                bottom = center.y * sinAngle

                // …and add a line to there
                path.addLine(to: CGPoint(x: center.x * cosAngle, y: bottom))
            } else {
                // we're not a multiple of 2, which means we're drawing an inner point

                // store this Y position
                bottom = innerY * sinAngle

                // …and add a line to there
                path.addLine(to: CGPoint(x: innerX * cosAngle, y: bottom))
            }

            // if this new bottom point is our lowest, stash it away for later
            if bottom > bottomEdge {
                bottomEdge = bottom
            }

            // move on to the next corner
            currentAngle += angleAdjustment
        }

        // figure out how much unused space we have at the bottom of our drawing rectangle
        let unusedSpace = (rect.height / 2 - bottomEdge) / 2

        // create and apply a transform that moves our path down by that amount, centering the shape vertically
        let transform = CGAffineTransform(translationX: center.x, y: center.y + unusedSpace)
        return path.applying(transform)
    }
}
