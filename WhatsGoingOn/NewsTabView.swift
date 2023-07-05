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
                        Label("hui", image: "star")
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
            //            ScrollView{
            //
            //                VStack {
            //                    Picker("Category", selection: $articlesViewModel.searchString) {
            //                        ForEach(Category.allCases) {
            //                            Text($0.text).tag($0)
            //                        }
            //
            //
            //                    }
            //
            //                }
            //            }
            //            //            .navigationTitle(Text("News"))
            //            //            .navigationBarTitleDisplayMode(.inline)
            //            .toolbar {
            //                ToolbarItem(placement: .navigationBarTrailing) {
            //                    Image(systemName: "magnifyingglass")
            //                }
            //
            //                ToolbarItem(placement: .navigationBarLeading) {
            //                    Text("TopHeadLines")
            //                        .font(.custom("AlbertSans-Light", size: 30))
            //                }
            //            }
                    }
        }
    
}

struct NewsTabView_Previews: PreviewProvider {
    static var previews: some View {
        NewsTabView()
    }
}
