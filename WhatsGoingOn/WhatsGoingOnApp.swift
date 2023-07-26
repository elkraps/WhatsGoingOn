//
//  WhatsGoingOnApp.swift
//  WhatsGoingOn
//
//  Created by Vlad Dzirko on 29.06.2023.
//

import SwiftUI

@main
struct WhatsGoingOnApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(articles: Article.previewData)  
        }
    }
}
