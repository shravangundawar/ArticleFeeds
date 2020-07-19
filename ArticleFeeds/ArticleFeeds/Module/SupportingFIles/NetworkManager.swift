//
//  NetworkManager.swift
//  ArticleFeeds
//
//  Created by Shravan Gundawar on 18/07/20.
//  Copyright © 2020 Shravan Gundawar. All rights reserved.
//

import Foundation

class NetworkManager: NSObject {
    
    class func requestWithURL(urlString: String, completionHandler:@escaping (Array<Article>) -> Void) {
        let url = URL(string: urlString)!
        let request = URLRequest(url: url)

        let apiTask = URLSession.shared.dataTask(with: request) { data, response, error in
            
            guard let data = data, error == nil else {
                print("error=\(String(describing: error))")
                return
            }
            
            let responseString = String(data: data, encoding: .utf8)
            print("responseString = \(String(describing: responseString))")
            
            do {
                let article = try JSONDecoder().decode(Array<Article>.self, from: data)
                completionHandler(article)
            } catch {
                print("error=\(String(describing: error.localizedDescription))")
            }
            
        }
        apiTask.resume()
    }
}
