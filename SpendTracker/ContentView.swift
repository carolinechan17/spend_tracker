//
//  ContentView.swift
//  MoneyMinder
//
//  Created by Caroline Chan on 21/03/24.
//

import SwiftUI

struct ContentView: View {    
    @State var mode: Int = 0
    
    var body: some View {
        NavigationStack {
            VStack {
                Picker("", selection: $mode) {
                    Text("Daily").tag(0)
                    Text("Monthly").tag(1)
                    
                }
                .pickerStyle(.segmented)
                .padding(.vertical)
                
                TabView(selection: $mode) {
                    DailyView().tag(0)
                    
                    MonthlyView().tag(1)
                }
                .tabViewStyle(.page)
            }
            .padding(.horizontal)
            .navigationBarTitleDisplayMode(.inline)
            .navigationTitle("SpendTracker")
            .toolbar {
                NavigationLink(destination: AddExpenseView().toolbarRole(.editor)) {
                    Image(systemName: "plus")
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
