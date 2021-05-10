//
//  ColorDetailViewController.swift
//  RandomColorsApp
//
//  Created by Samed Biçer on 7.05.2021.
//

import UIKit

class ColorDetailViewController: UIViewController {

    @IBOutlet var colorHexCodeLabel: UILabel!
    var color: UIColor?

    override func viewDidLoad() {
        super.viewDidLoad()
        guard let color = color else {
            view.backgroundColor = .systemOrange
            colorHexCodeLabel.text = "Invalid HEX Code"
            return
        }
        navigationController?.navigationBar.tintColor = color.isDarkishColor ? .white : .black
        view.backgroundColor = color
        colorHexCodeLabel.text = color.toHexString()
        colorHexCodeLabel.textColor = color.isDarkishColor ? .white : .black
    }
}
