//
//  MockData.swift
//  GithubActions
//

import UIKit

struct MockData {

    // MARK: - Chats

    static let chats: [Chat] = [
        Chat(id: "1", name: "张三", lastMessage: "好的，明天见！", time: "12:30", avatarColor: .systemBlue, unreadCount: 3),
        Chat(id: "2", name: "家庭群", lastMessage: "妈: 晚饭回来吃吗？", time: "12:15", avatarColor: .systemGreen, unreadCount: 0),
        Chat(id: "3", name: "李四", lastMessage: "[图片]", time: "11:42", avatarColor: .systemOrange, unreadCount: 1),
        Chat(id: "4", name: "项目讨论组", lastMessage: "王五: 文档已更新，大家看一下", time: "10:30", avatarColor: .systemPurple, unreadCount: 28),
        Chat(id: "5", name: "赵六", lastMessage: "收到，谢谢！", time: "09:18", avatarColor: .systemPink, unreadCount: 0),
        Chat(id: "6", name: "大学同学群", lastMessage: "班长: 下周六聚会，大家有空吗？", time: "昨天", avatarColor: .systemTeal, unreadCount: 5),
        Chat(id: "7", name: "钱七", lastMessage: "你到了吗？我在门口等你", time: "昨天", avatarColor: .systemIndigo, unreadCount: 0),
        Chat(id: "8", name: "孙八", lastMessage: "哈哈哈哈好的", time: "昨天", avatarColor: .systemRed, unreadCount: 0),
        Chat(id: "9", name: "周九", lastMessage: "文件已经发你邮箱了", time: "周一", avatarColor: .systemMint, unreadCount: 0),
        Chat(id: "10", name: "吴十", lastMessage: "语音通话 05:32", time: "周一", avatarColor: .systemBrown, unreadCount: 0),
        Chat(id: "11", name: "技术交流群", lastMessage: "有人用过SwiftUI的@Observable吗？", time: "周日", avatarColor: .systemCyan, unreadCount: 12),
        Chat(id: "12", name: "郑十一", lastMessage: "生日快乐！🎂", time: "6/15", avatarColor: .systemYellow, unreadCount: 0),
    ]

    // MARK: - Contacts

    static let contacts: [Contact] = [
        // A
        Contact(id: "c1", name: "安迪", pinyin: "andi", avatarColor: .systemBlue),
        // B
        Contact(id: "c2", name: "白冰", pinyin: "baibing", avatarColor: .systemGreen),
        Contact(id: "c3", name: "包小萌", pinyin: "baoxiaomeng", avatarColor: .systemTeal),
        // C
        Contact(id: "c4", name: "陈晨", pinyin: "chenchen", avatarColor: .systemOrange),
        Contact(id: "c5", name: "程小夕", pinyin: "chengxiaoxi", avatarColor: .systemPink),
        // D
        Contact(id: "c6", name: "杜飞", pinyin: "dufei", avatarColor: .systemPurple),
        Contact(id: "c7", name: "邓超", pinyin: "dengchao", avatarColor: .systemIndigo),
        // F
        Contact(id: "c8", name: "方大同", pinyin: "fangdatong", avatarColor: .systemRed),
        Contact(id: "c9", name: "冯小刚", pinyin: "fengxiaogang", avatarColor: .systemMint),
        // G
        Contact(id: "c10", name: "高圆圆", pinyin: "gaoyuanyuan", avatarColor: .systemBrown),
        // H
        Contact(id: "c11", name: "黄晓明", pinyin: "huangxiaoming", avatarColor: .systemCyan),
        Contact(id: "c12", name: "胡歌", pinyin: "huge", avatarColor: .systemYellow),
        Contact(id: "c13", name: "韩雪", pinyin: "hanxue", avatarColor: .systemGray),
        // L
        Contact(id: "c14", name: "李小龙", pinyin: "lixiaolong", avatarColor: .systemBlue),
        Contact(id: "c15", name: "刘德华", pinyin: "liudehua", avatarColor: .systemGreen),
        Contact(id: "c16", name: "林志玲", pinyin: "linzhiling", avatarColor: .systemOrange),
        Contact(id: "c17", name: "罗大佑", pinyin: "luodayou", avatarColor: .systemPink),
        // M
        Contact(id: "c18", name: "马化腾", pinyin: "mahateng", avatarColor: .systemPurple),
        Contact(id: "c19", name: "马云", pinyin: "mayun", avatarColor: .systemTeal),
        // S
        Contact(id: "c20", name: "孙燕姿", pinyin: "sunyanzi", avatarColor: .systemIndigo),
        // W
        Contact(id: "c21", name: "王菲", pinyin: "wangfei", avatarColor: .systemRed),
        Contact(id: "c22", name: "吴京", pinyin: "wujing", avatarColor: .systemMint),
        Contact(id: "c23", name: "王祖贤", pinyin: "wangzuxian", avatarColor: .systemBrown),
        // Z
        Contact(id: "c24", name: "周杰伦", pinyin: "zhoujielun", avatarColor: .systemCyan),
        Contact(id: "c25", name: "张曼玉", pinyin: "zhangmanyu", avatarColor: .systemYellow),
        Contact(id: "c26", name: "赵薇", pinyin: "zhaowei", avatarColor: .systemGray),
    ]

