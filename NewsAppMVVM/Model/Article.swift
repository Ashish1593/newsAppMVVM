//
//  Article.swift
//  NewsAppMVVM
//
//  Created by Ashish Yadav on 23/02/21.
//

import Foundation

struct ArticleList: Decodable {
    let articles: [Article]?
}

struct Article: Decodable {
    let title: String?
    let description : String?
}
