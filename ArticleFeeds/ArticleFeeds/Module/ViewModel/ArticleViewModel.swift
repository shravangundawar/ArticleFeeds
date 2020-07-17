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
    
    func getArticlesAPI() {
        ACProgressHUD.shared.showHUD()
        NetworkManager.requestWithURL(urlString: apiEndpoint)
    }
    
}
