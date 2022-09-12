//
//  LibraryViewController.swift
//  Absavage_prototype
//
//  Created by MEKARI on 08/09/22.
//

import UIKit

class LibraryViewController: UIViewController {
    // MARK: - PROPERTIES
    // MARK: IBOUTLET
    @IBOutlet weak var secondaryHeaderView: SecondaryHeaderView!
    @IBOutlet weak var roundedLabelViewMonday: RoundedLabelView!
    @IBOutlet weak var roundedLabelViewTuesday: RoundedLabelView!
    @IBOutlet weak var roundedLabelViewWednesday: RoundedLabelView!
    @IBOutlet weak var roundedLabelViewThursday: RoundedLabelView!
    @IBOutlet weak var roundedLabelViewFriday: RoundedLabelView!
    @IBOutlet weak var roundedLabelViewSaturday: RoundedLabelView!
    @IBOutlet weak var roundedLabelViewSunday: RoundedLabelView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var tableViewHeight: NSLayoutConstraint!
    
    // MARK: - LIFECYCLE METHODS
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupTableView()
    }
    
    // MARK: - SETUP UI
    private func setupUI() {
        // - Hide navbar
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        // - Bg color
        self.view.backgroundColor = .black
        // - Secondary header
        secondaryHeaderView.alignment = .center
        secondaryHeaderView.titleLabel.text = "WORKOUT GOALS"
        secondaryHeaderView.subtitleLabel.text = "LFG! YOU'RE A BEAST"
        // - Monday
        roundedLabelViewMonday.setupUI(color: .light, text: "M", bgColor: .solid)
        roundedLabelViewTuesday.setupUI(color: .light, text: "T", bgColor: .solid)
        roundedLabelViewWednesday.setupUI(color: .light, text: "W", bgColor: .dark)
        roundedLabelViewThursday.setupUI(color: .dark, text: "T", bgColor: .light)
        roundedLabelViewFriday.setupUI(color: .light, text: "F", bgColor: .dark)
        roundedLabelViewSaturday.setupUI(color: .light, text: "S", bgColor: .dark)
        roundedLabelViewSunday.setupUI(color: .light, text: "S", bgColor: .dark)
    }
    
    private func setupTableView() {
        tableView.register(UINib(nibName: "LibraryTableViewCell", bundle: .main), forCellReuseIdentifier: "LibraryTableViewCell")
        tableView.delegate = self
        tableView.dataSource = self
        tableViewHeight.constant = (174.0 * 4) + 32
        view.layoutIfNeeded()
    }
}

extension LibraryViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "LibraryTableViewCell", for: indexPath) as? LibraryTableViewCell else {
            return UITableViewCell()
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        174.0
    }
}
