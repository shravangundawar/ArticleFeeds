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
        
    //MARK: IBOutlets
    ///
    @IBOutlet weak var articlesTableView: UITableView!
    
    //MARK: variables
    ///
    private var article = Array<Article>()
    ///
    private var pageStartLimit: Int = 1
    ///
    private  var pageEndLimit: Int = 10

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        articlesTableView.tableFooterView = UIView(frame: .zero)
        getArticleFeeds()
    }
    
    private func getArticleFeeds() {
        ACProgressHUD.shared.showHUD()
        ArticleViewModel.shared.getArticlesAPI(pageStartLimit: String(describing: pageStartLimit), pageEndLimit: String(describing: pageEndLimit)) {  [weak self] (articleResponse) in
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
        ArticleViewModel.shared.setArticlesDataOnCell(tableCell: tableCell, row: indexPath.row)
        
        return tableCell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        guard let media = article[indexPath.row].media, !media.isEmpty else {
            return 200
        }
        return 400
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        let index: [IndexPath] = (articlesTableView?.indexPathsForVisibleRows)!
        if index.last?.row == article.count - 1 {
            loadMoreArticle()
        }
    }

    func loadMoreArticle() {
        self.pageStartLimit = self.pageEndLimit + 1
        self.pageEndLimit = self.pageStartLimit + 9
        //String(describing: self.pageStartLimit)
        ACProgressHUD.shared.showHUD(withStatus: "Loading more")
        ArticleViewModel.shared.getArticlesAPI(pageStartLimit: "1", pageEndLimit: String(self.pageEndLimit)) {  [weak self] (articleResponse) in
            if let articleData = self?.article, articleData.count > 0 {
                self?.article.removeAll()
            }
            self?.article = articleResponse
            DispatchQueue.main.async {
                self?.articlesTableView.reloadData()
                ACProgressHUD.shared.hideHUD()
            }
        }
    }
    
}

