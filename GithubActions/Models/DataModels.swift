//
//  DataModels.swift
//  GithubActions
//

import UIKit

// MARK: - Chat Model

struct Chat {
    let id: String
    let name: String
    let lastMessage: String
    let time: String
    let avatarColor: UIColor
    let unreadCount: Int
}

// MARK: - Contact Model

struct Contact {
    let id: String
    let name: String
    let pinyin: String
    let avatarColor: UIColor
}

// MARK: - Discover Item

struct DiscoverItem {
    let icon: String
    let title: String
    let showBadge: Bool
}

struct DiscoverSection {
    let items: [DiscoverItem]
}

// MARK: - Me Item

struct MeItem {
    let icon: String
    let title: String
}

struct MeSection {
    let items: [MeItem]
}

// MARK: - Message (for Chat Detail)

struct Message {
    let id: String
    let text: String
    let isFromMe: Bool
    let time: String
}
