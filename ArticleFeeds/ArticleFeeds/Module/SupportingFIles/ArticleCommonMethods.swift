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
    
    //MARK: Methods

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
    
    class func calculateDuration(miliSeconds:Int) -> String {
        
        let seconds = miliSeconds / 1000
        guard seconds > 0 else {
            return "00:00:00"
        }
        
        let hours = seconds / 3600
        let minute =  (seconds % 3600) / 60
        let second = (seconds % 3600) % 60
        
        if hours < 24 {
            let hoursString = String(format: "%02i", arguments: [hours])
            let minuteString = String(format: "%02i", arguments: [minute])
            let secondString = String(format: "%02i", arguments: [second])
            return ("\(hoursString):\(minuteString):\(secondString)")
        }
        else if (hours / 24) < 30 {
            return ("\((hours / 24)) days")
        }
        else if ((hours / 24) / 30) < 12 {
            return ("\(((hours / 24) / 30)) months")
        }
        else {
            return ("\(((hours / 24) / 30) / 12) years")
        }
    }
    
    class func stringToDate(dateString: String, dateFormat: String) -> Date?  {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.dateFormat = dateFormat
        let date: Date = (dateFormatter.date(from: dateString) ?? nil)!
        return date
    }
    
}
