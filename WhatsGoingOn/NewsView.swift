//
//  NewsView.swift
//  WhatsGoingOn
//
//  Created by Vlad Dzirko on 30.06.2023.
//

import SwiftUI

struct NewsView: View {
    
    var articles: [Article]
    @State var shouldPresent: Bool = false
    @State var articleURL: URL?
    var body: some View {
        List {
            ForEach(articles) { article in
                VStack {
                    Text("\(article.title)").font(.title)
                    Spacer()
                    HStack {
                        Text("\(article.source.name != nil ? article.source.name! : "")")
                        Spacer()
                        Text(APIConstants.formatter.string(from: article.publishedAt!))
                    }
                    .foregroundColor(Color.blue)
//                    ArticleImage(imageLoader: ImageLoaderCache.shared.loaderFor(
//                        article: article))
                    
                    Text("\( article.description != nil ? article.description! : "")")
                        .lineLimit(12)
                    
//                    Button(
//                        action: {
//                            self.articleURL = URL(string: article.url!)
//                            self.shouldPresent = true
//                        },
//                        label: {
//                            Text("\(article.url != nil ? "Read" : "")")
//                                .foregroundColor(Color.blue)
//                        }
//                    )
                    
                    Divider()
                } //VStack
//                .sheet(isPresented: self.$shouldPresent) {SafariView(url: self.articleURL!)}
            } // foreach
        } // list
    }
}


let calendar = Calendar.current
let components = DateComponents(calendar: calendar, year: 2023, month: 6, day: 30)
let sampleArticle = Article(title: "Hello", description: "Lorem lorem lorem", author: "Just me", urlToImage: "hui", publishedAt: calendar.date(from: components)!, source: Source(id: "id", name: "string", description: "string", country: "string", category: "string", url: "string"))
struct NewsView_Previews: PreviewProvider {
    static var previews: some View {
        NewsView(articles: [sampleArticle])
    }
}
