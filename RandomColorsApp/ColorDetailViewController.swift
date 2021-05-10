//
//  ColorDetailViewController.swift
//  RandomColorsApp
//
//  Created by Samed Biçer on 7.05.2021.
//

import UIKit

class ColorDetailViewController: UIViewController {

    @IBOutlet var hexCodeButton: UIButton!
    var color: UIColor?

    override func viewDidLoad() {
        super.viewDidLoad()
        guard let color = color else {
            view.backgroundColor = .systemOrange
            hexCodeButton.setTitle("Invalid HEX Code", for: .normal)
            return
        }
        navigationController?.navigationBar.tintColor = color.isDarkishColor ? .white : .black
        view.backgroundColor = color
        hexCodeButton.setTitle(color.toHexString(), for: .normal)
        hexCodeButton.setTitleColor(color.isDarkishColor ? .white : .black, for: .normal)
    }

    @IBAction func hexCodeButtonClicked(_ sender: UIButton) {
        if let color = color {
            let pasteboard = UIPasteboard.general
            pasteboard.string = color.toHexString()

            presentAlert(as: "Copied!", with: "Color has copied to clipboard!")
        }
    }

    func presentAlert(as title: String, with message: String) {
        let ac = UIAlertController(title: title, message: message, preferredStyle: .alert)
        present(ac, animated: true)

        // dismiss alert after 2 seconds
        let when = DispatchTime.now() + 2
        DispatchQueue.main.asyncAfter(deadline: when) {
            ac.dismiss(animated: true, completion: nil)
        }
    }
}
