//
//  NewsDetailViewController.swift
//  Simple News
//
//  Created by Nadim Alam on 06/10/2019.
//  Copyright © 2019 Nadim Alam. All rights reserved.
//

import UIKit

class NewsDetailViewController: UIViewController {

    private var viewModel: ArticleViewModel

    //MARK: - IBOutlet
    @IBOutlet private var titleLabel: UILabel?
    @IBOutlet private var articleImageView: UIImageView?
    @IBOutlet private var dateLabel: UILabel?
    @IBOutlet private var sourceLabel: UILabel?
    @IBOutlet private var descriptionLabel: UILabel?
    
    init(viewModel: ArticleViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        self.initUI(viewModel: self.viewModel)
    }
    
    func initUI(viewModel: ArticleViewModel) {
        self.titleLabel?.text = viewModel.title
        self.dateLabel?.text = viewModel.publishedDate
        self.sourceLabel?.text = viewModel.sourceName
        self.descriptionLabel?.text = viewModel.content
        self.articleImageView?.imageFromServerURL(viewModel.imageURL, placeHolder: UIImage(named: "default-news"))
    }
}
