//
//  SearchListView.swift
//  WhatsGoingOn
//
//  Created by Vlad Dzirko on 05.07.2023.
//

import SwiftUI

struct SearchListView: View {
    
    @ObservedObject var articlesViewModel = ArticlesViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                SearchView(searchTerm: self.$articlesViewModel.searchString)
                MainNewsView(articles: articlesViewModel.articles)
            }
        }
    }
}

struct SearchListView_Previews: PreviewProvider {
    static var previews: some View {
        SearchListView()
    }
}
