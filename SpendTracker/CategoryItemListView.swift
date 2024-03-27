//
//  CategoryItemListView.swift
//  MoneyMinder
//
//  Created by Caroline Chan on 25/03/24.
//

import SwiftUI

struct CategoryItemListView: View {
    var title: String
    var categoryIndex: Int
    @State var expenseModel: ExpensesModel
    @State var searchQuery: String = ""
    
    var body: some View {
        NavigationStack {
            VStack {
                List {
                    ForEach(expenseModel.expenses) { item in
                        NavigationLink(destination: EditExpenseView(name: item.name, nominal: String(item.nominal), date: item.date, choosenCategory: expenseModel.categoryIndex)) {
                            HStack {
                                VStack (alignment: .leading){
                                    Text(item.name)
                                        .font(.headline)
                                    Text(item.date)
                                        .font(.subheadline)
                                }
                                Spacer()
                                Text("Rp \(item.nominal.formattedWithSeparator)")
                                    .font(.headline)
                            }
                            .swipeActions {
                                Button (role: .destructive){
                                    let index = expenseModel.expenses.firstIndex(where: {$0.name == item.name})
                                    deleteExpense(index: index!, categoryIndex: expenseModel.categoryIndex)
                                } label : {
                                    Image(systemName: "trash")
                                }
                            }
                        }
                    }
                    .listSectionSeparator(.hidden, edges: .top)
                    .listRowInsets(.init(top: 10, leading: 0, bottom: 10, trailing: 5))
                }
                .listStyle(.plain)
                Spacer()
            }
            .onAppear {
                expenseModel = items.first(where: {$0.categoryIndex == categoryIndex})!
            }
            .searchable(text: $searchQuery, placement: .navigationBarDrawer(displayMode: .always), prompt: "Search for expense")
            .padding(.horizontal)
            .navigationBarTitleDisplayMode(.inline)
            .navigationTitle(title)
        }
    }
}

#Preview {
    CategoryItemListView(title: "Category 1", categoryIndex: 0, expenseModel: ExpensesModel(categoryIndex: 1, expenses: [ExpenseElement(name: "Kentang Goreng", date: "27/03/2024", nominal: 20000)], total: 20000))
}
