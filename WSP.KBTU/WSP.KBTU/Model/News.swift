//
//  News.swift
//  WSP.KBTU
//
//  Created by Lidiya Karnaukhova on 26.04.2022.
//

import Foundation

struct News {
    var newsTitle: String
    var newsDescription: String
    var newsDate: String
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(newsTitle)
        hasher.combine(newsDescription)
        hasher.combine(newsDate)
    }
}
