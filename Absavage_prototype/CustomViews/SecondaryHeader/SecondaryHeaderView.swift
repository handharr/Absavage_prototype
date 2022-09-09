//
//  SecondaryHeader.swift
//  Absavage_prototype
//
//  Created by MEKARI on 09/09/22.
//

import UIKit

final class SecondaryHeaderView: UIView {
    // MARK: - PROPERTIES
    // MARK: IBOUTLET
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    
    // MARK: - LIFECYCLE METHODS
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupUI()
    }
    
    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
        setupUI()
    }
    
    public override func awakeFromNib() {
        // - Set bar label's color
        if #available(iOS 13.0, *) {
            UINavigationBar.appearance().tintColor = .label
        } else {
            // Fallback on earlier versions
            UINavigationBar.appearance().tintColor = .black
        }
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
    
    private func setupUI() {
        self.backgroundColor = .clear
    }
}
