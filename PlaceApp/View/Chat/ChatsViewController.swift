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

        let singleXib = UINib(nibName: PersonalChatRoomTableViewCell.identifier, bundle: nil)
        tableView.register(singleXib, forCellReuseIdentifier: PersonalChatRoomTableViewCell.identifier)

        // TODO: - Group Chat Register
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
