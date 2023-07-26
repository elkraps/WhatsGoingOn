//
//  SearchView.swift
//  WhatsGoingOn
//
//  Created by Vlad Dzirko on 30.06.2023.
//

import SwiftUI

struct SearchView: View {
    
    @ObservedObject var articlesViewModel = ArticlesViewModel()
    
    @Binding var searchTerm: String
    
    var body: some View {
        ScrollView{
            
            HStack {
                Image("search")
                TextField("Search", text: $articlesViewModel.searchString)
                
                Image(systemName: "magnifyingglass")
                    .foregroundColor(.black)
                
                
            }
            .padding()
            .background(Color.gray)
            .cornerRadius(25)
            .padding(.all, 15)
            
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView(searchTerm: .constant(""))
    }
}
