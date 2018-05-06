//
//  Extensions.swift
//  TextureCollection
//
//  Created by Elijah Ponkratenko on 05/05/2018.
//  Copyright © 2018 Eli Ponkratenko. All rights reserved.
//

import Foundation

extension UIImage {

    static var medicine1: UIImage {
        return UIImage(named: "impact_advanced_recovery_white")!.image(alpha: 1)!
    }

    static var medicine2: UIImage {
        return UIImage(named: "infusion_white")!.image(alpha: 1)!
    }

    static var medicine3: UIImage {
        return UIImage(named: "injection_white")!.image(alpha: 1)!
    }

    static var moreDots: UIImage {
        return UIImage(named: "moreDots")!.image(alpha: 1)!
    }

    static var collapseArrowIcon: UIImage {
        return UIImage(named: "collapseArrowIcon")!.image(alpha: 1)!
    }

}

extension UIImage {

    func image(alpha: CGFloat) -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(size, false, scale)
        draw(at: .zero, blendMode: .normal, alpha: alpha)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage
    }

}

extension CGFloat {
    static var random: CGFloat {
        return CGFloat(arc4random()) / CGFloat(UInt32.max)
    }
}

extension UIColor {
    static var random: UIColor {
        return UIColor(red: .random, green: .random, blue: .random, alpha: 1.0)
    }
}
