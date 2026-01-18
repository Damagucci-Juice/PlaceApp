//
//  DialogViewController.swift
//  PlaceApp
//
//  Created by Gucci on 1/16/26.
//

import UIKit

import SnapKit

final class DialogViewController: UIViewController {


    private lazy var tableView: UITableView = {
        let result = UITableView(frame: .zero, style: .grouped)
        return result
    }()

    var chatroom: ChatRoom!

    private var messages: [[Message]] {
        var result = [[Message]]()
        var today = [Message]()
        for m in chatroom.messages {
            if today.isEmpty {
                today.append(m)
                continue
            }

            if let last = today.last {
                let lastStr = last.timestamp.formatted(date: .numeric, time: .omitted)
                let dateStr = m.timestamp.formatted(date: .numeric, time: .omitted)

                if lastStr == dateStr {
                    today.append(m)
                    continue
                } else {
                    result.append(today)
                    today.removeAll()
                    today.append(m)
                }
            }
        }
        if !today.isEmpty {
            result.append(today)
        }
        return result
    }

    private lazy var scrollToBottomButton: UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(systemName: "arrow.down"), for: .normal)
        btn.tintColor = .black
        return btn
    }()

    private lazy var textView: UITextView = {
        let result = UITextView()
        result.setCorner(8)
        result.setBorder(.gray)
        result.backgroundColor = .blue
        result.textColor = .black
        result.font = .systemFont(ofSize: 16)
        result.textAlignment = .left
        result.isScrollEnabled = false
        return result
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
        tableView.register(DateHeaderView.self, forHeaderFooterViewReuseIdentifier: DateHeaderView.identifier)

        tableView.rowHeight = UITableView.automaticDimension
        tableView.showsVerticalScrollIndicator = false
        tableView.sectionHeaderTopPadding = 0


        tableView.backgroundColor = .white
        tableView.separatorStyle = .none
    }

}

extension DialogViewController: Drawable {
    func setupUI() {
        view.addSubview(tableView)
        view.addSubview(textView)
        view.addSubview(scrollToBottomButton)

        let textViewHeight = 60.0

        scrollToBottomButton.snp.makeConstraints { make in
            make.bottom.equalTo(view.keyboardLayoutGuide.snp.top).offset(-(textViewHeight + 16))
            make.trailing.equalTo(view.safeAreaLayoutGuide).inset(16)
        }

        textView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-64)
            make.height.lessThanOrEqualTo(textViewHeight)
            make.bottom.equalTo(view.keyboardLayoutGuide.snp.top).offset(-8)
        }

        tableView.snp.makeConstraints { make in
            make.leading.trailing.top.equalToSuperview()
            make.bottom.equalTo(view.keyboardLayoutGuide.snp.top).offset(-(8 + textViewHeight))
        }
    }

    func setupAttribute() {
        setupTable()
        setTextView()
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
        let index = IndexPath(row: messages.last!.count - 1, section: messages.count-1)
        tableView.scrollToRow(at: index, at: .bottom, animated: false)
    }

    private func setTextView() {
        textView.delegate = self
        textView.backgroundColor = .white
    }
}

extension DialogViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        messages[section].count
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

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let message = messages[section].first,
              let header = tableView.dequeueReusableHeaderFooterView(
                withIdentifier: DateHeaderView.identifier
              ) as? DateHeaderView
        else { return nil }

        header.configure(message.timestamp)

        return header
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        25
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        messages.count
    }
}

extension DialogViewController: UITextViewDelegate {

    func textViewDidChange(_ tv: UITextView) {
        let size = CGSize(width: tv.bounds.width, height: .infinity)
        let estimatedSize = tv.sizeThatFits(size)

        let isMaxHeight = estimatedSize.height >= 40

        guard isMaxHeight != tv.isScrollEnabled else { return }
        tv.isScrollEnabled = isMaxHeight
        tv.reloadInputViews()
        tv.layoutIfNeeded()
    }

    func textViewDidChangeSelection(_ textView: UITextView) {
        textViewDidChange(textView)
    }
}
