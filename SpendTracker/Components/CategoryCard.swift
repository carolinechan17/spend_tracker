//
//  CategoryCard.swift
//  MoneyMinder
//
//  Created by Caroline Chan on 22/03/24.
//

import SwiftUI

struct CategoryCard: View {
    public var icon: String
    public var color: String
    public var nominal: Int
    public var category: String
    
    var body: some View {
        HStack {
            ZStack {
                RoundedRectangle(cornerRadius: 8)
                    .foregroundColor(Color(hex: color))
                Image(systemName: icon)
                    .foregroundColor(.white)
            }
            .frame(width: 50, height: 50)
            
            VStack (alignment: .leading){
                Text(category)
                    .font(.body)
                Text("Rp \(nominal.formattedWithSeparator)")
                    .font(.headline)
            }
            Spacer()
            Image(systemName: "chevron.right")
                .foregroundStyle(.accent)
        }
        .padding()
        .background(Color(hex: "#F2F2F7"))
        .frame(width: .infinity, height: 80)
        .clipShape(RoundedRectangle(cornerRadius: 8))
    }
}

#Preview {
    CategoryCard(icon: "cart.fill", color: "#E02020", nominal: 500000, category: "Shopping")
}
