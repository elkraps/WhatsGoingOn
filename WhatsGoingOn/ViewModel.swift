//
//  ViewModel.swift
//  WhatsGoingOn
//
//  Created by Vlad Dzirko on 29.06.2023.
//

import Foundation
import Combine

final class ViewModel: ObservableObject {
    
    @Published var news = [News]()
    @Published var searchText = ""
    
    func search() {
        let live = ApiService.live
        
        live.search("science")
            .assign(to: &$news)
        
    }
    
    
}
