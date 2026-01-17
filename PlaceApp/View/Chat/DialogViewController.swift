//
//  DialogViewController.swift
//  PlaceApp
//
//  Created by Gucci on 1/16/26.
//

import UIKit

final class DialogViewController: UIViewController {

    @IBOutlet var tableView: UITableView!

    // MARK: - 필수 데이터니까 ! 써서 없으면 조기 탈락하게 하기
    var chatroom: ChatRoom!

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

        tableView.rowHeight = 100

        tableView.backgroundColor = .orange
    }
    

}

extension DialogViewController: Drawable {
    func setupUI() { }

    func setupAttribute() {
        setupTable()
        setupNaviItem()
    }
    
    func setupNaviItem() {
        navigationItem.title = opponent.userName
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

            cell = myChatCell
        } else {
            // 상대방

            guard let othersChatCell = tableView.dequeueReusableCell(withIdentifier: OthersChatTableViewCell.identifier, for: indexPath) as? OthersChatTableViewCell
            else { return UITableViewCell() }
            // configure

            cell = othersChatCell
        }

        return cell
    }
}
