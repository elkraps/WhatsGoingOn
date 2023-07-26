//
//  CategoryScrollView.swift
//  WhatsGoingOn
//
//  Created by Vlad Dzirko on 26.07.2023.
//

import SwiftUI


/*
 case general
 case business
 case technology
 case entertaiment
 case sports
 case science
 case health
 */
struct CategoryScrollView: View {
    let categories = ["General", "Business", "Technology", "Entertaiment", "Sports", "Science", "Health"]
    @Binding var selectedCategory: String
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(categories, id: \.self) { category in
                    Text(category)
                        .frame(minWidth: 100)
                        .padding(6)
                        .foregroundColor(.white)
                        .background(selectedCategory == category ? .red : .gray)
                        .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
                        .onTapGesture {
                            selectedCategory = category
                        }
                }
            }
        }
    }
}

struct CategoryScrollView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryScrollView(selectedCategory: .constant("General"))
    }
}
