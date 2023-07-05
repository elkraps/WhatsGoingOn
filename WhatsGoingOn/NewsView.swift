//
//  NewsView.swift
//  WhatsGoingOn
//
//  Created by Vlad Dzirko on 30.06.2023.
//

import SwiftUI

struct NewsView: View {
    
//    @ObservableObject var articlesViewModel = ArticlesViewModel()
    
    var article: Article
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            AsyncImage(url: article.imageURL) {
                phase in
                switch phase {
                case .empty:
                    HStack {
                        Spacer()
                        ProgressView()
                        Spacer()
                    }
                case .success(let image):
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                case .failure:
                    HStack {
                        Spacer()
                        Image(systemName: "photo")
                            .imageScale(.large)
                        Spacer()
                    }
                @unknown default:
                    fatalError()
                }
            }
        }
        .frame(minHeight: 200, maxHeight: 300)
        .background(Color.gray.opacity(0.3))
        .clipped()
        .padding([.bottom])
        
        VStack(alignment: .leading, spacing: 8) {
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
                    presentShareSheet(url: article.articleURL)
                } label: {
                    Image(systemName: "square.and.arrow.up")
                }
                .buttonStyle(.bordered)
                .foregroundColor(.black)
                
            }
        }
        .padding([.horizontal, .bottom])
    }
}

extension NewsView {
    func presentShareSheet(url: URL) {
        let activityVC = UIActivityViewController(activityItems: [url], applicationActivities: nil)
        (UIApplication.shared.connectedScenes.first as? UIWindowScene)?
            .keyWindow?
            .rootViewController?
            .present(activityVC, animated: true)
    }
}


struct NewsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            List {
                NewsView(article: .previewData[0])
                    .listRowInsets(.init(top: 0, leading: 0, bottom: 0, trailing: 0))
                    .listRowSeparator(.hidden)
            }
            .listStyle(.plain)
        }
    }
}
