//
//  AddExpenseView.swift
//  MoneyMinder
//
//  Created by Caroline Chan on 22/03/24.
//

import SwiftUI

struct EditExpenseView: View {
    @Environment(\.presentationMode) var presentationMode

    @State var name: String = ""
    @State var nominal: String = ""
    @State var date: String = ""
    @State var choosenCategory: Int = 0
    @State var expenseDate: Date = Date()
    
    @State var showAlert: Bool = false
    
    var body: some View {
        NavigationStack {
            VStack {
                ScrollView {
                    VStack (alignment: .leading){
                        Text("Name")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                        
                        HStack {
                            TextField("Kentang goreng", text: $name)
                                .foregroundColor(.black)
                            
                            if (!name.isEmpty) {
                                Image(systemName: "x.circle.fill")
                                    .foregroundColor(.gray)
                                    .onTapGesture {
                                        name = ""
                                    }
                            }
                        }
                        .padding(12)
                        .overlay {
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color(hex: "#E5E5EA"), lineWidth: 1)
                                .fill(.clear)
                        }
                        .padding(.bottom, 5)
                        
                        Text("Nominal")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                        
                        HStack {
                            Text("Rp")
                                .foregroundStyle(.gray)
                            
                            TextField("100.000", text: $nominal)
                                .keyboardType(.decimalPad)
                                .foregroundColor(.black)
                                .submitLabel(.next)
                            
                            if (!nominal.isEmpty) {
                                Image(systemName: "x.circle.fill")
                                    .foregroundColor(.gray)
                                    .onTapGesture {
                                        nominal = ""
                                    }
                            }
                        }
                        
                        .padding(12)
                        .overlay {
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color(hex: "#E5E5EA"), lineWidth: 1)
                                .fill(.clear)
                        }
                        .padding(.bottom, 5)
                        
                        Text("Date")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                        
                        HStack {
                            TextField("DD/MM/YYYY", text: $date)
                                .foregroundColor(.black)
                            
                            Image(systemName: "calendar")
                                .foregroundColor(.blue)
                        }
                        .padding(12)
                        .overlay {
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color(hex: "#E5E5EA"), lineWidth: 1)
                                .fill(.clear)
                        }
                        .overlay{
                            DatePicker(
                                "",
                                selection: $expenseDate,
                                displayedComponents: [.date]
                            )
                            .blendMode(.destinationOver)
                            .onChange(of: expenseDate) {
                                let dateFormatter = DateFormatter()
                                dateFormatter.dateFormat = "dd/MM/YYYY"
                                date = dateFormatter.string(from: expenseDate)
                            }
                        }
                        .padding(.bottom, 5)
                        
                        Text("Choose Expense Category")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .padding(.bottom, 5)
                        
                        ForEach(0..<expenseCategories.count) { i in
                            Button {
                                choosenCategory = i
                            } label: {
                                HStack {
                                    ZStack {
                                        RoundedRectangle(cornerRadius: 8)
                                            .foregroundStyle(Color(hex: expenseCategories[i].color))
                                        Image(systemName: expenseCategories[i].icon)
                                            .foregroundColor(.white)
                                    }
                                    .frame(width: 30, height: 30)
                                    
                                    Text(expenseCategories[i].name)
                                        .foregroundStyle(.black)
                                    
                                    Spacer()
                                    
                                    Image(systemName: choosenCategory == i ? "checkmark.circle.fill" : "checkmark.circle")
                                        .foregroundStyle(choosenCategory == i ? .accent : .gray)
                                }
                            }
                            
                            Divider()
                        }
                        
                        Spacer()
                    }
                    
                    Spacer()
                }
                .padding(.horizontal)
                .navigationBarTitleDisplayMode(.inline)
                .navigationTitle("Edit Spending")
                
                Button {
                    showAlert = true
                    editExpense(data: ExpenseElement(name: name, date: date, nominal: Int(nominal) ?? 0), categoryIndex: choosenCategory)
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 8)
                            .foregroundColor(Color.accentColor)
                        Text("Save")
                            .foregroundStyle(.white)
                    }
                    .frame(width: .infinity, height: 50)
                }
                .padding()
                .disabled(name == "" || nominal == "" || date == "")
            }
        }
        .alert(isPresented: $showAlert) {
            Alert(title: Text("Success"), message: Text("You have successfully \nedited spending"), dismissButton: Alert.Button.default(Text("Ok"), action: {
                presentationMode.wrappedValue.dismiss()
            }))
        }
        .scrollIndicators(.hidden)
    }
}

#Preview {
    EditExpenseView()
}
