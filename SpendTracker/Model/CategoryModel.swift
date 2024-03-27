//
//  CategoryModel.swift
//  SpendTracker
//
//  Created by Caroline Chan on 27/03/24.
//

import Foundation

struct CategoryModel: Identifiable {
    let id: UUID = UUID()
    let name: String
    let color: String
    let icon: String
}

var expenseCategories: [CategoryModel] = [
    CategoryModel(name: "Foods", color: "#F7B500", icon: "fork.knife"),
    CategoryModel(name: "Healthcare", color: "#32C5FF", icon: "cross.case.fill"),
    CategoryModel(name: "Shopping", color: "#E02020", icon: "cart.fill"),
    CategoryModel(name: "Housing", color: "#6DD400", icon: "house.fill"),
    CategoryModel(name: "Entertainment", color: "#44D7B6", icon: "party.popper.fill"),
    CategoryModel(name: "Education", color: "#6236FF", icon: "graduationcap.fill"),
    CategoryModel(name: "Laundry", color: "#0091FF", icon: "washer.fill"),
    CategoryModel(name: "Transportation", color: "#B620E0", icon: "car.fill"),
    CategoryModel(name: "Internet", color: "#F7418F", icon: "wifi"),
]

