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
            VStack {
                Text("hello")
            }
            .navigationTitle("Hello")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Image(systemName: "magnifyingglass")
                }
            }
        }
        
    }
    
}

struct NewsTabView_Previews: PreviewProvider {
    static var previews: some View {
        NewsTabView()
    }
}
