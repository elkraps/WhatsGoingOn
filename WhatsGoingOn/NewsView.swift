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
        
        ForEach(articles) { article in
            VStack(alignment: .leading) {
                
                ArticleImage(imageLoader: ImageLoaderCache.shared.loaderFor(
                    article: article))
                .frame(minHeight: 200, maxHeight: 300)
                //                .padding(.top)
                
                VStack(alignment: .leading, spacing: 8) {
                    //                    Text("\(article.source.name != nil ? article.source.name! : "")")
                    //                        .font(.custom("AlbertSans-Light", size: 15))
                    //                        .padding(4)
                    //                        .overlay(RoundedRectangle(cornerRadius: 50).stroke())
                    
                    Text("\(article.title)")
                        .font(.custom("AlbertSans-Light", size: 25))
                        .foregroundColor(Color(hex: "BB443D"))
                        .lineLimit(2)
                    
                    Text("\(article.description != nil ? article.description! : "")")
                        .lineLimit(2)
                    
                    HStack {
                        Text("\(article.captionText)")
                            .lineLimit(1)
                            .foregroundColor(.secondary)
                            .font(.caption)
                        
                        Spacer()
                        
                        Button {
                            
                        } label: {
                            Image(systemName: "bookmark")
                        }
                        .buttonStyle(.bordered)
                        .foregroundColor(.black)
                        
                        Button {
//                            presentShareSheet(url: article.source.url)
                        } label: {
                            Image(systemName: "square.and.arrow.up")
                        }
                        .buttonStyle(.bordered)
                        .foregroundColor(.black)
                        
                    }
                }
//                .padding([.horizontal, .bottom])
                
                
            }
            
            
        }
        
    }
}

//extension NewsView {
//    func presentShareSheet(url: URL) {
//        let activityVC = UIActivityViewController(activityItems: [url], applicationActivities: nil)
//        (UIApplication.shared.connectedScenes.first as? UIWindowScene)?
//            .keyWindow?
//            .rootViewController?
//            .present(activityVC, animated: true)
//    }
//}

let calendar = Calendar.current
let components = DateComponents(calendar: calendar, year: 2023, month: 6, day: 30)
let sampleArticle = Article(
    title: "Chiness thinking about rainbow just looking in monitor",
    description: "To see a rainbow, you must have the sun shining behind you and the water droplets in front of you.To see a rainbow, you must have the sun shining behind you and the water droplets in front of you.To see a rainbow, you must have the sun shining behind you and the water droplets in front of you.To see a rainbow, you must have the sun shining behind you and the water droplets in front of you.",
    author: "Gordon Ramzey",
    urlToImage: "https://s.abcnews.com/images/Business/WireAP_6b82fe19ed404b0b8e96c9f4c9371e7c_16x9_992.jpg",
    publishedAt: calendar.date(from: components)!,
    source: Source(id: "id",
                   name: "BBC",
                   description: "They are thinking",
                   country: "China",
                   category: "Economics",
                   url: "url/url"))

struct NewsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            List {
                NewsView(articles: [sampleArticle])
                    .listRowInsets(.init(top: 0, leading: 0, bottom: 0, trailing: 0))
                    .listRowSeparator(.hidden)
            }
            .listStyle(.plain)
        }
    }
}
