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
    
    private var validString: AnyPublisher<String, Never> {
        $searchString
            .debounce(for: 0.1, scheduler: RunLoop.main)
            .removeDuplicates()
            .eraseToAnyPublisher()
    }
    
    init(text: String = "") {
        self.searchString = text
        Publishers.Collect(upstream: validString)
            .flatMap { (search) -> AnyPublisher<[Article], Never> in
                self.articles = [Article]()
                return ApiService.shared.fetchArticles(from: .search(searchFilter: text))
            }
            .assign(to: \.articles, on: self)
            .store(in: &self.cancellableSet)
    }
    
    private var cancellableSet: Set<AnyCancellable> = []
    
}
