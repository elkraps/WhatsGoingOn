//
//  ArticlesViewModel.swift
//  WhatsGoingOn
//
//  Created by Vlad Dzirko on 30.06.2023.
//

import Foundation
import Combine

final class ArticlesViewModel: ObservableObject {
    //input
    @Published var indexEndpoint: Int = 0
    @Published var searchString: String = "sports"
    
    
    //output
    @Published var articles = [Article]()
    
    private var validString: AnyPublisher<String, Never> {
        $searchString
            .debounce(for: 0.1, scheduler: RunLoop.main)
            .removeDuplicates()
            .eraseToAnyPublisher()
    }
    
    init(index: Int = 0, text: String = "sports") {
        self.indexEndpoint = index
        self.searchString = text
        Publishers.CombineLatest($indexEndpoint, validString)
            .flatMap { (indexEndpoint, search) -> AnyPublisher<[Article], Never> in
                self.articles = [Article]()
                return ApiService.shared.fetchArticles(from: Endpoint(index: indexEndpoint, text: search)!)
            }
            .assign(to: \.articles, on: self)
            .store(in: &self.cancellableSet)
    }
    
    private var cancellableSet: Set<AnyCancellable> = []
}
