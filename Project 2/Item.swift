//
//  Item.swift
//  Project 2
//
//  Created by LangHui on 10/17/21.
//

import UIKit

class Item : Equatable, Codable {
    var name: String
    var valueInDollars: Int
    var quantity: Int
    var serialNumber: String?
    let dateCreated: Date
    var dateMotified: Date
    var subTotal: Int
    
    init(name: String, serialNumber: String?, quantity: Int, valueInDollars: Int) {
            self.name = name
            self.valueInDollars = valueInDollars
            self.quantity = quantity
            self.serialNumber = serialNumber
            self.dateCreated = Date()
            self.dateMotified = Date()
            self.subTotal = self.quantity * self.valueInDollars
    }
    
    convenience init(random: Bool = false) {
        if random {
            let names = ["Apple", "Banana", "Orange"]
            
            let randomName = "\(names.randomElement()!)"
            let randomQuantity = Int.random(in: 0..<100)
            let randomValue = Int.random(in: 0..<100)
            
            let randomSerialNumber =
                UUID().uuidString.components(separatedBy: "-").first!
            
            self.init(name: randomName, serialNumber: randomSerialNumber, quantity: randomQuantity, valueInDollars: randomValue)
        } else {
            self.init(name: "", serialNumber: nil, quantity: 0, valueInDollars: 0)
        }
    }
    
    static func ==(lhs: Item, rhs: Item) -> Bool {
            return lhs.name == rhs.name
                && lhs.serialNumber == rhs.serialNumber
                && lhs.valueInDollars == rhs.valueInDollars
                && lhs.dateCreated == rhs.dateCreated
                && lhs.quantity == rhs.quantity
        }
    
    func updateSubtotal(){
        self.subTotal = self.valueInDollars * self.quantity
    }
}
