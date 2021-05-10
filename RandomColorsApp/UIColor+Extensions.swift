//
//  UIColor+Extensions.swift
//  RandomColorsApp
//
//  Created by Samed Biçer on 10.05.2021.
//

import UIKit

extension UIColor {

    static func random() -> UIColor {
        let color = UIColor(red: CGFloat.random(in: 0...1),
                            green: CGFloat.random(in: 0...1),
                            blue: CGFloat.random(in: 0...1),
                            alpha: 1)
        return color
    }
}
