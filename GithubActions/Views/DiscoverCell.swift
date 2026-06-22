//
//  DiscoverCell.swift
//  GithubActions
//

import UIKit

final class DiscoverCell: UITableViewCell {

    static let identifier = "DiscoverCell"

    // MARK: - UI Components

    private let iconView: UIImageView = {
        let imageView = UIImageView()
        imageView.tintColor = .white
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private let iconBackground: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 6
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 17)
        label.textColor = .label
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let badgeDot: UIView = {
        let view = UIView()
        view.backgroundColor = .systemRed
        view.layer.cornerRadius = 4
        view.clipsToBounds = true
        view.isHidden = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    // MARK: - Init

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupUI() {
        accessoryType = .disclosureIndicator

        contentView.addSubview(iconBackground)
        iconBackground.addSubview(iconView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(badgeDot)

        NSLayoutConstraint.activate([
            iconBackground.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            iconBackground.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            iconBackground.widthAnchor.constraint(equalToConstant: 32),
            iconBackground.heightAnchor.constraint(equalToConstant: 32),

            iconView.centerXAnchor.constraint(equalTo: iconBackground.centerXAnchor),
            iconView.centerYAnchor.constraint(equalTo: iconBackground.centerYAnchor),
            iconView.widthAnchor.constraint(equalToConstant: 20),
            iconView.heightAnchor.constraint(equalToConstant: 20),

            titleLabel.leadingAnchor.constraint(equalTo: iconBackground.trailingAnchor, constant: 12),
            titleLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),

            badgeDot.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            badgeDot.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            badgeDot.widthAnchor.constraint(equalToConstant: 8),
            badgeDot.heightAnchor.constraint(equalToConstant: 8),
        ])
    }

    func configure(with item: DiscoverItem) {
        iconView.image = UIImage(systemName: item.icon)
        iconBackground.backgroundColor = item.iconBackgroundColor
        titleLabel.text = item.title
        badgeDot.isHidden = !item.showBadge
    }
}

// MARK: - Icon background color helper

extension DiscoverItem {
    var iconBackgroundColor: UIColor {
        switch icon {
        case "photo.on.rectangle.angled": return .systemBlue
        case "video.fill": return .systemRed
        case "antenna.radiowaves.left.and.right": return .systemOrange
        case "qrcode.viewfinder": return .systemPurple
        case "iphone.radiowaves.left.and.right": return .systemGreen
        case "eye.fill": return .systemOrange
        case "magnifyingglass": return .systemRed
        case "square.grid.2x2.fill": return .systemBlue
        default: return .systemGray
        }
    }
}
