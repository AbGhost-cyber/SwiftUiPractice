//
//  Expenses.swift
//  swiftUiPractice
//
//  Created by dremobaba on 2023/1/2.
//

import Foundation
typealias ExpensesGroup = Dictionary<String, [ExpenseItem]>
extension Double {
    func roundToTwoDecimal() -> Double {
        return (self * 100).rounded() / 100
    }
}
class Expenses: ObservableObject {
    @Published var groupedExpenses: ExpensesGroup = [:] {
        didSet {
            calcTotalExpenses()
        }
    }
    var totalExpenses = 0.0
    
    func addExpenses(_ expenseItem: ExpenseItem) {
        var list = groupedExpenses[expenseItem.type] ?? []
        list.append(expenseItem)
        groupedExpenses[expenseItem.type] = list
    }
    
    func removeExpense(at offset: IndexSet, group: String) {
        if groupedExpenses.isEmpty {return}
        var list = groupedExpenses[group] ?? []
        list.remove(atOffsets: offset)
        groupedExpenses[group] = list
        
        if list.isEmpty {
            groupedExpenses.removeValue(forKey: group)
        }
    }
    
    func calcTotalExpenses() {
        var total = 0.0
        if groupedExpenses.isEmpty {return}
        
        for item in groupedExpenses.values {
            for i in item.indices {
                let expense = item[i]
                total += expense.amount
            }
        }
        totalExpenses = total.roundToTwoDecimal()
    }
}
