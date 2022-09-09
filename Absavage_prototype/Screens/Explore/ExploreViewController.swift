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
        let model = datas[indexPath.item]
        cell.setupCell(title: model.programName, subtitle: model.userName)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let screendWidth = UIScreen.main.bounds.size.width
        return CGSize(width: screendWidth * 0.9, height: 360)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        4.0
    }
}
