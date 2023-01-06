//
//  User.swift
//  swiftUiPractice
//
//  Created by dremobaba on 2023/1/6.
//

import Foundation

enum CodingKeys: CodingKey {
    case name
}
class User: ObservableObject, Codable {
    @Published var name = "Ab dremo"
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        name = try container.decode(String.self, forKey: .name)
    }
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(name, forKey: .name)
    }
}
