//
//  WebService.swift
//  NewsAppMVVM
//
//  Created by Ashish Yadav on 23/02/21.
//

import Foundation

class WebService {
    func getArticles(url: URL, completion: @escaping ([Article]?) -> ()) {
        
        URLSession.shared.dataTask(with: url) {data, response, error in
            if let error = error {
                print(error.localizedDescription)
                completion(nil)
            } else if let data = data {
                let articlelist = try! JSONDecoder().decode(ArticleList.self, from: data)
//                if let articlelist = articlelist {
                    completion(articlelist.articles)
//                }
                print(articlelist.articles)
            }
        }.resume()
        
    }
}
