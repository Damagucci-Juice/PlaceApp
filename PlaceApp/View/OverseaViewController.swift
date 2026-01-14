//
//  OverseaViewController.swift
//  PlaceApp
//
//  Created by Gucci on 1/14/26.
//

import UIKit

class OverseaViewController: UIViewController {

    static let identifier = "OverseaViewController"

    @IBOutlet var titleLabel: UILabel!

    var content: City?

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        fillInfo()
    }


    func setContent(_ item: City) {
        content = item
    }

    func fillInfo() {
        guard let content else { return }
        titleLabel.text = "해외 명소: \(content.title)"
    }
}
