//
//  ChatDetailViewController.swift
//  GithubActions
//

import UIKit

final class ChatDetailViewController: UIViewController {

    // MARK: - Properties

    private let chat: Chat
    private var messages: [Message] = []

    // MARK: - UI

    private let tableView: UITableView = {
        let table = UITableView(frame: .zero, style: .plain)
        table.separatorStyle = .none
        table.backgroundColor = UIColor(red: 0.93, green: 0.93, blue: 0.93, alpha: 1.0)
        table.contentInset = UIEdgeInsets(top: 8, left: 0, bottom: 8, right: 0)
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()

    // MARK: - Init

    init(chat: Chat) {
        self.chat = chat
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        title = chat.name
        messages = MockData.messages(for: chat)
        setupUI()
    }

    private func setupUI() {
        view.addSubview(tableView)

        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])

        tableView.delegate = self
        tableView.dataSource = self
    }
}

// MARK: - UITableViewDataSource

extension ChatDetailViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let message = messages[indexPath.row]
        let identifier = message.isFromMe ? "MeCell" : "OtherCell"
        let cell: UITableViewCell

        if let dequeued = tableView.dequeueReusableCell(withIdentifier: identifier) {
            cell = dequeued
        } else {
            cell = UITableViewCell(style: .default, reuseIdentifier: identifier)
            cell.selectionStyle = .none
            cell.backgroundColor = .clear
            setupBubble(in: cell, isFromMe: message.isFromMe)
        }

        configureCell(cell, with: message)
        return cell
    }

    private func setupBubble(in cell: UITableViewCell, isFromMe: Bool) {
        let bubbleView = UIView()
        bubbleView.tag = 100
        bubbleView.layer.cornerRadius = 16
        bubbleView.translatesAutoresizingMaskIntoConstraints = false
        cell.contentView.addSubview(bubbleView)

        let label = UILabel()
        label.tag = 101
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        bubbleView.addSubview(label)

        if isFromMe {
            bubbleView.backgroundColor = UIColor(red: 0.58, green: 0.91, blue: 0.45, alpha: 1.0)
            label.textColor = .label
            NSLayoutConstraint.activate([
                bubbleView.trailingAnchor.constraint(equalTo: cell.contentView.trailingAnchor, constant: -16),
                bubbleView.topAnchor.constraint(equalTo: cell.contentView.topAnchor, constant: 4),
                bubbleView.bottomAnchor.constraint(equalTo: cell.contentView.bottomAnchor, constant: -4),
                bubbleView.widthAnchor.constraint(lessThanOrEqualToConstant: 260),
                bubbleView.leadingAnchor.constraint(greaterThanOrEqualTo: cell.contentView.leadingAnchor, constant: 60),
            ])
        } else {
            bubbleView.backgroundColor = .white
            label.textColor = .label
            NSLayoutConstraint.activate([
                bubbleView.leadingAnchor.constraint(equalTo: cell.contentView.leadingAnchor, constant: 16),
                bubbleView.topAnchor.constraint(equalTo: cell.contentView.topAnchor, constant: 4),
                bubbleView.bottomAnchor.constraint(equalTo: cell.contentView.bottomAnchor, constant: -4),
                bubbleView.widthAnchor.constraint(lessThanOrEqualToConstant: 260),
                bubbleView.trailingAnchor.constraint(lessThanOrEqualTo: cell.contentView.trailingAnchor, constant: -60),
            ])
        }

        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: bubbleView.leadingAnchor, constant: 12),
            label.trailingAnchor.constraint(equalTo: bubbleView.trailingAnchor, constant: -12),
            label.topAnchor.constraint(equalTo: bubbleView.topAnchor, constant: 8),
            label.bottomAnchor.constraint(equalTo: bubbleView.bottomAnchor, constant: -8),
        ])
    }

    private func configureCell(_ cell: UITableViewCell, with message: Message) {
        guard let bubbleView = cell.contentView.viewWithTag(100),
              let label = bubbleView.viewWithTag(101) as? UILabel else {
            return
        }
        label.text = message.text
    }
}

// MARK: - UITableViewDelegate

extension ChatDetailViewController: UITableViewDelegate {}
