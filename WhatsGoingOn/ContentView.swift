//
//  ContentView.swift
//  WhatsGoingOn
//
//  Created by Vlad Dzirko on 29.06.2023.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var articlesViewModel = ArticlesViewModel()
    
    var body: some View {
        ZStack {
            Color(hex: "F5F0EA")
                .edgesIgnoringSafeArea(.all)
            
            ScrollView {
                VStack(alignment: .leading) {
                    
                    HStack {
                        Text("WhatsGoingOn")
                            .font(.custom("AlbertSans-Light", size: 25))
                        
                        Spacer()
                        
                        Button {
                            //
                        } label: {
                            Image(systemName: "person.fill")
                                .foregroundColor(.black)
                        }
                    }
                    
                        
                    Picker("",selection: $articlesViewModel.indexEndpoint) {
                        Text("topHeadlines").tag(0)
                        Text("search").tag(1)
                        Text("from").tag(2)
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    
                    if articlesViewModel.indexEndpoint == 1 {
                        SearchView(searchTerm: self.$articlesViewModel.searchString)
                    }
                    
                    if articlesViewModel.indexEndpoint == 2 {
                        Picker("", selection: $articlesViewModel.searchString) {
                            Text("sports").tag("sports")
                            Text("health").tag("health")
                            Text("science").tag("science")
                            Text("business").tag("business")
                            Text("technology").tag("technology")
                            
                        }
                        .onAppear(perform: {
                            self.articlesViewModel.searchString = "science"
                        })
                        .pickerStyle(SegmentedPickerStyle())
                    }
                    NewsView(articles: articlesViewModel.articles)
                }
                .padding(10)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



