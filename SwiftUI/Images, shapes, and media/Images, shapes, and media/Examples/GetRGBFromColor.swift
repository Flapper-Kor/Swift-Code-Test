//
//  GetRGBFromColor.swift
//  Images, shapes, and media
//
//  Created by Flapper on 2/9/24.
//

/*
 New in iOS 17

 SwiftUI’s Color view doesn’t always hold one specific color, and instead is only resolved to a specific value when it’s being drawn on the screen. This allows the system to use slight variations between light and dark mode to ensure the optimal experience, but it also means the only way to get actual red, green, and blue (RGB) components out is to ask for the resolved color – ask the system “given this environment, what actual color values are being used?”

 Resolving takes two steps: gaining access to the current environment, and pass that into a call to resolve(in:) on your color. You can then save the resulting data using Codable or whatever other data form you want.

 For example, this lets the user choose any color they want, and displays its red, green, and blue components:
 */

import SwiftUI

@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)
struct GetRGBFromColor: View {
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

@available(iOS, deprecated: 17.0, message: "iOS 17.0 include Color.Resolved & color.resolve built-in")
@available(macOS, deprecated: 14.0, message: "macOS 14.0 include Color.Resolved & color.resolve built-in")
@available(tvOS, deprecated: 17.0, message: "tvOS 17.0 include Color.Resolved & color.resolve built-in")
@available(watchOS, deprecated: 10.0, message: "watchOS 10.0 include Color.Resolved & color.resolve built-in")
struct GetRGBFromColor_obsolated : View{
    @Environment(\.self) var environment
    @State private var color = Color.red
    @State private var resolvedColor: Color.Resolved_obsoleted?
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
        .onChange_obsoleted(of: color, initial: true, getColor)
    }

    func getColor() {
        resolvedColor = color.resolve_obsoleted(in: environment)

        if let colorData = try? JSONEncoder().encode(resolvedColor) {
            colorJSON = String(decoding: colorData, as: UTF8.self)
            print("-----")
            print(colorData)
        }
    }
}


#Preview {
    if #available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *){
        GetRGBFromColor()
    }
    else{
        GetRGBFromColor_obsolated()
    }
}


// MARK: - the way of extract color component
// MARK: this functions are built-in functions in iOS 17.0 or later

extension Color {
    
    @available(iOS, deprecated: 17.0, message: "iOS 17 include This built-in")
    @available(macOS, deprecated: 14.0, message: "macOS 14.0 include This built-in")
    @available(tvOS, deprecated: 17.0, message: "tvOS 17.0 include This built-in")
    @available(watchOS, deprecated: 10.0, message: "watchOS 10.0 include This built-in")
    struct Resolved_obsoleted : Encodable, Decodable{
        private var _red : Float?
        private var _green : Float?
        private var _blue : Float?
        private var _opacity : Float?
        
        var red : Float{
            get { guard let _red else { return 0}; return _red }
            set { _red = newValue }
        }
        var green : Float{
            get { guard let _green else { return 0}; return _green }
            set { _green = newValue }
        }
        var blue : Float{
            get { guard let _blue else { return 0}; return _blue }
            set { _blue = newValue }
        }
        var opacity : Float{
            get { guard let _opacity else { return 0}; return _opacity }
            set { _opacity = newValue }
        }

        init(red: Float? = nil, green: Float? = nil, blue: Float? = nil, opacity: Float? = nil) {
            self._red = red
            self._green = green
            self._blue = blue
            self._opacity = opacity
        }
        
        // to similar output of 17.0 Color.Resolved
        // Use unkeyedContainer
        init(from decoder: Decoder) throws {
            var container = try decoder.unkeyedContainer()
            red = try container.decode(Float.self)
            green = try container.decode(Float.self)
            blue = try container.decode(Float.self)
            opacity = try container.decode(Float.self)
        }
        
        func encode(to encoder: Encoder) throws {
            var container = encoder.unkeyedContainer()
            try container.encode(Float(self.red))
            try container.encode(Float(self.green))
            try container.encode(Float(self.blue))
            try container.encode(Float(self.opacity))
        }
    }
    
    /**
     the way of extract color component  ------- 1
     
     This Extension for How to extract the elements that make up a color
     
     > Usage :
     ```
     Color.red.components.red // 0.9999999403953552 // <- SwiftUI Colors are not pure!
                                                    // nono floating point values are approximation
     ```
     */
    @available(iOS, deprecated: 17.0, message: "iOS 17 include This built-in")
    @available(macOS, deprecated: 14.0, message: "macOS 14.0 include This built-in")
    @available(tvOS, deprecated: 17.0, message: "tvOS 17.0 include This built-in")
    @available(watchOS, deprecated: 10.0, message: "watchOS 10.0 include This built-in")
    private var _resolved_obsoleted: Resolved_obsoleted{
        #if canImport(UIKit)
        typealias NativeColor = UIColor
        #elseif canImport(AppKit)
        typealias NativeColor = NSColor
        #endif

        var r: CGFloat = 0
        var g: CGFloat = 0
        var b: CGFloat = 0
        var o: CGFloat = 0

        guard NativeColor(self).getRed(&r, green: &g, blue: &b, alpha: &o) else {
            // You can handle the failure here as you want
            return Resolved_obsoleted(red: 1, green: 0, blue: 0, opacity: 0)
        }
        return Resolved_obsoleted(red: Float(r), green: Float(g), blue: Float(b), opacity: Float(o))
    }
    
    @available(iOS, deprecated: 17.0, message: "iOS 17 include This built-in, resolve")
    @available(macOS, deprecated: 14.0, message: "macOS 14.0 include This built-in, resolve")
    @available(tvOS, deprecated: 17.0, message: "tvOS 17.0 include This built-in, resolve")
    @available(watchOS, deprecated: 10.0, message: "watchOS 10.0 include This built-in, resolve")
    func resolve_obsoleted(in: EnvironmentValues) -> Color.Resolved_obsoleted{
        return self._resolved_obsoleted
    }
}

extension View{
    @available(iOS, deprecated: 17.0, message: "iOS 17 include This built-in, named onChange")
    @available(macOS, deprecated: 14.0, message: "macOS 14.0 include This built-in, named onChange")
    @available(tvOS, deprecated: 17.0, message: "tvOS 17.0 include This built-in, named onChange")
    @available(watchOS, deprecated: 10.0, message: "watchOS 10.0 include This built-in, named onChange")
    func onChange_obsoleted<V>(
        of value: V,
        initial: Bool = false,
        _ action: @escaping () -> Void
    ) -> some View where V : Equatable{
        if #available(iOS 17.0, *){
            return self.onChange(of: value, initial: initial, action)
        }else{
            if initial{
                action()
                return self.onChange(of: value) { newValue in
                    action()
                }
            } else {
                return self.onChange(of: value) { newValue in
                    action()
                }
            }
        }
    }
}