    static var groupedContacts: [(letter: String, contacts: [Contact])] {
        let grouped = Dictionary(grouping: contacts) { contact in
            String(contact.pinyin.prefix(1)).uppercased()
        }
        return grouped.sorted { $0.key < $1.key }.map { ($0.key, $0.value.sorted { $0.pinyin < $1.pinyin }) }
    }

    // MARK: - Discover

    static let discoverSections: [DiscoverSection] = [
        DiscoverSection(items: [
            DiscoverItem(icon: "photo.on.rectangle.angled", title: "朋友圈", showBadge: true)
        ]),
        DiscoverSection(items: [
            DiscoverItem(icon: "video.fill", title: "视频号", showBadge: false),
            DiscoverItem(icon: "antenna.radiowaves.left.and.right", title: "直播", showBadge: false)
        ]),
        DiscoverSection(items: [
            DiscoverItem(icon: "qrcode.viewfinder", title: "扫一扫", showBadge: false),
            DiscoverItem(icon: "iphone.radiowaves.left.and.right", title: "摇一摇", showBadge: false)
        ]),
        DiscoverSection(items: [
            DiscoverItem(icon: "eye.fill", title: "看一看", showBadge: false),
            DiscoverItem(icon: "magnifyingglass", title: "搜一搜", showBadge: false)
        ]),
        DiscoverSection(items: [
            DiscoverItem(icon: "square.grid.2x2.fill", title: "小程序", showBadge: false)
        ])
    ]

    // MARK: - Me

    static let meSections: [MeSection] = [
        MeSection(items: [
            MeItem(icon: "creditcard.fill", title: "支付")
        ]),
        MeSection(items: [
            MeItem(icon: "folder.fill", title: "收藏"),
            MeItem(icon: "photo.fill", title: "相册"),
            MeItem(icon: "wallet.pass.fill", title: "卡包"),
            MeItem(icon: "face.smiling.fill", title: "表情")
        ]),
        MeSection(items: [
            MeItem(icon: "gearshape.fill", title: "设置")
        ])
    ]

    // MARK: - Chat Detail Messages

    static func messages(for chat: Chat) -> [Message] {
        return [
            Message(id: "m1", text: "你好！", isFromMe: false, time: "10:00"),
            Message(id: "m2", text: "你好呀，好久不见！", isFromMe: true, time: "10:01"),
            Message(id: "m3", text: "最近怎么样？", isFromMe: false, time: "10:02"),
            Message(id: "m4", text: "挺好的，最近在忙一个新项目", isFromMe: true, time: "10:03"),
            Message(id: "m5", text: "什么项目呀？", isFromMe: false, time: "10:03"),
            Message(id: "m6", text: "一个iOS App，用Swift写的", isFromMe: true, time: "10:04"),
            Message(id: "m7", text: "厉害！我也在学Swift", isFromMe: false, time: "10:05"),
            Message(id: "m8", text: "有什么问题可以问我", isFromMe: true, time: "10:05"),
            Message(id: "m9", text: "太好了！正好有个问题想请教你", isFromMe: false, time: "10:06"),
            Message(id: "m10", text: "你说", isFromMe: true, time: "10:07"),
            Message(id: "m11", text: "UITableView的性能优化有什么建议吗？", isFromMe: false, time: "10:08"),
            Message(id: "m12", text: "主要是cell复用和高度缓存，还有就是尽量避免在cellForRow里做复杂计算", isFromMe: true, time: "10:10"),
            Message(id: "m13", text: "明白了，我试试看。还有个问题关于自动布局的...", isFromMe: false, time: "10:11"),
            Message(id: "m14", text: "嗯嗯，自动布局的话要注意约束冲突，可以用layout debugger查看", isFromMe: true, time: "10:12"),
            Message(id: "m15", text: "好的好的，太感谢了！", isFromMe: false, time: "10:13"),
            Message(id: "m16", text: "不客气，随时问我", isFromMe: true, time: "10:14"),
            Message(id: "m17", text: "对了，周末有空一起吃饭吗？", isFromMe: false, time: "10:15"),
            Message(id: "m18", text: "可以啊，去哪吃？", isFromMe: true, time: "10:16"),
            Message(id: "m19", text: "新开了一家川菜馆，听说不错", isFromMe: false, time: "10:17"),
            Message(id: "m20", text: "好的，明天见！", isFromMe: true, time: "12:30"),
        ]
    }
}
