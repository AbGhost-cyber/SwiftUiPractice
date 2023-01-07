//
//  Order.swift
//  swiftUiPractice
//
//  Created by dremobaba on 2023/1/6.
//

import Foundation

enum MyCodingKeys: CodingKey {
    case type, quantity, extraFrosting, addSprinkles, name, streetAddress, city, zip
}

class Order : ObservableObject, Codable {
    static let types = ["Vanilla", "Strawberry", "Chocolate", "Rainbow"]
    
    required init(from decoder:Decoder) throws {
        let container = try decoder.container(keyedBy: MyCodingKeys.self)
        type = try container.decode(Int.self, forKey: .type)
        quantity = try container.decode(Int.self, forKey: .quantity)
        
        extraFrosting = try container.decode(Bool.self, forKey: .extraFrosting)
        addSprinkles = try container.decode(Bool.self, forKey: .addSprinkles)
        
        checkout.name = try container.decode(String.self, forKey: .name)
        checkout.streetAddress = try container.decode(String.self, forKey: .streetAddress)
        checkout.city = try container.decode(String.self, forKey: .city)
        checkout.zip = try container.decode(String.self, forKey: .zip)
    }
    init() {}
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: MyCodingKeys.self)
        try container.encode(type, forKey: .type)
        try container.encode(quantity, forKey: .quantity)
        
        try container.encode(extraFrosting, forKey: .extraFrosting)
        try container.encode(addSprinkles, forKey: .addSprinkles)
        
        try container.encode(checkout.name, forKey: .name)
        try container.encode(checkout.streetAddress, forKey: .streetAddress)
        try container.encode(checkout.city, forKey: .city)
        try container.encode(checkout.zip, forKey: .zip)
        
    }
    
    @Published var type = 0
    @Published var quantity = 3
    
    @Published var checkout: CheckoutState = CheckoutState()
    
    @Published var specialRequestEnabled = false{
        didSet {
            if !specialRequestEnabled {
                extraFrosting = false
                addSprinkles = false
            }
        }
    }
    @Published var extraFrosting = false
    @Published var addSprinkles = false
    
    var cost: Double {
        // $2 per cake
        var cost = Double(quantity) * 2
        
        // complicated cakes cost more
        cost += (Double(type) / 2)
        
        // $1/cake for extra frosting
        if extraFrosting {
            cost += Double(quantity)
        }
        
        // $0.50/cake for sprinkles
        if addSprinkles {
            cost += Double(quantity) / 2
        }
        
        return cost
    }
    
    struct CheckoutState {
        var name: String = ""
        var streetAddress: String = ""
        var city: String = ""
        var zip: String = ""
        
        func hasValidAddress() -> Bool {
            return !name.isEmpty && !streetAddress.isEmpty && !city.isEmpty && !zip.isEmpty
        }
    }
}
