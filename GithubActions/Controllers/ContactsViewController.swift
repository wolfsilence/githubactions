//
//  ContactsViewController.swift
//  GithubActions
//

import UIKit

final class ContactsViewController: UIViewController {

    // MARK: - UI

    private let tableView: UITableView = {
        let table = UITableView(frame: .zero, style: .plain)
        table.register(ContactCell.self, forCellReuseIdentifier: ContactCell.identifier)
        table.rowHeight = 56
        table.sectionIndexColor = UIColor(red: 0.07, green: 0.75, blue: 0.16, alpha: 1.0)
        table.sectionIndexBackgroundColor = .clear
        table.tableFooterView = UIView()
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()

    // MARK: - Data

    private let groupedContacts = MockData.groupedContacts

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "通讯录"
        setupUI()
        setupNavBar()
    }

    private func setupUI() {
        view.backgroundColor = .systemBackground
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

    private func setupNavBar() {
        let addButton = UIBarButtonItem(
            image: UIImage(systemName: "person.badge.plus"),
            style: .plain,
            target: nil,
            action: nil
        )
        addButton.tintColor = .label
        navigationItem.rightBarButtonItem = addButton
    }
}

// MARK: - UITableViewDataSource

extension ContactsViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return groupedContacts.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return groupedContacts[section].contacts.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ContactCell.identifier, for: indexPath) as? ContactCell else {
            return UITableViewCell()
        }
        let contact = groupedContacts[indexPath.section].contacts[indexPath.row]
        cell.configure(with: contact)
        return cell
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return groupedContacts[section].letter
    }

    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return groupedContacts.map { $0.letter }
    }
}

// MARK: - UITableViewDelegate

extension ContactsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }

    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        guard let header = view as? UITableViewHeaderFooterView else { return }
        header.textLabel?.font = .systemFont(ofSize: 14, weight: .semibold)
        header.textLabel?.textColor = .secondaryLabel
    }
}
