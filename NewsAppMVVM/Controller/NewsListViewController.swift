//
//  NewsListViewController.swift
//  NewsAppMVVM
//
//  Created by Ashish Yadav on 23/02/21.
//

import Foundation
import UIKit

class NewsListViewController: UITableViewController {
    
    var articleListViewModel : ArticleListViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetup()
        
    }
    
    func initialSetup(){
        self.navigationController?.navigationBar.prefersLargeTitles = true
        let url = URL(string: "https://newsapi.org/v2/top-headlines?country=us&apiKey=yourkey")!
        WebService().getArticles(url: url) { articles in
            
            if let articles = articles {
                self.articleListViewModel = ArticleListViewModel(articles: articles)
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
            
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.articleListViewModel.numberOfRowsInSection(section)
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return self.articleListViewModel == nil ? 0 : self.articleListViewModel.numberOfSection
    }
    
    override func tableView(_ ArticleTableViewCelltableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ArticleTableViewCell", for: indexPath) as? ArticleTableViewCell else {
            fatalError("ArticleTableViewCell not found")
        }
        let article = self.articleListViewModel.articleAtIndex(indexPath.row)
        cell.lblTitle.text = article.title
        cell.lblDescription.text = article.description
        
        return cell
    }
    
    
}
