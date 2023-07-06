//
//  NewsTabView.swift
//  WhatsGoingOn
//
//  Created by Vlad Dzirko on 03.07.2023.
//

import SwiftUI

struct NewsTabView: View {
    
    @ObservedObject var articlesViewModel = ArticlesViewModel()
    
    var body: some View {
        NavigationView {
            
            TabView(selection: $articlesViewModel.indexEndpoint) {
                MainNewsView(articles: articlesViewModel.articles)
                    .tabItem {
                        Label("hui", image: "person")
                    }
                    .tag(0)
                SearchListView()
                    .tabItem {
                        Label("hui", image: "star")
                    }
                    .tag(1)
                
                Text("from")
                    .tabItem {
                        Label("hui", image: "star")
                    }
                    .tag(2)
                
            }
        }
    }
}

struct NewsTabView_Previews: PreviewProvider {
    static var previews: some View {
        NewsTabView()
    }
}
