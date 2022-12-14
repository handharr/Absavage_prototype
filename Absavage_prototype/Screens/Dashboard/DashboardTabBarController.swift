//
//  DashboardTabBarController.swift
//  Absavage_prototype
//
//  Created by MEKARI on 08/09/22.
//

import UIKit

class DashboardTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
    }
    
    // MARK: - Setup UI
    private func setupUI() {
        // - Instansiate VC
        let myProgramVC = MyProgramViewController()
        let exploreVC = ExploreViewController()
        let libraryVC = LibraryViewController()
        let rangkingsVC = RangkingsViewController()
        // - Setup symbols
        myProgramVC.tabBarItem.image = UIImage(systemName: "house")
        exploreVC.tabBarItem.image = UIImage(systemName: "magnifyingglass")
        libraryVC.tabBarItem.image = UIImage(systemName: "square.stack.3d.down.forward.fill")
        rangkingsVC.tabBarItem.image = UIImage(systemName: "list.number")
        // - Setup titles
        myProgramVC.tabBarItem.title = "My program"
        exploreVC.tabBarItem.title = "Explore"
        libraryVC.tabBarItem.title = "Library"
        rangkingsVC.tabBarItem.title = "Rangkings"
        tabBar.tintColor = .white
        tabBar.backgroundColor = .clear
        tabBar.barTintColor = .clear
        tabBar.backgroundImage = UIImage()
        // - Assign VC
        self.setViewControllers([myProgramVC, exploreVC,libraryVC,rangkingsVC], animated: true)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
