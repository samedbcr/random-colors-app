//
//  ColorsTableViewController.swift
//  RandomColorsApp
//
//  Created by Samed Biçer on 7.05.2021.
//

import UIKit

class ColorsTableViewController: UIViewController {
    var colors = [UIColor]()
    
    enum Cells {
        static let colorCell = "ColorCell"
    }
    
    enum Segues {
        static let toColorDetail = "ToColorDetailViewController"
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        populateRandomColors()
    }

    func populateRandomColors() {
        for _ in 0..<50 {
            colors.append(.random())
        }
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let colorDetailVC = segue.destination as? ColorDetailViewController {
            colorDetailVC.color = sender as? UIColor
        }
    }
}

extension ColorsTableViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return colors.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        guard let cell = tableView.dequeueReusableCell(withIdentifier: Cells.colorCell) else {
            return UITableViewCell()
        }
        cell.backgroundColor = colors[indexPath.row]
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let color = colors[indexPath.row]
        performSegue(withIdentifier: Segues.toColorDetail, sender: color)
    }
}
