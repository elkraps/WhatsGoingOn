//
//  ArticlesSearchViewModel.swift
//  WhatsGoingOn
//
//  Created by Vlad Dzirko on 06.07.2023.
//

import Foundation
import Combine

final class ArticlesSearchViewModel: ObservableObject {
    
    @Published var searchString: String = ""
    
    @Published var articles = [Article]()
    
    @Published var searchResults: [Article] = []
    
    init() {
        $searchString
            
//            .assign(to: &$searchResults)
    }
    
    
    private var cancellableSet: Set<AnyCancellable> = []
}
