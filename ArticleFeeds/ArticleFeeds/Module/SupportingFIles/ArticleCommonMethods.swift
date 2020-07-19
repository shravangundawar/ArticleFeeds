//
//  ArticleCommonMethods.swift
//  ArticleFeeds
//
//  Created by Shravan Gundawar on 19/07/20.
//  Copyright © 2020 Shravan Gundawar. All rights reserved.
//

import Foundation
import UIKit

class ArticleCommonMethods: NSObject {
    
    class func changeUIImageViewShapeToCircle(imageVw: UIImageView, height: CGFloat, width: CGFloat) {
        
        imageVw.layer.cornerRadius = CGFloat(height/2)
        imageVw.layer.borderColor = CGColor(srgbRed: 128/255, green: 128/255, blue: 128/255, alpha: 1.0)
        imageVw.layer.borderWidth = 2.0
    }
    
    class func getAbbriviatedFormsForCounts(val: Int) -> String {
        let strValArray: [Character] = Array(String(describing: val))
        
        switch strValArray.count {
        case 7: //Million
            let firstPart = String(describing: strValArray.first!) + "."
            let secondPart = String(describing: strValArray[2]) + "M"
            return firstPart + secondPart
        case 6: //Lakh
            let firstPart = String(describing: strValArray.first!) + "."
            let secondPart = String(describing: strValArray[1]) + "Lakhs"
            return firstPart + secondPart
        case 5: //Thousands
            let firstPart = String(describing: strValArray.first!) + String(describing: strValArray[1]) + "."
            let secondPart = String(describing: strValArray[2]) + "K"
            return firstPart + secondPart
        case 4: //Thousand
            let firstPart = String(describing: strValArray.first!) + "."
            let secondPart = String(describing: strValArray[1]) + "K"
            return firstPart + secondPart
        default:
            return String(describing: val)
        }
    }
}
