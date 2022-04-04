//
//  ExpenseItem.swift
//  iExpense
//
//  Created by Pratap Rana on 03/04/22.
//

import Foundation
import SwiftUI

struct ExpenseItem: Identifiable, Codable {
    var id = UUID()
    let name: String
    let amount: Double
    let type: String
}

