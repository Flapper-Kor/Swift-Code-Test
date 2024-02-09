//
//  ColorExtension.swift
//  Images, shapes, and media
//
//  Created by Slash on 2023/08/02.
//

import SwiftUI

#if canImport(UIKit)
import UIKit
#elseif canImport(AppKit)
import AppKit
#endif




// MARK: - the way of extract color component
// MARK: this functions are built-in functions in iOS 17.0 or later
@available(iOS, obsoleted: 17.0)
extension Color {
    struct resolved : Encodable{
        private var _red : Double?
        private var _green : Double?
        private var _blue : Double?
        private var _opacity : Double?
        
        enum CodingKeys : String, CodingKey{
            case _red = "red"
            case _green = "green"
            case _blue = "blue"
            case _opacity = "opacity"
        }
        
        var red : Double{
            get { guard let _red else { return 0}; return _red }
            set { _red = newValue }
        }
        var green : Double{
            get { guard let _green else { return 0}; return _green }
            set { _green = newValue }
        }
        var blue : Double{
            get { guard let _blue else { return 0}; return _blue }
            set { _blue = newValue }
        }
        var opacity : Double{
            get { guard let _opacity else { return 0}; return _opacity }
            set { _opacity = newValue }
        }
        
        init(red: Double? = nil, green: Double? = nil, blue: Double? = nil, opacity: Double? = nil) {
            self._red = red
            self._green = green
            self._blue = blue
            self._opacity = opacity
        }
        

    }
    typealias Resolved = resolved
    
    
    /**
     the way of extract color component  ------- 1
     
     This Extension for How to extract the elements that make up a color
     
     > Usage :
     ```
     Color.red.components.red // 0.9999999403953552 // <- SwiftUI Colors are not pure!
                                                    // nono floating point values are approximation
     ```
     */
    private var _resolved: Resolved {

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
            return Resolved(red: r, green: g, blue: b, opacity: o)
        }

        return Resolved(red: r, green: g, blue: b, opacity: o)
    }
    
    
    func resolve(in: EnvironmentValues) -> Color.Resolved{
        return self._resolved
    }

//    var hex: String {
//        String(
//            format: "#%02x%02x%02x%02x",
//            Int(_resolved.red == nil ? 0 : _resolved.red! * 255),
//            Int(_resolved.green == nil ? 0 : _resolved.green! * 255),
//            Int(_resolved.blue == nil ? 0 : _resolved.blue! * 255),
//            Int(_resolved.alpha == nil ? 0 : _resolved.alpha! * 255)
//        )
//    }
}
