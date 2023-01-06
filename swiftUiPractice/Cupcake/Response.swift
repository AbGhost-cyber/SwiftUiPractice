//
//  Response.swift
//  swiftUiPractice
//
//  Created by dremobaba on 2023/1/6.
//

import Foundation

struct Response: Codable {
    var results: [Result]
}
struct Result: Codable {
    var trackId: Int
    var trackName: String
    var collectionName: String
}
