//
//  MyChildView.swift
//  swiftUiPractice
//
//  Created by dremobaba on 2023/1/2.
//

import SwiftUI

struct MyChildView: View {
    let expense: ExpenseItem
    var body: some View {
        HStack {
            Text(expense.name)
                .font(.headline)
            Spacer()
            Text(-expense.amount, format: .currency(code: "USD"))
                .foregroundColor(.red)
                .font(.body)
        }
        .padding(25)
    }
}

struct MyChildView_Previews: PreviewProvider {
    static var previews: some View {
        MyChildView(expense: ExpenseItem(name: "Ab", type: "Personal", amount: 120))
    }
}
