//
//  DetailViewController.swift
//  TurkiyeFinansBankCase
//
//  Created by ENES AKSOY on 26.02.2022.
//

import UIKit
import SDWebImage

class DetailViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet private weak var imageView: UIImageView!
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var dateLabel: UILabel!
    @IBOutlet private weak var priceLabel: UILabel!
    
    // MARK: - Properties
    private let oldFormat = "yyyy-MM-dd\'T\'HH:mm:ssZ"
    private let newFormat = "dd MMM yyyy"

    // MARK: - Life Cycles
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let selectItem = ObjectStore.shared.selectItem
        self.imageView.sd_setImage(with: URL(string: selectItem?.artworkUrl100 ?? ""))
        self.nameLabel.text = selectItem?.collectionName
        let newDate = selectItem?.releaseDate?.toDateString(oldFormat: self.oldFormat, newFormat: self.newFormat)
        self.dateLabel.text = newDate
        self.priceLabel.text = "\(selectItem?.collectionPrice ?? 0)"
    }
}

