//
//  ExploreViewController.swift
//  Absavage_prototype
//
//  Created by MEKARI on 08/09/22.
//

import UIKit

struct ExploreModel {
    let programName: String
    let userName: String
}

class ExploreViewController: UIViewController {
    // MARK: - PROPERTIES
    // MARK: IBOUTLET
    @IBOutlet weak var firstSecondaryHeaderView: SecondaryHeaderView!
    @IBOutlet weak var firstCollectionView: UICollectionView!
    @IBOutlet weak var secondSecondaryHeaderView: SecondaryHeaderView!
    @IBOutlet weak var secondCollectionView: UICollectionView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var mainStackView: UIStackView!
    // MARK: DATA
    private let datas: [ExploreModel] = [
        ExploreModel(programName: "HIT\nHEART", userName: "EVELYN"),
        ExploreModel(programName: "SAVAGE\nSHOULDERS", userName: "TWAN"),
        ExploreModel(programName: "EXTREME\nLEG BURN", userName: "MICHAELLA")
    ]
    
    // - MARK: - LIFECYCLE METHODS
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        setupCollectionView()
    }
    
    // MARK: - METHODS
    private func setupUI() {
        // - Hide navbar
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        // - Set background to black
        view.backgroundColor = .black
        // - Set Second header
        secondSecondaryHeaderView.titleLabel.text = "UPPER BODY"
        secondSecondaryHeaderView.subtitleLabel.text = "CRUSH YOUR CORE"
    }
    
    private func setupCollectionView() {
        // - Register cells
        firstCollectionView.register(UINib(nibName: "ExploreCollectionViewCell", bundle: .main), forCellWithReuseIdentifier: "ExploreCollectionViewCell")
        secondCollectionView.register(UINib(nibName: "ExploreCollectionViewCell", bundle: .main), forCellWithReuseIdentifier: "ExploreCollectionViewCell")
        // - Setup delegate
        firstCollectionView.delegate = self
        firstCollectionView.dataSource = self
        secondCollectionView.delegate = self
        secondCollectionView.dataSource = self
    }
    
    // MARK: - HELPERS
    private func setActive() {
        for collView in [firstCollectionView, secondCollectionView] {
            guard let collView = collView,
                  let cells = collView.visibleCells as? [ExploreCollectionViewCell]
            else { return }
            for cell in cells {
                let frame = collView.convert(cell.frame.origin, to: mainStackView)
                if frame.x < 250.0 && frame.x > -75.0 {
                    cell.setActive(true)
                } else {
                    cell.setActive(false)
                }
            }
        }
    }
}

// MARK: - COLLECTION VIEW DELEGATION
extension ExploreViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return datas.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ExploreCollectionViewCell", for: indexPath) as? ExploreCollectionViewCell else {
            return UICollectionViewCell()
        }
        var model = datas[indexPath.item]
        if collectionView == secondCollectionView {
            model = datas.reversed()[indexPath.item]
        }
        cell.setupCell(title: model.programName, subtitle: model.userName)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let screendWidth = UIScreen.main.bounds.size.width
        return CGSize(width: screendWidth * 0.9, height: 360)
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        setActive()
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        setActive()
    }
}
