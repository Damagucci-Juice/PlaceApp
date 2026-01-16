//
//  ChatsViewController.swift
//  PlaceApp
//
//  Created by Gucci on 1/16/26.
//

import UIKit

final class ChatsViewController: UIViewController {

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
        let cell = UITableViewCell()
        cell.textLabel?.text = "\(mockChatRooms[indexPath.row].chatRoomId)번방"

        cell.backgroundColor = .brown
        cell.selectionStyle = .none

        return cell
    }
    

}

extension ChatsViewController: TableBasicProtocol {
    func setupTable() {
        tableView.delegate = self
        tableView.dataSource = self
    }
}

extension ChatsViewController: Drawable {
    func setupUI() {
    }

    func setupAttribute() {
        setupTable()
        setupNaviItem()
    }
    
    func setupNaviItem() {
        navigationItem.title = "TRAVEL TALK"
    }
}
