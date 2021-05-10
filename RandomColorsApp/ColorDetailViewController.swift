//
//  ColorDetailViewController.swift
//  RandomColorsApp
//
//  Created by Samed Biçer on 7.05.2021.
//

import UIKit

class ColorDetailViewController: UIViewController {

    var color: UIColor?

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.tintColor = UIColor.white
        view.backgroundColor = color ?? .systemOrange
    }
}
