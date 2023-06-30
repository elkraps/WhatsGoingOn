//
//  ApiService.swift
//  WhatsGoingOn
//
//  Created by Vlad Dzirko on 29.06.2023.
//

import Foundation
import Combine


class ApiService {
    static let shared = ApiService()
    
    func fetch<T: Decodable>(_ url: URL) -> AnyPublisher<T, Error> {
        URLSession.shared.dataTaskPublisher(for: url)
            .map{$0.data}
            .decode(type: T.self, decoder: APIConstants.jsonDecoder)
            .receive(on: RunLoop.main)
            .eraseToAnyPublisher()
    }
    
    func fetchArticles(from endpoint: Endpoint) -> AnyPublisher<[Article], Never> {
        guard let url = endpoint.absoluteURL else {
            return Just([Article]()).eraseToAnyPublisher()
        }
        
        return fetch(url)
            .map { (response: NewsResponse) -> [Article] in
                return response.articles
            }
            .replaceError(with: [Article]())
            .eraseToAnyPublisher()
    }
    
    func fetchSources(for country: String) -> AnyPublisher<[Source], Never> {
        guard let url = Endpoint.sources(country: country).absoluteURL else {
            return Just([Source]()).eraseToAnyPublisher()
        }

        return fetch(url)
            .map { (response: SourcesResponse) -> [Source] in
                response.sources
            }
            .replaceError(with: [Source]())
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

