//
//  ViewExtensions.swift
//  Z_Example
//
//  Created by Flapper on 3/2/24.
//

//import SwiftUI

//extension View{
//    @available(iOS, deprecated: 17.0, message: "iOS 17 include This built-in, named onChange")
//    @available(macOS, deprecated: 14.0, message: "macOS 14.0 include This built-in, named onChange")
//    @available(tvOS, deprecated: 17.0, message: "tvOS 17.0 include This built-in, named onChange")
//    @available(watchOS, deprecated: 10.0, message: "watchOS 10.0 include This built-in, named onChange")
//    /// 인수가 없는 onchange 버전에 맞게 분기
//    /// - Parameters:
//    ///   - value: <#value description#>
//    ///   - initial: <#initial description#>
//    ///   - action: <#action description#>
//    /// - Returns: <#description#>
//    func onChange_compatibility<V>(
//        of value: V,
//        initial: Bool = false,
//        _ action: @escaping () -> Void
//    ) -> some View where V : Equatable{
//        if #available(iOS 17.0, *){
//            return self.onChange(of: value, initial: initial, action)
//        }else{
//            if initial{
//                action()
//                return self.onChange(of: value) { newValue in
//                    action()
//                }
//            } else {
//                return self.onChange(of: value) { newValue in
//                    action()
//                }
//            }
//        }
//    }
//    
//    func onChange_compatibility<V>(
//        of value: V,
//        initial: Bool = false,
//        _ action: @escaping (V, V) -> Void
//    ) -> some View where V : Equatable{
//        if #available(iOS 17, *){
//            return self.onChange(of: value) { oldValue, newValue in
//                action(oldValue, newValue)
//            }
//        }
//        else{
//            return self.onChange(of: value) { newValue in
//                let oldValue = newValue
//                action(oldValue, newValue)
//            }
//        }
//        
//    }
//}
