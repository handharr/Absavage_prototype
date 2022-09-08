//
//  Extension+UIFont.swift
//  Absavage_prototype
//
//  Created by MEKARI on 09/09/22.
//

import Foundation
import UIKit

extension UIFont {
    static func graphikMedium(size: CGFloat) -> UIFont? {
        return UIFont(name: "GraphikMedium", size: size)
    }
    
    static func graphikRegular(size: CGFloat) -> UIFont? {
        return UIFont(name: "GraphikRegular", size: size)
    }
    
    static func monumentExtendedRegular(size: CGFloat) -> UIFont? {
        return UIFont(name: "MonumentExtended-Regular", size: size)
    }
    
    static func monumentExtendedUltrabold(size: CGFloat) -> UIFont? {
        return UIFont(name: "MonumentExtended-Ultrabold", size: size)
    }
    
    static func tuskerGroteskSemibold(size: CGFloat) -> UIFont? {
        return UIFont(name: "TuskerGrotesk-3600Semibold", size: size)
    }
}
