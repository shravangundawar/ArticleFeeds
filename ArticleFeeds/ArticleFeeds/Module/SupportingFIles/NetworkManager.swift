//
//  NetworkManager.swift
//  ArticleFeeds
//
//  Created by Shravan Gundawar on 18/07/20.
//  Copyright © 2020 Shravan Gundawar. All rights reserved.
//

import Foundation
import SwiftyJSON
import ACProgressHUD_Swift

class NetworkManager: NSObject {
    
    class func requestWithURL(urlString: String) {
        let url = URL(string: urlString)!
        let request = URLRequest(url: url)

        let apiTask = URLSession.shared.dataTask(with: request) { data, response, error in
            
            ACProgressHUD.shared.hideHUD()
            guard let data = data, error == nil else {
                print("error=\(String(describing: error))")
                return
            }
            let responseString = String(data: data, encoding: .utf8)
            print("responseString = \(String(describing: responseString))")
            
        }
        apiTask.resume()
    }
}
