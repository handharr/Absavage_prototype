//
//  MyProfileViewController.swift
//  Absavage_prototype
//
//  Created by MEKARI on 12/09/22.
//

import UIKit

class MyProfileViewController: UIViewController {
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
    @IBOutlet weak var progressBarview: UIView!
    // MARK: UI STATE
    private let shapeLayer = CAShapeLayer()
    // MARK: DATA
    private var progress: CGFloat = 0.8
    
    // MARK: - LIFECYCLE METHODS
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupTableView()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        setupCircle()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        // - Start animation
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.toValue = progress
        animation.duration = 2
        animation.fillMode = .forwards
        animation.isRemovedOnCompletion = false
        shapeLayer.add(animation, forKey: "urSoBasic")
    }
    
    // MARK: - SETUP UI
    private func setupUI() {
        // - Hide navbar
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        self.navigationController?.interactivePopGestureRecognizer?.delegate = self
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
    
    private func setupCircle() {
        // - Set circle
        let circlePath = UIBezierPath(arcCenter: CGPoint(x: progressBarview.center.x - 32, y: progressBarview.frame.size.height - 5), radius: progressBarview.frame.size.width / 2.25, startAngle: -CGFloat.pi, endAngle: -.pi * 2, clockwise: true)
        self.shapeLayer.path = circlePath.cgPath
        self.shapeLayer.lineWidth = 15
        self.shapeLayer.strokeColor = UIColor(red: 245/255, green: 45/255, blue: 86/255, alpha: 1).cgColor
        self.shapeLayer.fillColor = UIColor.clear.cgColor
        self.shapeLayer.strokeEnd = 0
        // - Track layer
        let trackPath = UIBezierPath(arcCenter: CGPoint(x: progressBarview.center.x - 32, y: progressBarview.frame.size.height - 5), radius: progressBarview.frame.size.width / 2.25, startAngle: -CGFloat.pi, endAngle: -.pi * 2, clockwise: true)
        let trackShape = CAShapeLayer()
        trackShape.path = trackPath.cgPath
        trackShape.lineWidth = 15
        trackShape.strokeColor = UIColor(red: 41/255, green: 38/255, blue: 36/255, alpha: 1).cgColor
        trackShape.fillColor = UIColor.clear.cgColor
        // - Assign to view
        progressBarview.layer.addSublayer(trackShape)
        progressBarview.layer.addSublayer(shapeLayer)
    }
    
    private func setupTableView() {
        tableView.register(UINib(nibName: "LibraryTableViewCell", bundle: .main), forCellReuseIdentifier: "LibraryTableViewCell")
        tableView.delegate = self
        tableView.dataSource = self
        tableViewHeight.constant = (174.0 * 4) + 32
        view.layoutIfNeeded()
    }
}

extension MyProfileViewController: UITableViewDelegate, UITableViewDataSource {
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

extension MyProfileViewController: UIGestureRecognizerDelegate {
    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
}
