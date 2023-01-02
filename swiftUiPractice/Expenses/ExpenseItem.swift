//
//  ExpenseItem.swift
//  swiftUiPractice
//
//  Created by dremobaba on 2023/1/2.
//

import Foundation

struct ExpenseItem: Identifiable {
    let id = UUID()
    let name: String
    let type: String
    let amount: Double
}
