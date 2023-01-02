//
//  ParentView.swift
//  swiftUiPractice
//
//  Created by dremobaba on 2023/1/2.
//

import SwiftUI

struct ParentView: View {
    @State private var showingAddView = false
    @StateObject var expenses = Expenses()
    
    var body: some View {
        NavigationStack {
            if expenses.groupedExpenses.isEmpty {
                Text("No expenses added yet 🕵️")
            }else {
                HStack {
                    Text("Total expenses:")
                        .frame(alignment: .trailing)
                    Text(expenses.totalExpenses, format: .currency(code: "USD"))
                        .bold()
                        .frame(alignment: .trailing)
                }
                .frame(maxWidth: .infinity, alignment: .trailing)
                .padding(.trailing, 8)
                List {
                    ForEach(Array(expenses.groupedExpenses), id: \.key) { group, expenses  in
                        Section {
                            ForEach(expenses) { expense in
                                MyChildView(expense: expense)
                                .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0.1, trailing: 0))
                            }
                            .onDelete { indexSet in
                                self.expenses.removeExpense(at: indexSet, group: group)
                            }
                        } header: {
                            Text(group)
                        }
                    }
                }
                .listStyle(.plain)
            }
        }.sheet(isPresented: $showingAddView) {
            AddView(expenses: expenses)
        }
        .toolbar {
            Button {
                showingAddView = true
            } label: {
                Image(systemName: "plus")
            }
        }
        .navigationTitle("iExpense")
    }
}

struct ParentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            ParentView()
        }
    }
}
