//
//  SearchListView.swift
//  WhatsGoingOn
//
//  Created by Vlad Dzirko on 05.07.2023.
//

import SwiftUI

struct SearchListView: View {
    
    @ObservedObject var searchViewModel = ArticlesSearchViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                SearchView(searchTerm: $searchViewModel.searchString)
                MainNewsView(articles: searchViewModel.articles)
            }
        }
    }
}

struct SearchListView_Previews: PreviewProvider {
    static var previews: some View {
        SearchListView()
    }
}
