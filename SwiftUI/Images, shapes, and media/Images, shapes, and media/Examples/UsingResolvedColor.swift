//
//  ResolvedColor.swift
//  Images, shapes, and media
//
//  Created by Slash on 2023/08/02.
//



/*
 New in iOS 17

 SwiftUI’s Color view doesn’t always hold one specific color, and instead is only resolved to a specific value when it’s being drawn on the screen. This allows the system to use slight variations between light and dark mode to ensure the optimal experience, but it also means the only way to get actual red, green, and blue (RGB) components out is to ask for the resolved color – ask the system “given this environment, what actual color values are being used?”

 Resolving takes two steps: gaining access to the current environment, and pass that into a call to resolve(in:) on your color. You can then save the resulting data using Codable or whatever other data form you want.

 For example, this lets the user choose any color they want, and displays its red, green, and blue components:
 */

import SwiftUI

struct UsingResolvedColor_ex1 : View{
    @Environment(\.self) var environment
    @State private var color = Color.red
    @State private var resolvedColor: Color.Resolved?

    var body: some View {
        VStack {
            ColorPicker("Select your favorite color", selection: $color)

            if let resolvedColor {
                Text("Red: \(resolvedColor.red)")
                Text("Green: \(resolvedColor.green)")
                Text("Blue: \(resolvedColor.blue)")
                Text("Opacity: \(resolvedColor.opacity)")
            }
        }
        .padding()
        
//MARK: - iOS 16 or earlier below
        .onChange(of: color, perform: { newValue in
            getColor()
        })
        .task {
            getColor()
        }
//MARK: - iOS 17 or later (built-in)
//        .onChange(of: color, initial: true, getColor)

    }

    func getColor() {
        resolvedColor = color.resolve(in: environment)
    }
}

struct UsingResolvedColor_ex2: View{
    @Environment(\.self) var environment
    @State private var color = Color.red

    @State private var resolvedColor: Color.Resolved?
    @State private var colorJSON = ""

    var body: some View {
        VStack {
            ColorPicker("Select your favorite color", selection: $color)

            if let resolvedColor {
                Text("Red: \(resolvedColor.red)")
                Text("Green: \(resolvedColor.green)")
                Text("Blue: \(resolvedColor.blue)")
                Text("Opacity: \(resolvedColor.opacity)")
            }

            Text("Color JSON: \(colorJSON)")
        }
        .padding()
        .onChange(of: color, initial: true, getColor)
    }

    func getColor() {
        resolvedColor = color.resolve(in: environment)

        if let colorData = try? JSONEncoder().encode(resolvedColor) {
            colorJSON = String(decoding: colorData, as: UTF8.self)
        }
    }
}


struct UsingResolvedColor: View {
    var body: some View{
        VStack{
            UsingResolvedColor_ex1()
            UsingResolvedColor_ex2()
        }
    }
}

struct UsingResolvedColor_Previews: PreviewProvider {
    static var previews: some View {
        UsingResolvedColor()
    }
}
