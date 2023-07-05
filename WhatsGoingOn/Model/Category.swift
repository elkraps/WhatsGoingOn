//
//  Category.swift
//  WhatsGoingOn
//
//  Created by Vlad Dzirko on 05.07.2023.
//

import Foundation

enum Category: String, CaseIterable {
    case general
    case business
    case technology
    case entertaiment
    case sports
    case science
    case health
    
    var text: String {
        if self == .general {
            return "Top Headlines"
        }
        return rawValue.capitalized
    }
}

extension Category: Identifiable {
    var id: Self { self }
}
