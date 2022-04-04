//
//  AddExpenseView.swift
//  iExpense
//
//  Created by Pratap Rana on 03/04/22.
//

import SwiftUI

struct AddExpenseView: View {
    
    @State private var name: String = ""
    @State private var amount: Double = 0.0
    
    @State private var type = "Personal"
    @State private var expenseTypes = ["Personal", "Business", "Paty"]
    @ObservedObject var expense = Expenses()
    @State private var showAlert = false
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Name", text: $name)
                Picker("Expense Type", selection: $type) {
                    ForEach(expenseTypes, id: \.self) {
                        Text($0)
                    }
                }
                TextField("Amount", value: $amount, format: .currency(code: Locale.current.currencyCode ?? "USD"))
                    .keyboardType(.decimalPad)
                
            }
            .navigationTitle("Add Expense")
            .alert(isPresented: $showAlert, content: {
                Alert(title: Text("Error"), message: Text("Enter Name or Amount"), dismissButton: .none)
            })
            .toolbar {
                Button("Save") {
                    if name.isEmpty || amount == 0 {
                        showAlert = true
                        return
                    }
                    expense.items.append(ExpenseItem(name: name, amount: amount, type: type))
                    dismiss()
                }
                
            }
        }
    }
}

struct AddExpenseView_Previews: PreviewProvider {
    static var previews: some View {
        AddExpenseView()
    }
}
