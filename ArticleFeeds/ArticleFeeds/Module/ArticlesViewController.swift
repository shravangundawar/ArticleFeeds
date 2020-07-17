//
//  ArticlesViewController.swift
//  ArticleFeeds
//
//  Created by Shravan Gundawar on 18/07/20.
//  Copyright © 2020 Shravan Gundawar. All rights reserved.
//

import UIKit

class ArticlesViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}


extension ArticlesViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let tableCell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "ArticlesTableViewCell")!
        
        return tableCell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 335
    }

       
   }

