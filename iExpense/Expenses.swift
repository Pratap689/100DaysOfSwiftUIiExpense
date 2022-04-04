//
//  File.swift
//  iExpense
//
//  Created by Pratap Rana on 03/04/22.
//

import Foundation
import SwiftUI

class Expenses: ObservableObject {
    @Published var items = [ExpenseItem]() {
        didSet {
            let encoder = JSONEncoder()
            if let item = try? encoder.encode(items) {
                UserDefaults.standard.set(item, forKey: "Expense")
            }
        }
    }
    
    init() {
        let decoder = JSONDecoder()
        if let savedItems = UserDefaults.standard.data(forKey: "Expense") {
            if let items = try? decoder.decode([ExpenseItem].self, from: savedItems) {
                self.items = items
                return
            }
        }
        items = []
    }
}
