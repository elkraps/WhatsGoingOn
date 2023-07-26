//
//  CategoryView.swift
//  WhatsGoingOn
//
//  Created by Vlad Dzirko on 26.07.2023.
//

import SwiftUI

struct CategoryView: View {
    
    @State private var selectedCategory: String = "General"
    @ObservedObject var articlesViewModel = ArticlesViewModel()
    
    
    var body: some View {
        VStack {
            CategoryScrollView(selectedCategory: $selectedCategory)
                .padding()
            
            List {
                ForEach(articlesViewModel.articles) { item in
                    NewsView(article: item)
                }
            }
            
            
        }
    }
}

struct CategoryView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryView()
    }
}
