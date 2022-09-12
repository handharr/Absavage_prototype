//
//  LibraryTableViewCell.swift
//  Absavage_prototype
//
//  Created by MEKARI on 12/09/22.
//

import UIKit

class LibraryTableViewCell: UITableViewCell {
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var timeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        containerView.layer.cornerRadius = 10
        timeLabel.textColor = .black
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
