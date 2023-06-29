//
//  ApiService.swift
//  WhatsGoingOn
//
//  Created by Vlad Dzirko on 29.06.2023.
//

import Foundation
import Combine

let apiKey = "9f78dcdbb6bc48c180272765f7b4e137"

final class ApiService {
    func fetchArticles(from endpoint: Endpoint) -> AnyPublisher<[Article], Never> {
        guard let url = endpoint.baseURL as? URL else {
            return Just([Article]()).eraseToAnyPublisher()
        }
        
        return fetch(url)
            .map { (response: NewsResponse) -> [Article] in
                return response.articles
            }
            .replaceError(with: [Article]())
            .eraseToAnyPublisher()
    }
    
//    func fetchSources() -> AnyPublisher<[Source], Never> {
//        guard let url = Endpoint.baseURL else {
//            return Just([Source]()).eraseToAnyPublisher()
//        }
//
//        return URLSession.shared.dataTaskPublisher(for: url)
//            .map{$0.data}
//            .decode(type: SourcesResponse.self, decoder: JSONDecoder())
//            .map{$0.sources}
//            .replaceError(with: [])
//            .receive(on: RunLoop.main)
//            .eraseToAnyPublisher()
//    }
    
    func fetch<T: Decodable>(_ url: URL) -> AnyPublisher<T, Error> {
        URLSession.shared.dataTaskPublisher(for: url)
            .map{$0.data}
            .decode(type: T.self, decoder: JSONDecoder())
            .receive(on: RunLoop.main)
            .eraseToAnyPublisher()
    }
}



//struct ApiService {
//    //topic (news, sport etc), [countries] , q (keyword for searching)     -> output
//    var search: (String?) -> AnyPublisher<[News], Never>
//}

//extension ApiService {
//    static let live = ApiService { category in
//        //URL component for endpoint
//
//        var urlComponents = URLComponents(string: "https://newsapi.org")!
//        urlComponents.path = "/v2/top-headlines" //?
//        urlComponents.queryItems = [
//            URLQueryItem(name: "category", value: category)
//        ]
//
//        let url = urlComponents.url!
//        var request = URLRequest(url: url)
//        request.addValue(apiKey, forHTTPHeaderField: "X-Api-Key")
//
//        // URL request and return [News]
//
//        return URLSession.shared.dataTaskPublisher(for: request)
//            .map(\.data)
//            .decode(type: SearchResult.self, decoder: JSONDecoder())
//            .map(\.news)
//            .replaceError(with: [])
//            .receive(on: DispatchQueue.main)
//            .eraseToAnyPublisher()
//    }
//}

