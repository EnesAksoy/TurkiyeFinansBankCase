//
//  MainPageCollectionViewCell.swift
//  TurkiyeFinansBankCase
//
//  Created by ENES AKSOY on 26.02.2022.
//

import UIKit
import SDWebImage

class MainPageCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Outlets
    @IBOutlet private weak var cellImageView: UIImageView!
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var dateLabel: UILabel!
    @IBOutlet private weak var priceLabel: UILabel!
    @IBOutlet private weak var cellView: UIView!
    
    // MARK: - Properties
    private let oldFormat = "yyyy-MM-dd\'T\'HH:mm:ssZ"
    private let newFormat = "dd MMM yyyy"
    
    // MARK: - Life Cycles
    override func awakeFromNib() {
        super.awakeFromNib()
        self.cellView.layer.borderWidth = 2
        self.cellView.layer.borderColor = UIColor.black.cgColor
    }
    
    func mainPageCollectionViewCellMethod(imageViewUrl: String, name: String, date: String, price: Double) {
        self.cellImageView.sd_setImage(with: URL(string: imageViewUrl))
        self.nameLabel.text = name
        let newDate = date.toDateString(oldFormat: self.oldFormat, newFormat: self.newFormat)
        self.dateLabel.text = newDate
        self.priceLabel.text = "\(price)"
    }
}
