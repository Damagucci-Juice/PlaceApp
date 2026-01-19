//
//  UserProfileViewController.swift
//  PlaceApp
//
//  Created by Gucci on 1/19/26.
//

import UIKit

import SnapKit
import Kingfisher

final class UserProfileViewController: UIViewController {


    private lazy var nickSubLabel = {
        let result = UILabel()
        result.translatesAutoresizingMaskIntoConstraints = false
        result.backgroundColor = .clear
        result.text = "닉네임"
        result.font = .systemFont(ofSize: 12, weight: .regular)
        result.textColor = .secondaryLabel
        return result
    }()

    private lazy var nicknameLabel = {
        let result = UILabel()
        result.translatesAutoresizingMaskIntoConstraints = false
        result.backgroundColor = .clear
        result.text = "콩콩팡팡"
        result.font = .systemFont(ofSize: 20, weight: .bold)
        result.textColor = .black
        return result
    }()

    private lazy var profileImageView = {
        let result = UIImageView(frame: .zero)
        result.contentMode = .scaleAspectFill
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.03) {
            result.setCorner(result.bounds.height / 2)
        }
        result.image = UIImage(systemName: "profile.fill")
        return result
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupAttribute()
        setupNaviItem()
    }

    private let user: User

    init(_ user: User) {
        self.user = user
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension UserProfileViewController: Drawable {
    func setupUI() {
        [profileImageView, nickSubLabel, nicknameLabel].forEach {
            self.view.addSubview($0)
        }

        profileImageView.snp.makeConstraints { make in
            make.size.equalTo(100)
            make.top.equalTo(view.safeAreaLayoutGuide).offset(100)
            make.centerX.equalToSuperview()
        }

        nickSubLabel.snp.makeConstraints { make in
            make.top.equalTo(profileImageView.snp.bottom).offset(24)
            make.centerX.equalToSuperview()
        }

        nicknameLabel.snp.makeConstraints { make in
            make.top.equalTo(nickSubLabel.snp.bottom).offset(8)
            make.centerX.equalToSuperview()
        }
    }
    
    func setupAttribute() {
        setupProfileImageView()
        nicknameLabel.text = user.userName
    }
    
    func setupNaviItem() {
        navigationItem.title = "Travel Friends"
    }

    private func setupProfileImageView() {
        let tapGuesture = UITapGestureRecognizer(target: self, action: #selector(imageViewTapped))
        profileImageView.addGestureRecognizer(tapGuesture)

        let url = URL(string: user.profileImage)!
        profileImageView.kf.setImage(with: url)
    }

    @objc
    private func imageViewTapped() {
        print(#function)
    }
}
