//
//  DetailViewController.swift
//  PlaceApp
//
//  Created by Gucci on 1/14/26.
//

import UIKit
import Kingfisher

class DetailViewController: UIViewController {

    static let identifier = "DetailViewController"

    @IBOutlet var cityImageView: UIImageView!

    @IBOutlet var cityNameLabel: UILabel!

    @IBOutlet var cityDescriptionLabel: UILabel!
    
    @IBOutlet var anotherButton: UIButton!

    static let failImage = UIImage(resource: .defaultTour)

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
        cityDescriptionLabel.likeSecondary()
        cityImageView.setCorner(16)
        cityImageView.contentMode = .scaleAspectFill

        navigationItem.title = "관광지 화면"

        view.backgroundColor = .white

        anotherButton.setBorder(UIColor.black)
        anotherButton.setCorner(8.0)
        anotherButton.setTitleColor(.black, for: .normal)
        anotherButton.backgroundColor = .white
    }

    func setupInfo(_ content: City) {
        self.content = content
    }

    func fillInfo() {
        guard let content,
              let url = URL(string: content.image)
        else { return }
        cityNameLabel.text = content.title
        cityDescriptionLabel.text = content.explain
        cityImageView.kf.setImage(with: url) { [weak self] result in
            // error handling
            _ = result.mapError { [weak self] error in
                guard let self else { return error }
                self.cityImageView.image = Self.failImage
                return error
            }
        }
    }

    @objc func anotherButtonTapped() {
        print(#function)
        self.navigationController?.popViewController(animated: true)
    }
}
