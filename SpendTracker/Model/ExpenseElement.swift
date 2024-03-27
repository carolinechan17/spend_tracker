//
//  ExpenseModel.swift
//  MoneyMinder
//
//  Created by Caroline Chan on 25/03/24.
//

import Foundation

struct ExpenseElement: Identifiable{
    let id: UUID = UUID()
    var name: String
    var date: String
    var nominal: Int
}

var dummyExpense: [ExpenseElement] = [
    ExpenseElement(name: "Item A", date: "21 March 2024", nominal: 50000),
    ExpenseElement(name: "Item B", date: "21 March 2024", nominal: 50000),
    ExpenseElement(name: "Item C", date: "21 March 2024", nominal: 50000),
]

struct ExpensesModel: Identifiable {
    let id: UUID = UUID()
    let categoryIndex: Int
    var expenses: [ExpenseElement]
    var total: Int
}
