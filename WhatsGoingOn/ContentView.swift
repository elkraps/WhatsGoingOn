//
//  ContentView.swift
//  WhatsGoingOn
//
//  Created by Vlad Dzirko on 29.06.2023.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var viewModel = ViewModel()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.news, id: \.id) { news in
                    Text(news.description ?? "no name")
                }
            }
            .listStyle(.plain)
            .navigationTitle(Text("News"))
            .searchable(text: .constant(""))
        }
        .onAppear(perform: viewModel.search)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
