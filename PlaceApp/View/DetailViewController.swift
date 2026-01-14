//
//  DetailViewController.swift
//  PlaceApp
//
//  Created by Gucci on 1/14/26.
//

import UIKit

class DetailViewController: UIViewController {

    static let identifier = "DetailViewController"

    @IBOutlet var anotherButton: UIButton!
    @IBOutlet var cityNameLabel: UILabel!

    var content: City?

    override func viewDidLoad() {
        super.viewDidLoad()

        setupAttributes()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        fillInfo()

    }

    func setupAttributes() {
        anotherButton.addTarget(self, action: #selector(anotherButtonTapped), for: .touchUpInside)
        cityNameLabel.likeTitle()
    }

    func setupInfo(_ content: City) {
        self.content = content
    }

    func fillInfo() {
        guard let content else { return }
        cityNameLabel.text = content.title
    }

    @objc func anotherButtonTapped() {
        print(#function)
        self.navigationController?.popViewController(animated: true)
    }
}
