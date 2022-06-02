//
//  NewsViewModel.swift
//  WSP.KBTU
//
//  Created by Lidiya Karnaukhova on 26.04.2022.
//

import Foundation

class NewsViewModel {
    
    let dataSource: NewsDataSource
    //TODO: make observable
    var news: [NewsCellConfigurator] = []
    
    init() {
        dataSource = NewsDataSource()
    }
    
    func getNews() -> [NewsCellConfigurator] {
        news = dataSource.getNewsData()
        return news
    }
}
