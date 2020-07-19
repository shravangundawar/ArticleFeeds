//
//  ArticlesViewController.swift
//  ArticleFeeds
//
//  Created by Shravan Gundawar on 18/07/20.
//  Copyright © 2020 Shravan Gundawar. All rights reserved.
//

import UIKit
import ACProgressHUD_Swift

class ArticlesViewController: UIViewController {

    @IBOutlet weak var articlesTableView: UITableView!
    
    var article = Array<Article>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        ArticleViewModel.shared.getArticlesAPI { [weak self] (articleResponse) in
            self?.article = articleResponse
            DispatchQueue.main.async {
                self?.articlesTableView.reloadData()
                ACProgressHUD.shared.hideHUD()
            }
        }
    }
}


extension ArticlesViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return article.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let tableCell: ArticlesTableViewCell = tableView.dequeueReusableCell(withIdentifier: "ArticlesTableViewCell") as! ArticlesTableViewCell
        
        if let likes = article[indexPath.row].likes {
            tableCell.articleLikesLabel.text = ArticleCommonMethods.getAbbriviatedFormsForCounts(val: likes) + " Likes"
        }
        
        if let comments = article[indexPath.row].comments {
            tableCell.articleCommentsLabel.text = ArticleCommonMethods.getAbbriviatedFormsForCounts(val: comments) + " Comments"
        }

        if let user = article[indexPath.row].user {
            tableCell.userNameLabel.text = user[0].name! + " " + user[0].lastname!
            tableCell.userDesignationLabel.text = user[0].designation!
        }
                
        return tableCell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 335
    }
       
}

