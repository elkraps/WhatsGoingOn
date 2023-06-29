//
//  Endpoint.swift
//  WhatsGoingOn
//
//  Created by Vlad Dzirko on 29.06.2023.
//

import Foundation

enum Endpoint {
    
    case topHeadlines
    case articlesFromCategory(_ category: String)
    case articlesFromSource(_ source: String)
    case search(searchFilter: String)
    case sources(country: String)
    
    var baseURL: URL { URL(string: "https://newsapi.org/v2")!}
    
//    var baseURL: String {
//        return "https://newsapi.org/v2"
//    }
//
//    var absoluteURL: String {
//        switch self {
//        case .topHeadlines, .articlesFromCategory:
//            return baseURL + "/top-headlines"
//        case .search, .articlesFromSource:
//            return baseURL + "/everything"
//        case .sources:
//            return baseURL + "/sources"
//        }
//    }
    
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
}
