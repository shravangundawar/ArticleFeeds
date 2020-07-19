//
//  ArticleViewModel.swift
//  ArticleFeeds
//
//  Created by Shravan Gundawar on 18/07/20.
//  Copyright © 2020 Shravan Gundawar. All rights reserved.
//

import Foundation
import ACProgressHUD_Swift

class ArticleViewModel: NSObject {
    
    static let shared = ArticleViewModel()
    
    
    func getArticlesAPI(completionHandler:@escaping (Array<Article>) -> Void) {
        ACProgressHUD.shared.showHUD()
        NetworkManager.requestWithURL(urlString: apiEndpoint) { (articleResponse) in
            print(articleResponse)
            completionHandler(articleResponse)
        }
    }
    
}
