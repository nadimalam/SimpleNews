//
//  ArticleTableViewCell.swift
//  Simple News
//
//  Created by Nadim Alam on 18/03/2019.
//  Copyright © 2019 Nadim Alam. All rights reserved.
//

import UIKit

class ArticleTableViewCell: UITableViewCell {

    static var cellIdentifier: String = "ArticleTableViewCell"
    
    //MARK: - IBOutlet
    @IBOutlet private var titleLabel: UILabel?
    @IBOutlet private var descriptionLabel: UILabel?
    @IBOutlet private var dateLabel: UILabel?
    @IBOutlet private var sourceLabel: UILabel?
    @IBOutlet private var articleImageView: UIImageView?
    
    var viewModel: ArticleViewModel? {
        didSet {
            bind()
        }
    }
    
    private func bind() {
        guard let viewModel = viewModel else {
            return
        }
        self.titleLabel?.text = viewModel.title
        self.descriptionLabel?.text = viewModel.description
        self.sourceLabel?.text = viewModel.sourceName
        self.dateLabel?.text = viewModel.publishedDate
        
        // Download and set the image.
        self.articleImageView?.imageFromServerURL(viewModel.imageURL, placeHolder: UIImage(named: "default-news"))
    }
}
