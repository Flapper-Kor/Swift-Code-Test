//
//  FommatText.swift
//  Text
//
//  Created by Slash on 2023/07/29.
//

/*
 Updated in iOS 15

 SwiftUI’s text views are capable of showing dates, arrays, measurements and more, all through their format parameter. However, this is available only in iOS 15, so for iOS 14 and 13 support please see the formatter parameter below.
 */

import SwiftUI

struct FommatText: View {
    @State private var ingredients = [String]()
    @State private var rolls = [Int]()
    
    let length = Measurement(value: 225, unit: UnitLength.centimeters)
    
    let formatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        return formatter
    }()
    static let taskDateFormat: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        return formatter
    }()
    
    @State var score : Int = 0
    
    var body: some View {
        VStack {
            
            // MARK: - .list()
            Text(ingredients, format: .list(type: .and))

            Button("Add Ingredient") {
                let possibles = ["Egg", "Sausage", "Bacon", "Spam"]

                if let newIngredient = possibles.randomElement() {
                    ingredients.append(newIngredient)
                }
            }
            
            Text(rolls, format: .list(memberStyle: .number, type: .and))

            Button("Roll Dice") {
                let result = Int.random(in: 1...6)
                rolls.append(result)
            }
            
            // MARK: - .measurement
            Text(length, format: .measurement(width: .wide))
            
            // MARK: - currency
            Text(72.3, format: .currency(code: "krw"))
                .task {
                    for i in Locale.Currency.isoCurrencies {
                        print(i, type(of: i))
                    }
                }
            // MARK: - NumberFormatter
            VStack {
                TextField("Enter your score", value: $score, formatter: formatter)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
            }
            
            // MARK: - Date Formatter
            let dueDate = Date.now

            Text("Task due date: \(dueDate, formatter: Self.taskDateFormat)")
        }
    }
}

struct FommatText_Previews: PreviewProvider {
    static var previews: some View {
        FommatText()
    }
}
