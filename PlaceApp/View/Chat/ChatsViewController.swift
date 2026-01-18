//
//  ChatsViewController.swift
//  PlaceApp
//
//  Created by Gucci on 1/16/26.
//

import UIKit

final class ChatsViewController: UIViewController, Reusable {

    @IBOutlet var tableView: UITableView!

    @IBOutlet var searchTextField: UITextField!

    var datasource = [ChatRoom]()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupAttribute()
        datasource = mockChatRooms
    }

}

// MARK: - Tableview

extension ChatsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: DialogViewController.identifier) as! DialogViewController
        vc.chatroom = datasource[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension ChatsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        datasource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: PersonalChatRoomTableViewCell.identifier, for: indexPath) as? PersonalChatRoomTableViewCell else { return UITableViewCell() }

        cell.configure(datasource[indexPath.row])

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
        tableView.backgroundColor = .white
    }
}


// MARK: - View Controllers

extension ChatsViewController: Drawable {
    // storyboard constraints
    func setupUI() { }

    func setupAttribute() {
        setupTable()
        setupNaviItem()
        setupTextField()
    }
    
    func setupNaviItem() {
        navigationItem.title = "TRAVEL TALK"
    }
}

// MARK: - SearchTextField

extension ChatsViewController {

    func setupTextField() {
        searchTextField.setDefaultStyle("상대방 검색")
        searchTextField.addTarget(
            self,
            action: #selector(textFieldEditingDidEndOnExit),
            for: .editingDidEndOnExit
        )
    }

    @objc private func textFieldEditingDidEndOnExit(_ tf: UITextField) {
        print(#function, )
        guard let text = tf.text, !text.isEmpty else {
            setDatasource(mockChatRooms)
            return
        }
        
        setDatasource(chatRooms(by: filteredUsers(text)))
    }
    
    private func setDatasource(_ roominfo: [ChatRoom]) {
        datasource = roominfo
        tableView.reloadData()
    }
    
    private func filteredUsers(_ text: String) -> [User] {
        mockUsers.filter { user in
            user.userName.lowercased().contains(text.lowercased())
        }
    }
    
    private func chatRooms(by users: [User]) -> [ChatRoom] {
        var result = [ChatRoom]()
        for user in users {
            let chrooms = mockChatRooms.filter { cr in
                cr.participantIds.contains(user.userId)
            }
            result.append(contentsOf: chrooms)
        }
        return result
    }
}
