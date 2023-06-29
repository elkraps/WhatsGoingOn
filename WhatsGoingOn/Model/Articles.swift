//
//  Articles.swift
//  WhatsGoingOn
//
//  Created by Vlad Dzirko on 29.06.2023.
//

import Foundation

struct NewsResponse: Codable {
    let status: String?
    let totalResults: Int?
    let articles: [Article]
}

struct Article: Codable, Identifiable {
    var id = UUID()
    let title: String
    let description: String?
    let author: String?
    let urlToImage: String?
    let publishedAt: Date?
    let source: Source
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
