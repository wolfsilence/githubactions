//
//  MeHeaderView.swift
//  GithubActions
//

import UIKit

final class MeHeaderView: UIView {

    // MARK: - UI Components

    private let avatarView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 35
        view.clipsToBounds = true
        view.backgroundColor = .systemGreen
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private let avatarLabel: UILabel = {
        let label = UILabel()
        label.text = "我"
        label.textColor = .white
        label.font = .systemFont(ofSize: 28, weight: .medium)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Jacky"
        label.font = .systemFont(ofSize: 20, weight: .semibold)
        label.textColor = .label
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let wechatIdLabel: UILabel = {
        let label = UILabel()
        label.text = "微信号：jacky_wechat"
        label.font = .systemFont(ofSize: 14)
        label.textColor = .secondaryLabel
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let qrCodeButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "qrcode"), for: .normal)
        button.tintColor = .secondaryLabel
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private let arrowButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "chevron.right"), for: .normal)
        button.tintColor = .tertiaryLabel
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    // MARK: - Init

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupUI() {
        backgroundColor = .clear

        addSubview(avatarView)
        avatarView.addSubview(avatarLabel)
        addSubview(nameLabel)
        addSubview(wechatIdLabel)
        addSubview(qrCodeButton)
        addSubview(arrowButton)

        NSLayoutConstraint.activate([
            avatarView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            avatarView.centerYAnchor.constraint(equalTo: centerYAnchor),
            avatarView.widthAnchor.constraint(equalToConstant: 70),
            avatarView.heightAnchor.constraint(equalToConstant: 70),

            avatarLabel.centerXAnchor.constraint(equalTo: avatarView.centerXAnchor),
            avatarLabel.centerYAnchor.constraint(equalTo: avatarView.centerYAnchor),

            nameLabel.leadingAnchor.constraint(equalTo: avatarView.trailingAnchor, constant: 16),
            nameLabel.topAnchor.constraint(equalTo: avatarView.topAnchor, constant: 6),

            wechatIdLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            wechatIdLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 6),
            wechatIdLabel.trailingAnchor.constraint(lessThanOrEqualTo: qrCodeButton.leadingAnchor, constant: -8),

            qrCodeButton.centerYAnchor.constraint(equalTo: wechatIdLabel.centerYAnchor),
            qrCodeButton.leadingAnchor.constraint(equalTo: wechatIdLabel.trailingAnchor, constant: 4),

            arrowButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            arrowButton.centerYAnchor.constraint(equalTo: centerYAnchor),
        ])
    }
}
