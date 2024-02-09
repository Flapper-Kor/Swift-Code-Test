//
//  AnimationWithTimelineView.swift
//  Drawing
//
//  Created by Slash on 2023/07/05.
//

import SwiftUI

struct Raindrop: Hashable, Equatable {
    var x: Double
    var removalDate: Date
    var speed: Double
}

class Storm: ObservableObject {
    var drops = Set<Raindrop>()

    func update(to date: Date) {
        drops = drops.filter { $0.removalDate > date }
        drops.insert(Raindrop(x: Double.random(in: 0...1), removalDate: date + 1, speed: Double.random(in: 1...2)))
    }
}

struct AnimationWithTimelineView: View {
    @StateObject private var storm = Storm()
    let rainColor = Color(red: 0.25, green: 0.5, blue: 0.75)

    var body: some View {
            
        TimelineView(.animation) { timeline in
            Canvas { context, size in
                storm.update(to: timeline.date)

                for drop in storm.drops {
                    let age = timeline.date.distance(to: drop.removalDate)
                    let rect = CGRect(x: drop.x * size.width, y: size.height - (size.height * age * drop.speed), width: 2, height: 10)
                    let shape = Capsule().path(in: rect)
                    context.fill(shape, with: .color(rainColor))
                }
            }
        }
        .background(.black)
        .ignoresSafeArea()
    }
}

struct AnimationWithTimelineView_Previews: PreviewProvider {
    static var previews: some View {
        AnimationWithTimelineView()
    }
}
