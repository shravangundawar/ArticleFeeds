//
//  ArticlesTableViewCell.swift
//  ArticleFeeds
//
//  Created by Shravan Gundawar on 18/07/20.
//  Copyright © 2020 Shravan Gundawar. All rights reserved.
//

import UIKit

class ArticlesTableViewCell: UITableViewCell {

    @IBOutlet weak var userProfileImageView: UIImageView!
    ///
    @IBOutlet weak var userNameLabel: UILabel!
    ///
    @IBOutlet weak var userDesignationLabel: UILabel!
    ///
    @IBOutlet weak var durationLabel: UILabel!
    ///
    @IBOutlet weak var articleMediaImageView: UIImageView!
    ///
    @IBOutlet weak var articleDescriptionLabel: UILabel!
    ///
    @IBOutlet weak var articleLikesLabel: UILabel!
    ///
    @IBOutlet weak var articleCommentsLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        cellSetup()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func cellSetup() {
        ArticleCommonMethods.changeUIImageViewShapeToCircle(imageVw: userProfileImageView, height: userProfileImageView.frame.height, width: userProfileImageView.frame.width)
    }
    
}
