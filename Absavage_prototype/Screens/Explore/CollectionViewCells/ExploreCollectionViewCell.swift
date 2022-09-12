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
    
    let gradientLayer = CAGradientLayer()
    
    // MARK: - UI LIFECYCLE
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        contentView.layer.cornerRadius = 10
        imageView.layer.cornerRadius = 10
        contentView.clipsToBounds = true
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupGradient()
    }
    
    override func prepareForReuse() {
        
    }

    // MARK: - PUBLIC METHODS
    func setupCell(title: String, subtitle: String, isFullyDisplayed: Bool = false) {
        titleLabel.text = title
        subtitleLabel.text = subtitle
        imageView.image = UIImage(named: subtitle.lowercased())
        setActive(false)
    }
    
    func setupGradient() {
        gradientLayer.frame = self.imageView.bounds
        gradientLayer.colors = [
            UIColor.clear.cgColor,
            UIColor.clear.cgColor,
            UIColor.black.withAlphaComponent(0.5).cgColor,
            UIColor(red: 119/255, green: 28/255, blue: 72/255, alpha: 0.7).cgColor,
            UIColor(red: 119/255, green: 28/255, blue: 72/255, alpha: 0.9).cgColor
        ]
        imageView.layer.addSublayer(gradientLayer)
    }
    
    func showGradient() {
        gradientLayer.isHidden = false
    }
    
    func removeGradient() {
        gradientLayer.isHidden = true
    }
    
    func setActive(_ isActive: Bool) {
        startButton.isHidden = !isActive
        gradientLayer.isHidden = !isActive
    }
}
