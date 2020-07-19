//
//  ArticleViewModel.swift
//  ArticleFeeds
//
//  Created by Shravan Gundawar on 18/07/20.
//  Copyright © 2020 Shravan Gundawar. All rights reserved.
//

import Foundation
import LazyImage

class ArticleViewModel: NSObject {
    
    //MARK: IBOutlets
    ///
    static let shared = ArticleViewModel()
    
    //MARK: variables
    ///
    private var article = Array<Article>()
    ///
    private var lazyImage = LazyImage()
    
    //MARK: Methods

    func getArticlesAPI(pageStartLimit: String, pageEndLimit:String, completionHandler:@escaping (Array<Article>) -> Void) {
        let url: String = apiEndpoint + "page=" + pageStartLimit + "&limit=" + pageEndLimit
        
        NetworkManager.requestWithURL(urlString: url) { [weak self] (articleResponse) in
            print(articleResponse)
            self?.article = articleResponse
            completionHandler(articleResponse)
        }
    }
    
    func setArticlesDataOnCell(tableCell: ArticlesTableViewCell, row: Int) {
        
        if let createdDate = article[row].createdAt {
            if let date = ArticleCommonMethods.stringToDate(dateString: String(createdDate.prefix(19)), dateFormat: "yyyy-MM-dd'T'HH:mm:ss") {
                tableCell.durationLabel.text = ArticleCommonMethods.calculateDuration(miliSeconds: Int(date.timeIntervalSince1970))
            }
        }
        
        if let likes = article[row].likes {
            tableCell.articleLikesLabel.text = ArticleCommonMethods.getAbbriviatedFormsForCounts(val: likes) + " Likes"
        }
        
        if let comments = article[row].comments {
            tableCell.articleCommentsLabel.text = ArticleCommonMethods.getAbbriviatedFormsForCounts(val: comments) + " Comments"
        }//calculateDuration
        
        if let desciption = article[row].content {
            tableCell.articleDescriptionTextVw.text = desciption
        }

        if let user = article[row].user, !user.isEmpty {
            tableCell.userNameLabel.text = user[0].name! + " " + user[0].lastname!
            tableCell.userDesignationLabel.text = user[0].designation!
            lazyImage.show(imageView: tableCell.userProfileImageView, url: user[0].avatar!, defaultImage: "userPlaceholder")
        }
        
        if let media = article[row].media, !media.isEmpty {
            tableCell.articleMediaImageView.isHidden = false
            lazyImage.show(imageView: tableCell.articleMediaImageView, url: media[0].image!, defaultImage: "userPlaceholder")
            
            tableCell.articleDescriptionTextVw.text = tableCell.articleDescriptionTextVw.text + "\n\n" + media[0].title! + "\n\n" + media[0].url!
            
        } else {
            tableCell.articleMediaImageView.isHidden = true
        }
    }
    
}
