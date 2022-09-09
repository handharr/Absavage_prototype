//
//  MyProgramViewController.swift
//  Absavage_prototype
//
//  Created by MEKARI on 08/09/22.
//

import UIKit
import SnapKit

class MyProgramViewController: UIViewController {
    // MARK: - PROPERTIES
    // MARK: IBOUTLET
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var programNameTitleLabel: UILabel!
    @IBOutlet weak var programNameValueLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var durationTitleLabel: UILabel!
    @IBOutlet weak var circle: UIImageView!
    @IBOutlet weak var durationValueLabel: UILabel!
    @IBOutlet weak var roundsTitleLabel: UILabel!
    @IBOutlet weak var roundsValueLabel: UILabel!
    @IBOutlet weak var roundsSubtitleLabel: UILabel!
    @IBOutlet weak var modeTitleLabel: UILabel!
    @IBOutlet weak var modeValueLabel: UILabel!
    @IBOutlet weak var toolsRequiredTitleLabel: UILabel!
    @IBOutlet weak var tools1Label: UILabel!
    @IBOutlet weak var tools2Label: UILabel!
    @IBOutlet weak var startButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupUI()
    }


    // MARK: - Setup UI
    private func setupUI() {
        // - Hide navbar
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        // - View bg
        view.backgroundColor = .black
        // - Label color
        programNameValueLabel.textColor = .white
        nameLabel.textColor = .white
        durationValueLabel.textColor = .white
        roundsValueLabel.textColor = .white
        roundsSubtitleLabel.textColor = .white
        modeValueLabel.textColor = .white
        tools1Label.textColor = .white
        tools2Label.textColor = .white
        // - Rounded image view
        imageView.layer.cornerRadius = 10
        // - Button
        startButton.layer.cornerRadius = 10
        startButton.titleLabel?.font = .monumentExtendedUltrabold(size: 14) ?? .boldSystemFont(ofSize: 14)
    }
    
}
