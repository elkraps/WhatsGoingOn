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
    
    init() {
        $searchString
            .debounce(for: 0.1, scheduler: RunLoop.main)
            .removeDuplicates()
            .flatMap { searchString -> AnyPublisher<[Article], Never> in
                Future<[Article], Never> { (promise) in
                    if 2...30 ~= searchString.count {
                        ApiService.shared.fetchArticles(from: .search(searchFilter: searchString))
                            .sink(receiveValue: { value in promise(.success(value))})
                            .store(in: &self.cancellableSet)
                    } else {
                        promise ( .success([Article]()))
                    }
                }
                .eraseToAnyPublisher()
            }
            .assign(to: \.articles, on: self)
            .store(in: &self.cancellableSet)
    }
    
    private var cancellableSet: Set<AnyCancellable> = []
}
