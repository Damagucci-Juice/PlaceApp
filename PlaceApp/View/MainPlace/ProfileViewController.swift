//
//  ProfileViewController.swift
//  PlaceApp
//
//  Created by Gucci on 1/15/26.
//

import UIKit

import SnapKit
import Toast

let nicknameKey = "Nickname"

class ProfileViewController: UIViewController {

    private lazy var nicknameTextField: UITextField = {
        let result = UITextField()
        return result
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        setupAttribute()
    }

    func setupUI() {
        view.addSubview(nicknameTextField)

        nicknameTextField.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(32)
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(32)
            make.height.equalTo(50)
        }
    }

    func setupAttribute() {
        setCommonBackgroundColor()
        let nickname = UserDefaults.standard.string(forKey: nicknameKey) ?? "홍길동"
        nicknameTextField.setDefaultStyle(nickname)

        navigationItem.title = "프로필 설정"
        nicknameTextField.addTarget(self, action: #selector(textFieldDidReture), for: .editingDidEndOnExit)

        let doneButton = UIBarButtonItem(title: "완료", style: .plain, target: self, action: #selector(rightBarButtonItemTapped))

        navigationItem.rightBarButtonItem = doneButton
    }

    @objc
    func textFieldDidReture(_ sender: UITextField) {
        guard let text = sender.text, !text.isEmpty else { return }

        UserDefaults.standard.set(text, forKey: nicknameKey)
        view.makeToast("닉네임 설정이 완료되었습니다.")
    }

    @objc
    func rightBarButtonItemTapped() {
        textFieldDidReture(nicknameTextField)
    }
}
