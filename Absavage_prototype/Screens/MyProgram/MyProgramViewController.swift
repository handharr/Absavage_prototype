//
//  MyProgramViewController.swift
//  Absavage_prototype
//
//  Created by MEKARI on 08/09/22.
//

import UIKit
import SnapKit

class MyProgramViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        // - Initiate gradient layer
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = self.view.bounds
        gradientLayer.colors = [
            UIColor(red: 9/255.0, green: 11/255.0, blue: 15/255.0, alpha: 1.0).cgColor,
            UIColor(red: 119/255.0, green: 28/255.0, blue: 72/255.0, alpha: 1.0).cgColor
        ]
        // - Add sublayer
        self.view.layer.addSublayer(gradientLayer)
        print("cek")
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
