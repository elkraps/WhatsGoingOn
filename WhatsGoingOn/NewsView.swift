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
                VStack(alignment: .leading) {
                    Text("\(article.title)").font(.title)
                        
                    Spacer()
                    HStack {
                        Text(APIConstants.formatter.string(from: article.publishedAt!))
                            .opacity(0.5)
                        Text("\(article.author != nil ? article.author! : "")")
                        Text("\(article.source.name != nil ? article.source.name! : "")")
                    }
                    .foregroundColor(Color.black)
                    ArticleImage(imageLoader: ImageLoaderCache.shared.loaderFor(
                        article: article))
                    
                    Text("\( article.description != nil ? article.description! : "")")
                        .lineLimit(3)
                    
                    Button(
                        action: {
//                            self.articleURL = URL(string: article.url!)
//                            self.shouldPresent = true
                        },
                        label: {
                            Text("Read")
                                .foregroundColor(Color.blue)
                        }
                    )
                    
                    
                }
            }
        }
    }
}


let calendar = Calendar.current
let components = DateComponents(calendar: calendar, year: 2023, month: 6, day: 30)
let sampleArticle = Article(
    title: "Chiness thinking",
    description: "To see a rainbow, you must have the sun shining behind you and the water droplets in front of you.To see a rainbow, you must have the sun shining behind you and the water droplets in front of you.To see a rainbow, you must have the sun shining behind you and the water droplets in front of you.To see a rainbow, you must have the sun shining behind you and the water droplets in front of you.",
    author: "Gordon Ramzey",
    urlToImage: "https://s.abcnews.com/images/Business/WireAP_6b82fe19ed404b0b8e96c9f4c9371e7c_16x9_992.jpg",
    publishedAt: calendar.date(from: components)!,
    source: Source(id: "id",
                   name: "BBC",
                   description: "They are thinking",
                   country: "China",
                   category: "Economics",
                   url: "url"))

struct NewsView_Previews: PreviewProvider {
    static var previews: some View {
        NewsView(articles: [sampleArticle])
    }
}
