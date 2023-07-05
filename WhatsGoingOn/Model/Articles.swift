//
//  Articles.swift
//  WhatsGoingOn
//
//  Created by Vlad Dzirko on 29.06.2023.
//

import Foundation

fileprivate let relativeDateFormatter = RelativeDateTimeFormatter()

struct NewsResponse: Codable {
    let status: String?
    let totalResults: Int?
    let articles: [Article]
}

struct Article: Codable, Identifiable {
    let id = UUID()
    let title: String
    let description: String?
    let author: String?
    let urlToImage: String?
    let publishedAt: Date?
    let source: Source
    let url: String?
    
    var captionText: String {
        "\(source.name ?? "") | \(relativeDateFormatter.localizedString(for: publishedAt!, relativeTo: Date()))"
    }
    
    var articleURL: URL {
        URL(string: url ?? "https://jsoneditoronline.org/#left=local.fuleni")!
    }
    
    var imageURL: URL? {
        guard let urlToImage = urlToImage else {
            return nil
        }
        return URL(string: urlToImage)
    }
}

struct SourcesResponse: Codable {
    let status: String
    let sources: [Source]
}

struct Source: Codable {
    let id: String?
    let name: String?
    let description: String?
    let country: String?
    let category: String?
    let url: String?
}

extension Article {
    static var previewData: [Article] {
        let previewDataURL = Bundle.main.url(forResource: "news", withExtension: "json")
        let data = try! Data(contentsOf: previewDataURL!)
        
        let jsonDecoder = JSONDecoder()
        jsonDecoder.dateDecodingStrategy = .iso8601
        
        let apiResponse = try! jsonDecoder.decode(NewsResponse.self, from: data)
        return apiResponse.articles 
    }
}
