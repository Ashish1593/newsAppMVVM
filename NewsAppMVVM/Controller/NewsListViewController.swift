//
//  NewsListViewController.swift
//  NewsAppMVVM
//
//  Created by Ashish Yadav on 23/02/21.
//

import Foundation
import UIKit

class NewsListViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetup()
        
    }
    
    func initialSetup(){
        self.navigationController?.navigationBar.prefersLargeTitles = true
        let url = URL(string: "https://newsapi.org/v2/top-headlines?country=us&apiKey=7786996c8d704d89a59d5ead03428e2e")!
        WebService().getArticles(url: url) { _ in
            
        }
    }
    
    
}
