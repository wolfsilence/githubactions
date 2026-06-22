//
//  MainTabBarController.swift
//  GithubActions
//

import UIKit

final class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabs()
        setupAppearance()
    }

    private func setupTabs() {
        let chatsVC = ChatsViewController()
        let chatsNav = UINavigationController(rootViewController: chatsVC)
        chatsNav.tabBarItem = UITabBarItem(
            title: "微信",
            image: UIImage(systemName: "message.fill"),
            selectedImage: UIImage(systemName: "message.fill")
        )

        let contactsVC = ContactsViewController()
        let contactsNav = UINavigationController(rootViewController: contactsVC)
        contactsNav.tabBarItem = UITabBarItem(
            title: "通讯录",
            image: UIImage(systemName: "person.2.fill"),
            selectedImage: UIImage(systemName: "person.2.fill")
        )

        let discoverVC = DiscoverViewController()
        let discoverNav = UINavigationController(rootViewController: discoverVC)
        discoverNav.tabBarItem = UITabBarItem(
            title: "发现",
            image: UIImage(systemName: "circle.grid.2x2.fill"),
            selectedImage: UIImage(systemName: "circle.grid.2x2.fill")
        )

        let meVC = MeViewController()
        let meNav = UINavigationController(rootViewController: meVC)
        meNav.tabBarItem = UITabBarItem(
            title: "我",
            image: UIImage(systemName: "person.crop.circle.fill"),
            selectedImage: UIImage(systemName: "person.crop.circle.fill")
        )

        viewControllers = [chatsNav, contactsNav, discoverNav, meNav]
    }

    private func setupAppearance() {
        tabBar.tintColor = UIColor(red: 0.07, green: 0.75, blue: 0.16, alpha: 1.0)
        tabBar.backgroundColor = .systemBackground

        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .systemBackground
        appearance.titleTextAttributes = [.foregroundColor: UIColor.label]
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
    }
}
