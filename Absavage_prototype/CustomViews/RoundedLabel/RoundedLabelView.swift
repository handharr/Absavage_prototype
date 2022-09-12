//
//  RoundedLabelView.swift
//  Absavage_prototype
//
//  Created by MEKARI on 12/09/22.
//

import UIKit

final class RoundedLabelView: UIView {
    enum color {
        case dark
        case light
        case solid
        
        var colorValue: UIColor {
            switch self {
            case .dark:
                return UIColor(red: 41/255, green: 38/255, blue: 36/255, alpha: 1)
            case .light:
                return .white
            case .solid:
                return UIColor(red: 152/255, green: 26/255, blue: 79/255, alpha: 1)
            }
        }
    }
    
    @IBOutlet weak var dayLabel: UILabel!
    
    // MARK: - LIFECYCLE METHODS
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    public override func awakeFromNib() {
        self.layer.cornerRadius = 15
        self.clipsToBounds = true
    }
    
    // MARK: - UI SETUP METHODS
    private func setupView() {
        let contentView = self.loadsUIViewFromNib()
        contentView.backgroundColor = .clear
        self.addSubview(contentView)
        contentView.translatesAutoresizingMaskIntoConstraints = false
        let constraints = [
            contentView.topAnchor.constraint(equalTo: self.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            contentView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ]
        NSLayoutConstraint.activate(constraints)
    }
    
    func setupUI(color: color, text: String, bgColor: color) {
        dayLabel.text = text
        self.backgroundColor = bgColor.colorValue
        self.dayLabel.textColor = color.colorValue
    }
}
