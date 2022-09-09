//
//  ExploreCollectionViewCell.swift
//  Absavage_prototype
//
//  Created by MEKARI on 09/09/22.
//

import UIKit

class ExploreCollectionViewCell: UICollectionViewCell {
    // MARK: - PROPERTIES
    // MARK: IBOUTLET
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var startButton: UIButton!
    
    // MARK: - UI LIFECYCLE
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        contentView.layer.cornerRadius = 10
        imageView.layer.cornerRadius = 10
        contentView.clipsToBounds = true
    }
    
    override func prepareForReuse() {
        startButton.isHidden = true
    }

    // MARK: - PUBLIC METHODS
    func setupCell(title: String, subtitle: String, isFullyDisplayed: Bool = false) {
        titleLabel.text = title
        subtitleLabel.text = subtitle
        imageView.image = UIImage(named: subtitle.lowercased())
        startButton.isHidden = false
    }
}
