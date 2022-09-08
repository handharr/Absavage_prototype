//
//  Extension+UIView.swift
//  Absavage_prototype
//
//  Created by MEKARI on 08/09/22.
//

import UIKit

extension UIView {
    static var nib: UINib {
        return UINib(nibName: nibName, bundle: nibBundle)
    }
    
    static var nibName: String {
        return String(describing: self)
    }
    
    static var nibBundle: Bundle? {
        return Bundle(for: Self.self)
    }
    
    func loadsUIViewFromNib() -> UIView {
        guard let view = Self.nib.instantiate(withOwner: self, options: nil).first as? UIView else {
            fatalError("The nib \(Self.nib) expected its root view to be of type \(self)")
        }
        return view
    }
}
