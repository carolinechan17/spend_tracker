//
//  DailyView.swift
//  MoneyMinder
//
//  Created by Caroline Chan on 22/03/24.
//

import SwiftUI
import Charts

struct DailyView: View {
    @State var totalSpend: Int = 0
    @State var items: [ExpensesModel] = []
    @State var foregroundColors: [Color] = []
    
    @State var choosenDate: Date = Date.now
    @State var choosenDateString: String = ""
    
    var body: some View {
        ScrollView {
            if (totalSpend == 0) {
                VStack {
                    Spacer()
                    
                    Image("empty")
                        .resizable()
                        .frame(width: 100, height: 100)
                    
                    Text("No Spendings Yet!")
                        .font(.title3)
                        .fontWeight(.semibold)
                        .padding(.bottom, 7)
                    
                    Text("Add your spendings to \nstart the tracking")
                        .multilineTextAlignment(.center)
                        .font(.body)
                    
                    NavigationLink(destination: AddExpenseView().toolbarRole(.editor)) {
                        Text("Add Spending")
                            .padding()
                            .background(.accent)
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                            .foregroundStyle(.white)
                            .font(.headline)
                    }
                    
                    Spacer()
                }
                .frame(height: 600)
            } else {
                VStack {
                    HStack {
                        Button {
                            choosenDate.addTimeInterval(-60000)
                        } label: {
                            Image(systemName: "chevron.left")
                        }
                        
                        Text(choosenDateString)
                            .frame(minWidth: 200)
                            .font(.callout)
                            .fontWeight(.semibold)
                        
                        Button {
                            choosenDate.addTimeInterval(60000)
                        } label: {
                            Image(systemName: "chevron.right")
                        }
                    }
                    
                    Chart(items) { item in
                        SectorMark(
                            angle: .value(
                                Text(verbatim: expenseCategories[item.categoryIndex].name),
                                item.total
                            ),
                            innerRadius: .ratio(0.6),
                            angularInset: 8
                        )
                        .foregroundStyle(
                            by: .value(
                                "Category",
                                item.categoryIndex
                            )
                        )
                    }
                    .chartForegroundStyleScale(range: foregroundColors.reversed())
                    .chartLegend(.hidden)
                    .frame(width: 150, height: 150)
                    .padding(.vertical)
                    
                    Text("Total Spendings")
                        .font(.title2)
                    
                    Text("Rp \(totalSpend.formattedWithSeparator)")
                        .font(.title3)
                        .fontWeight(.semibold)
                        .padding(.bottom)
                    
                    ForEach(items) { item in
                        NavigationLink(destination: CategoryItemListView(title: expenseCategories[item.categoryIndex].name, categoryIndex: item.categoryIndex, expenseModel: item).toolbarRole(.editor)) {
                            CategoryCard(icon: expenseCategories[item.categoryIndex].icon, color: expenseCategories[item.categoryIndex].color, nominal: item.total, category: expenseCategories[item.categoryIndex].name)
                        }
                        .buttonStyle(.plain)
                    }
                    
                    Spacer()
                }
                .onAppear {
                    let dateFormatter = DateFormatter()
                    dateFormatter.dateFormat = "dd MMMM, YYYY"
                    choosenDateString = dateFormatter.string(from: choosenDate)
                }
                .onChange(of: choosenDate) {
                    let dateFormatter = DateFormatter()
                    dateFormatter.dateFormat = "dd MMMM, YYYY"
                    choosenDateString = dateFormatter.string(from: choosenDate)
                }
            }
        }
        .onAppear {
            totalSpend = calculateTotalSpending()
            items = sortByCategory()
            foregroundColors = getColors(data: items)
            print(items)
            print(foregroundColors)
        }
        .scrollIndicators(.hidden)
    }
}

#Preview {
    DailyView()
}
