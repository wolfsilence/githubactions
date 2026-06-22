//
//  MeViewController.swift
//  GithubActions
//

import UIKit

final class MeViewController: UIViewController {

    // MARK: - UI

    private let tableView: UITableView = {
        let table = UITableView(frame: .zero, style: .insetGrouped)
        table.rowHeight = 48
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()

    // MARK: - Data

    private let sections = MockData.meSections

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupHeader()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }

    private func setupUI() {
        view.backgroundColor = .systemGroupedBackground
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

    private func setupHeader() {
        let headerView = MeHeaderView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: 120))
        headerView.backgroundColor = .clear

        // Wrapper to add more top padding
        let wrapperView = UIView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: 140))
        wrapperView.backgroundColor = .clear
        wrapperView.addSubview(headerView)

        headerView.frame = CGRect(x: 0, y: 20, width: view.bounds.width, height: 120)

        tableView.tableHeaderView = wrapperView
    }
}

// MARK: - UITableViewDataSource

extension MeViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections[section].items.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
        let item = sections[indexPath.section].items[indexPath.row]

        var config = cell.defaultContentConfiguration()
        config.text = item.title
        config.image = UIImage(systemName: item.icon)
        config.imageProperties.tintColor = .white
        config.imageProperties.reservedLayoutSize = CGSize(width: 32, height: 32)
        cell.contentConfiguration = config

        // Colored icon background
        let iconBg = UIView(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
        iconBg.layer.cornerRadius = 6
        iconBg.clipsToBounds = true
        iconBg.backgroundColor = item.iconBackground

        cell.imageView?.tintColor = .white
        cell.accessoryType = .disclosureIndicator
        cell.accessoryView?.backgroundColor = .clear

        // Use a custom image with background
        let symbolConfig = UIImage.SymbolConfiguration(pointSize: 16, weight: .medium)
        if let symbol = UIImage(systemName: item.icon, withConfiguration: symbolConfig) {
            let renderer = UIGraphicsImageRenderer(size: CGSize(width: 30, height: 30))
            let coloredImage = renderer.image { context in
                iconBg.layer.render(in: context.cgContext)
                symbol.withTintColor(.white).draw(at: CGPoint(x: 7, y: 7))
            }
            cell.imageView?.image = coloredImage.withRenderingMode(.alwaysOriginal)
        }

        return cell
    }
}

// MARK: - UITableViewDelegate

extension MeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

// MARK: - Icon background color

extension MeItem {
    var iconBackground: UIColor {
        switch icon {
        case "creditcard.fill": return .systemOrange
        case "folder.fill": return .systemYellow
        case "photo.fill": return .systemBlue
        case "wallet.pass.fill": return .systemGreen
        case "face.smiling.fill": return .systemRed
        case "gearshape.fill": return .systemGray
        default: return .systemGray
        }
    }
}
