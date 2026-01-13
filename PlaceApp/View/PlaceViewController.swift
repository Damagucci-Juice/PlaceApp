//
//  ViewController.swift
//  PlaceApp
//
//  Created by Gucci on 1/13/26.
//

import UIKit

final class PlaceViewController: UIViewController {

    @IBOutlet var headerSeparator: UIView!
    @IBOutlet var searchTextField: UITextField!
    @IBOutlet var filterSegmentControl: UISegmentedControl!
    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAttributes()
    }

    private func setupAttributes() {
        navigationItem.title = "범죄 도시"
        setTableView()
        setHeaderSeparator()
    }
}

private extension PlaceViewController {
    func setHeaderSeparator() {
        headerSeparator.backgroundColor = .lightGray
    }

    func setTableView() {
        let xib = UINib(nibName: CityTableViewCell.identifier, bundle: nil)
        tableView.register(xib, forCellReuseIdentifier: CityTableViewCell.identifier)

        tableView.dataSource = self
        tableView.separatorStyle = .none

        tableView.rowHeight = 200
    }
}

extension PlaceViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        CityInfo.city.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CityTableViewCell.identifier, for: indexPath) as? CityTableViewCell else { return UITableViewCell() }

        let item = CityInfo.city[indexPath.row]
        cell.configure(item,
                       UIImage(systemName: "person.fill"))

        return cell
    }
}
