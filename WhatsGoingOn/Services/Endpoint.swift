//
//  Endpoint.swift
//  WhatsGoingOn
//
//  Created by Vlad Dzirko on 29.06.2023.
//

import Foundation

struct APIConstants {
    static let apiKey: String = "9f78dcdbb6bc48c180272765f7b4e137"
    
    static let formatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter
    }()
    
    static let jsonDecoder: JSONDecoder = {
        let jsonDecoder = JSONDecoder()
        jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        jsonDecoder.dateDecodingStrategy = .formatted(dateFormatter)
        return jsonDecoder
    }()
}


enum Endpoint {
    
    case topHeadlines
    case articlesFromCategory(_ category: String)
    case articlesFromSource(_ source: String)
    case search(searchFilter: String)
    case sources(country: String)
    
    var baseURL: URL { URL(string: "https://newsapi.org/v2/")!}
    
    func path() -> String {
        switch self {
        case .topHeadlines, .articlesFromCategory:
            return "top-headlines"
        case .search, .articlesFromSource:
            return "everything"
        case .sources:
            return "sources"
        }
    }
    
    var absoluteURL: URL? {
        let queryURL = baseURL.appendingPathComponent(self.path())
        let components = URLComponents(url: queryURL, resolvingAgainstBaseURL: true)
        guard var urlComponents = components else {
            return nil
        }
        
        switch self {
        case .topHeadlines:
            urlComponents.queryItems = [
                URLQueryItem(name: "country", value: region),
                URLQueryItem(name: "apikey", value: APIConstants.apiKey)
            ]
        case .articlesFromCategory(let category):
            urlComponents.queryItems = [
                URLQueryItem(name: "country", value: region),
                URLQueryItem(name: "category", value: category),
                URLQueryItem(name: "apikey", value: APIConstants.apiKey)
            ]
        case .articlesFromSource(let source):
            urlComponents.queryItems = [
                URLQueryItem(name: "source", value: source),
                URLQueryItem(name: "apikey", value: APIConstants.apiKey)
            ]
        case .search(let searchFilter):
            urlComponents.queryItems = [
                URLQueryItem(name: "q", value: searchFilter.lowercased()),
                URLQueryItem(name: "apikey", value: APIConstants.apiKey)
            ]
        case .sources(let country):
            urlComponents.queryItems = [
                URLQueryItem(name: "country", value: country),
                URLQueryItem(name: "language", value: countryLang[country]),
                URLQueryItem(name: "apikey", value: APIConstants.apiKey)
            ]
        }
        
        return urlComponents.url
    }
    
    var locale: String {
        Locale.current.language.languageCode?.identifier ?? "en"
    }
    
    var region: String {
        return Locale.current.language.languageCode?.identifier.lowercased() ?? "us"
    }
    
    init? (index: Int, text: String = "sports") {
        switch index {
        case 0: self = .topHeadlines
        case 1: self = .search(searchFilter: text)
        case 2: self = .articlesFromCategory(text)
        case 3: self = .articlesFromSource(text)
        case 4: self = .sources(country: text)
        default: return nil
        }
    }
    
    var countryLang: [String: String] {
        return [
            "ar": "es",  // argentina
            "au": "en",  // australia
            "br": "es",  // brazil
            "ca": "en",  // canada
            "cn": "cn",  // china
            "de": "de",  // germany
            "es": "es",  // spain
            "fr": "fr",  // france
            "gb": "en",  // unitedKingdom
            "hk": "cn",  // hongKong
            "ie": "en",  // ireland
            "in": "en",  // india
            "is": "en",  // iceland
            "il": "he",  // israil for sources - language
            "it": "it",  // italy
            "nl": "nl",  // netherlands
            "no": "no",  // norway
            "ru": "ru",  // russia
            "sa": "ar",  // saudiArabia
            "us": "en",  // unitedStates
            "za": "en"   // southAfrica
        ]
    }
}
