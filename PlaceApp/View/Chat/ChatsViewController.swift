//
//  ChatsViewController.swift
//  PlaceApp
//
//  Created by Gucci on 1/16/26.
//

import UIKit

final class ChatsViewController: UIViewController, Reusable {

    @IBOutlet var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupAttribute()
    }

}


extension ChatsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(#function, indexPath)

        // 1. 어떤 스토리보드 파일
        let sb = UIStoryboard(name: "Main", bundle: nil)
        // 2. 어떤 뷰 컨트롤러
        let vc = sb.instantiateViewController(withIdentifier: DialogViewController.identifier) as! DialogViewController

        vc.chatroom = mockChatRooms[indexPath.row]

        // 3. 어떤 방식으로 띄워줘
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension ChatsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        mockChatRooms.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: PersonalChatRoomTableViewCell.identifier, for: indexPath) as? PersonalChatRoomTableViewCell else { return UITableViewCell() }

        cell.configure(mockChatRooms[indexPath.row])

        cell.selectionStyle = .none

        return cell
    }
    

}

extension ChatsViewController: TableBasicProtocol {
    func setupTable() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 100.0
        tableView.separatorStyle = .none

        let singleXib = UINib(nibName: PersonalChatRoomTableViewCell.identifier, bundle: nil)
        tableView.register(singleXib, forCellReuseIdentifier: PersonalChatRoomTableViewCell.identifier)
    }
}

extension ChatsViewController: Drawable {
    // storyboard constraints
    func setupUI() { }

    func setupAttribute() {
        setupTable()
        setupNaviItem()
    }
    
    func setupNaviItem() {
        navigationItem.title = "TRAVEL TALK"
    }
}
