//
//  SpendTrackerViewModel.swift
//  SpendTracker
//
//  Created by Caroline Chan on 27/03/24.
//

import Foundation
import SwiftUI

var items: [ExpensesModel] = [
    ExpensesModel(categoryIndex: 0, expenses: [ExpenseElement(name: "Kentang Goreng", date: "27/03/2024", nominal: 20000)], total: 20000),
    ExpensesModel(categoryIndex: 1, expenses: [ExpenseElement(name: "Obat Demam", date: "27/03/2024", nominal: 50000)], total: 50000),
    ExpensesModel(categoryIndex: 2, expenses: [ExpenseElement(name: "Celana Panjang", date: "27/03/2024", nominal: 150000)], total: 150000),
    ExpensesModel(categoryIndex: 3, expenses: [], total: 0),
    ExpensesModel(categoryIndex: 4, expenses: [], total: 0),
    ExpensesModel(categoryIndex: 5, expenses: [], total: 0),
    ExpensesModel(categoryIndex: 6, expenses: [], total: 0),
    ExpensesModel(categoryIndex: 7, expenses: [], total: 0),
    ExpensesModel(categoryIndex: 8, expenses: [], total: 0),
]

func addExpense(data: ExpenseElement, categoryIndex: Int) {
    items[categoryIndex].expenses.append(data)
    items[categoryIndex].total += data.nominal
}

func editExpense(data: ExpenseElement, categoryIndex: Int) {
    let index = items[categoryIndex].expenses.firstIndex(where: {$0.name == data.name})
    items[categoryIndex].total -= items[categoryIndex].expenses[index!].nominal
    items[categoryIndex].expenses[index!].name = data.name
    items[categoryIndex].expenses[index!].date = data.date
    items[categoryIndex].expenses[index!].nominal = data.nominal
    items[categoryIndex].total += items[categoryIndex].expenses[index!].nominal
}

func deleteExpense(index: Int, categoryIndex: Int) {
    let temp = items[categoryIndex].expenses[index].nominal
    items[categoryIndex].expenses.remove(at: index)
    items[categoryIndex].total -= temp
}

func calculateTotalSpending() -> Int{
    var totalSpendings = 0
    for item in items {
        totalSpendings += item.total
    }
    return totalSpendings
}

func sortByCategory() -> [ExpensesModel] {
    var sortedItems = items.sorted(by: {
        $0.total > $1.total
    })
    sortedItems = sortedItems.filter { $0.total != 0}
    print("SORTED ITEMS: \(sortedItems)")
    return sortedItems
}

func getColors(data: [ExpensesModel]) -> [Color] {
    var colors: [Color] = []
    for item in data {
        print(item.categoryIndex)
        colors.append(Color(hex: expenseCategories[item.categoryIndex].color))
    }
    return colors
}
