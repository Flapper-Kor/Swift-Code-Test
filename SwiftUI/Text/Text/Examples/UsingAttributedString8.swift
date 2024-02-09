//
//  UsingAttributedString8.swift
//  Text
//
//  Created by Slash on 2023/07/29.
//

import SwiftUI

struct UsingAttributedString8: View {
    var midium: AttributedString {
        var components = PersonNameComponents()
        components.givenName = "Donald"
        components.middleName = "John"
        components.familyName = "Trump"

        var result = components.formatted(.name(style: .medium).attributed)

        let familyNameStyling = AttributeContainer.font(.headline)
        let familyName = AttributeContainer.personNameComponent(.familyName)
        result.replaceAttributes(familyName, with: familyNameStyling)

        return result
    }
    
    var long: AttributedString {
        var components = PersonNameComponents()
        components.givenName = "Donald"
        components.middleName = "John"
        components.familyName = "Trump"

        var result = components.formatted(.name(style: .long).attributed)

        let familyNameStyling = AttributeContainer.font(.headline)
        let familyName = AttributeContainer.personNameComponent(.familyName)
        
        result.replaceAttributes(familyName, with: familyNameStyling)
        

        // 아래와 같이 두번 지정하여 사용할 수 없다.
        // 두번째 replaceAttributes 구문은 무시된다.
        
//        let middleNameAttribute = AttributeContainer.personNameComponent(.middleName)
//        let middleNameStyling = AttributeContainer.font(.subheadline)
//        let middleNameStyling2 = AttributeContainer.foregroundColor(.secondary)
//        result.replaceAttributes(middleNameAttribute, with: middleNameStyling)
//        result.replaceAttributes(middleNameAttribute, with: middleNameStyling2)

        // AttributeContainer 의 프로퍼티는 모두 동일한 AttributeContainer를 반환하므로
        // 체이닝 하여 사용하면 된다.
//        print(type(of: AttributeContainer.font(.subheadline)))
//        print(type(of: AttributeContainer.foregroundColor(.secondary)))
        
        
        let middleNameAttribute = AttributeContainer.personNameComponent(.middleName)
        let middleNameStyling = AttributeContainer.font(.subheadline).foregroundColor(.blue)
        result.replaceAttributes(middleNameAttribute, with: middleNameStyling)

        return result
    }

    var body: some View {
        VStack{
            Text(midium)
            Text(long)
        }
    }
}

struct UsingAttributedString8_Previews: PreviewProvider {
    static var previews: some View {
        UsingAttributedString8()
    }
}
