//
//  AddView.swift
//  swiftUiPractice
//
//  Created by dremobaba on 2023/1/2.
//

import SwiftUI



struct AddViewState {
    var name = ""
    var type = Types.personal
    var amount = 0.0
    
    func isValid() -> Bool {
        return !name.isEmpty && !amount.isNaN && !String(amount).isEmpty && amount > 0.0
    }
}
enum Types: String, CaseIterable{
    case business = "Business"
    case personal = "Personal"
}


struct AddView: View {
    @State private var state: AddViewState = AddViewState()
    let types = Types.allCases
    @ObservedObject var expenses: Expenses
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack {
            Form {
                TextField("please input expense name", text: $state.name)
                Picker("Type", selection: $state.type) {
                    ForEach(types, id:\.self) { type in
                        Text(type.rawValue)
                    }
                }
                TextField("please input amount", value: $state.amount, format:.currency(code: "USD"))
                    .keyboardType(.decimalPad)
            }
            .navigationTitle("Add new expense")
            .toolbar {
                Button {
                    if state.isValid(){
                        expenses.addExpenses(ExpenseItem(name: state.name, type: state.type.rawValue, amount: state.amount))
                        dismiss()
                    }
                } label: {
                    Text("Save")
                        .foregroundColor(state.isValid() ? .accentColor : .gray)
                    
                }
            }
        }
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView(expenses: Expenses())
    }
}
