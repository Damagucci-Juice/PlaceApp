//
//  DialogViewController.swift
//  PlaceApp
//
//  Created by Gucci on 1/16/26.
//

import UIKit

import SnapKit

final class DialogViewController: UIViewController {

    @IBOutlet var tableView: UITableView!

    var chatroom: ChatRoom!

    private lazy var scrollToBottomButton: UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(systemName: "arrow.down"), for: .normal)
        btn.tintColor = .black
        return btn
    }()

    var opponent: User {
        chatroom.participantIds
            .filter { $0 != 0 }
            .map { opId in
                mockUsers.first { op in
                    op.userId == opId
                }
            }
            .compactMap { user in
                user
            }
            .first!
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupAttribute()
    }
}

extension DialogViewController: Reusable { }

extension DialogViewController: TableBasicProtocol {
    func setupTable() {
        tableView.delegate = self
        tableView.dataSource = self

        let myCellXib = UINib(nibName: MyChatTableViewCell.identifier, bundle: nil)

        let ohtersCellXib = UINib(nibName: OthersChatTableViewCell.identifier, bundle: nil)

        tableView.register(myCellXib, forCellReuseIdentifier: MyChatTableViewCell.identifier)
        tableView.register(ohtersCellXib, forCellReuseIdentifier: OthersChatTableViewCell.identifier)

        tableView.rowHeight = UITableView.automaticDimension

        tableView.backgroundColor = .white
        tableView.separatorStyle = .none
    }

}

extension DialogViewController: Drawable {
    func setupUI() {
        view.addSubview(scrollToBottomButton)

        scrollToBottomButton.translatesAutoresizingMaskIntoConstraints = false

        scrollToBottomButton.snp.makeConstraints { make in
            make.bottom.trailing.equalTo(view.safeAreaLayoutGuide).inset(16)
        }
    }

    func setupAttribute() {
        setupTable()
        setupNaviItem()
        setScrollBottomButton()
    }
    
    func setupNaviItem() {
        navigationItem.title = opponent.userName
    }

    private func setScrollBottomButton() {
        scrollToBottomButton.addTarget(self, action: #selector(scrollBottomButtonTapped), for: .touchUpInside)
    }

    @objc private func scrollBottomButtonTapped() {
        // 인덱스 기반
        let index = IndexPath(row: chatroom!.messages.count - 1, section: 0)
        tableView.scrollToRow(at: index, at: .bottom, animated: false)
    }
}

extension DialogViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        chatroom?.messages.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let messages = chatroom?.messages else { return UITableViewCell() }

        var cell = UITableViewCell()
        // me
        if messages[indexPath.row].senderId == 0 {
            guard let myChatCell = tableView.dequeueReusableCell(withIdentifier: MyChatTableViewCell.identifier, for: indexPath) as? MyChatTableViewCell
            else { return UITableViewCell() }

            // configure
            myChatCell.configure(messages[indexPath.item])
            cell = myChatCell
        } else {
            // 상대방

            guard let othersChatCell = tableView.dequeueReusableCell(withIdentifier: OthersChatTableViewCell.identifier, for: indexPath) as? OthersChatTableViewCell
            else { return UITableViewCell() }
            // configure
            othersChatCell.configure(messages[indexPath.item])
            cell = othersChatCell
        }

        cell.selectionStyle = .none
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let cell = tableView.cellForRow(at: indexPath) as? Tappable else { return }
        cell.handleDidTapped()
        tableView.performBatchUpdates(nil, completion: nil)
    }

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        scrollToBottomButton.isHidden = scrollView.isBottom
    }
}
