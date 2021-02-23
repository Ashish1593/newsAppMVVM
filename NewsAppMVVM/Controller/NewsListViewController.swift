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
    }
    
    
}
