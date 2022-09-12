//
//  PrimaryHeaderView.swift
//  Absavage_prototype
//
//  Created by MEKARI on 08/09/22.
//

import UIKit

final class PrimaryHeaderView: UIView {
    // MARK: - PROPERTIES
    @IBOutlet weak var dayLabel: UILabel!
    @IBOutlet weak var dayNameLabel: UILabel!
    @IBOutlet weak var monthYearLabel: UILabel!
    @IBOutlet weak var rangkingLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var avatarImageView: UIImageView!
    
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
        self.backgroundColor = .black
        // - Fit label
        dayLabel.sizeToFit()
        timeLabel.sizeToFit()
        dayNameLabel.sizeToFit()
        monthYearLabel.sizeToFit()
        // - Setup label color
        dayLabel.textColor = .white
        rangkingLabel.textColor = .white
        timeLabel.textColor = .white
        // - Rounded avatar
        avatarImageView.layer.cornerRadius = 15
        // - Add action
        addGesture(someView: avatarImageView, methods: #selector(handleClickAvatar(_:)))
    }
    
    // MARK: - IBACTION METHODS
    /// Open MyProfile
    @objc private func handleClickAvatar(_ gesture: UITapGestureRecognizer) {
        // - Initiate and push MyProfile
        guard let superView = self.superview,
              let parentVC = superView.findViewController()
        else { return }
        let vc = MyProfileViewController()
        parentVC.navigationController?.pushViewController(vc, animated: true)
    }
    
    // MARK: - HELPER METHODS
    /// Function to add Gesture to a view
    private func addGesture(someView: UIView, methods: Selector?) {
        // - Create and setup UITapGestureRecognizer instance
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: methods)
        gestureRecognizer.numberOfTapsRequired = 1
        gestureRecognizer.numberOfTouchesRequired = 1
        // - Add GestureRecognizer to view
        someView.addGestureRecognizer(gestureRecognizer)
        someView.isUserInteractionEnabled = true
    }
}
