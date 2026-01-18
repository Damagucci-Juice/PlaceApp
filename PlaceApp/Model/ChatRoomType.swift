//
//  ChatRoomType.swift
//  PlaceApp
//
//  Created by Gucci on 1/16/26.
//


import Foundation

enum ChatRoomType {
    case personal
    case group
}

struct User {
    let userId: Int
    let userName: String
    let profileImage: String
    let statusMessage: String?
}

struct Message {
    let messageId: Int
    let senderId: Int
    let content: String
    let timestamp: Date
}

struct ChatRoom {
    let chatRoomId: Int
    let participantIds: [Int]
    let messages: [Message]
    let chatRoomType: ChatRoomType
}

// MARK: - User Dummy Data
let mockUsers: [User] = [
    User(userId: 0, userName: "나", profileImage: "", statusMessage: nil),
    User(userId: 1, userName: "Hue", profileImage: "https://images.unsplash.com/photo-1494790108377-be9c29b29330?w=100", statusMessage: "코딩은 예술이다"),
    User(userId: 2, userName: "Jack", profileImage: "https://images.unsplash.com/photo-1500648767791-00dcc994a43e?w=100", statusMessage: nil),
    User(userId: 3, userName: "Bran", profileImage: "https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=100", statusMessage: "과제 화이팅!"),
    User(userId: 4, userName: "SeSAC", profileImage: "https://images.unsplash.com/photo-1438761681033-6461ffad8d80?w=100", statusMessage: "식물 키우기 도전 중"),
    User(userId: 5, userName: "내옆자리에앉은개발잘하는친구", profileImage: "https://images.unsplash.com/photo-1472099645785-5658abf4ff4e?w=100", statusMessage: nil),
    User(userId: 6, userName: "심심이", profileImage: "https://images.unsplash.com/photo-1544725176-7c40e5a71c5e?w=100", statusMessage: nil),
    User(userId: 7, userName: "A", profileImage: "https://images.unsplash.com/photo-1527980965255-d3b416303d12?w=100", statusMessage: nil),
    User(userId: 8, userName: "iOS마스터를꿈꾸는27살김철수", profileImage: "https://images.unsplash.com/photo-1463453091185-61582044d556?w=100", statusMessage: nil),
    User(userId: 9, userName: "SwiftLover", profileImage: "https://images.unsplash.com/photo-1517841905240-472988babdf9?w=100", statusMessage: nil),
    User(userId: 10, userName: "B", profileImage: "https://images.unsplash.com/photo-1539571696357-5a69c17a67c6?w=100", statusMessage: nil),
    User(userId: 11, userName: "코딩하는디자이너입니다반갑습니다", profileImage: "https://images.unsplash.com/photo-1534528741775-53994a69daeb?w=100", statusMessage: nil),
    User(userId: 12, userName: "멍", profileImage: "https://images.unsplash.com/photo-1506794778202-cad84cf45f1d?w=100", statusMessage: nil),
    User(userId: 13, userName: "SeSAC_iOS_8기_화이팅!", profileImage: "https://images.unsplash.com/photo-1531746020798-e6953c6e8e04?w=100", statusMessage: nil),
    User(userId: 14, userName: "루", profileImage: "https://images.unsplash.com/photo-1552058544-f2b08422138a?w=100", statusMessage: nil),
    User(userId: 15, userName: "야옹", profileImage: "https://images.unsplash.com/photo-1580489944761-15a19d654956?w=100", statusMessage: nil)
]

// MARK: - ChatRoom Dummy Data (15개, personal only)
let mockChatRooms: [ChatRoom] = [
    
    // MARK: 1. Hue - 보통 메시지 (8개)
    ChatRoom(
        chatRoomId: 1,
        participantIds: [0, 1],
        messages: [
            Message(messageId: 101, senderId: 1, content: "오늘 스위프트 공부 어디까지 했어?오늘 스위프트 공부 어디까지 했어?오늘 스위프트 공부 어디까지 했어?오늘 스위프트 공부 어디까지 했어?오늘 스위프트 공부 어디까지 했어?오늘 스위프트 공부 어디까지 했어?오늘 스위프트 공부 어디까지 했어?오늘 스위프트 공부 어디까지 했어?오늘 스위프트 공부 어디까지 했어?오늘 스위프트 공부 어디까지 했어?오늘 스위프트 공부 어디까지 했어?오늘 스위프트 공부 어디까지 했어?오늘 스위프트 공부 어디까지 했어?오늘 스위프트 공부 어디까지 했어?오늘 스위프트 공부 어디까지 했어?오늘 스위프트 공부 어디까지 했어?오늘 스위프트 공부 어디까지 했어?오늘 스위프트 공부 어디까지 했어?오늘 스위프트 공부 어디까지 했어?오늘 스위프트 공부 어디까지 했어?오늘 스위프트 공부 어디까지 했어?오늘 스위프트 공부 어디까지 했어?오늘 스위프트 공부 어디까지 했어?오늘 스위프트 공부 어디까지 했어?오늘 스위프트 공부 어디까지 했어?오늘 스위프트 공부 어디까지 했어?오늘 스위프트 공부 어디까지 했어?오늘 스위프트 공부 어디까지 했어?오늘 스위프트 공부 어디까지 했어?오늘 스위프트 공부 어디까지 했어?오늘 스위프트 공부 어디까지 했어?오늘 스위프트 공부 어디까지 했어?오늘 스위프트 공부 어디까지 했어?오늘 스위프트 공부 어디까지 했어?오늘 스위프트 공부 어디까지 했어?오늘 스위프트 공부 어디까지 했어?오늘 스위프트 공부 어디까지 했어?오늘 스위프트 공부 어디까지 했어?오늘 스위프트 공부 어디까지 했어?오늘 스위프트 공부 어디까지 했어?오늘 스위프트 공부 어디까지 했어?오늘 스위프트 공부 어디까지 했어?오늘 스위프트 공부 어디까지 했어?오늘 스위프트 공부 어디까지 했어?오늘 스위프트 공부 어디까지 했어?오늘 스위프트 공부 어디까지 했어?오늘 스위프트 공부 어디까지 했어?오늘 스위프트 공부 어디까지 했어?오늘 스위프트 공부 어디까지 했어?오늘 스위프트 공부 어디까지 했어?", timestamp: Date(timeIntervalSince1970: 1705023000)),
            Message(messageId: 102, senderId: 0, content: "옵셔널 바인딩 배우는 중이야!옵셔널 바인딩 배우는 중이야!옵셔널 바인딩 배우는 중이야!옵셔널 바인딩 배우는 중이야!옵셔널 바인딩 배우는 중이야!옵셔널 바인딩 배우는 중이야!옵셔널 바인딩 배우는 중이야!옵셔널 바인딩 배우는 중이야!옵셔널 바인딩 배우는 중이야!옵셔널 바인딩 배우는 중이야!옵셔널 바인딩 배우는 중이야!옵셔널 바인딩 배우는 중이야!옵셔널 바인딩 배우는 중이야!옵셔널 바인딩 배우는 중이야!옵셔널 바인딩 배우는 중이야!옵셔널 바인딩 배우는 중이야!옵셔널 바인딩 배우는 중이야!옵셔널 바인딩 배우는 중이야!옵셔널 바인딩 배우는 중이야!옵셔널 바인딩 배우는 중이야!옵셔널 바인딩 배우는 중이야!옵셔널 바인딩 배우는 중이야!옵셔널 바인딩 배우는 중이야!옵셔널 바인딩 배우는 중이야!옵셔널 바인딩 배우는 중이야!옵셔널 바인딩 배우는 중이야!옵셔널 바인딩 배우는 중이야!옵셔널 바인딩 배우는 중이야!옵셔널 바인딩 배우는 중이야!옵셔널 바인딩 배우는 중이야!옵셔널 바인딩 배우는 중이야!옵셔널 바인딩 배우는 중이야!옵셔널 바인딩 배우는 중이야!옵셔널 바인딩 배우는 중이야!옵셔널 바인딩 배우는 중이야!옵셔널 바인딩 배우는 중이야!옵셔널 바인딩 배우는 중이야!옵셔널 바인딩 배우는 중이야!옵셔널 바인딩 배우는 중이야!옵셔널 바인딩 배우는 중이야!옵셔널 바인딩 배우는 중이야!옵셔널 바인딩 배우는 중이야!옵셔널 바인딩 배우는 중이야!옵셔널 바인딩 배우는 중이야!옵셔널 바인딩 배우는 중이야!옵셔널 바인딩 배우는 중이야!옵셔널 바인딩 배우는 중이야!옵셔널 바인딩 배우는 중이야!옵셔널 바인딩 배우는 중이야!옵셔널 바인딩 배우는 중이야!옵셔널 바인딩 배우는 중이야!옵셔널 바인딩 배우는 중이야!옵셔널 바인딩 배우는 중이야!옵셔널 바인딩 배우는 중이야!옵셔널 바인딩 배우는 중이야!옵셔널 바인딩 배우는 중이야!옵셔널 바인딩 배우는 중이야!옵셔널 바인딩 배우는 중이야!옵셔널 바인딩 배우는 중이야!옵셔널 바인딩 배우는 중이야!옵셔널 바인딩 배우는 중이야!옵셔널 바인딩 배우는 중이야!옵셔널 바인딩 배우는 중이야!옵셔널 바인딩 배우는 중이야!옵셔널 바인딩 배우는 중이야!옵셔널 바인딩 배우는 중이야!옵셔널 바인딩 배우는 중이야!옵셔널 바인딩 배우는 중이야!옵셔널 바인딩 배우는 중이야!", timestamp: Date(timeIntervalSince1970: 1705023300)),
            Message(messageId: 103, senderId: 1, content: "guard let은 조기 종료에 좋아", timestamp: Date(timeIntervalSince1970: 1705023480)),
            Message(messageId: 104, senderId: 1, content: "if let shorthand도 많이 쓰더라", timestamp: Date(timeIntervalSince1970: 1705023540)),
            Message(messageId: 105, senderId: 0, content: "shorthand가 뭐야?", timestamp: Date(timeIntervalSince1970: 1705023720)),
            Message(messageId: 106, senderId: 1, content: "Swift 5.7부터 가능해!", timestamp: Date(timeIntervalSince1970: 1705023900)),
            Message(messageId: 107, senderId: 0, content: "오 대박 편하다", timestamp: Date(timeIntervalSince1970: 1705024020)),
            Message(messageId: 108, senderId: 1, content: "왜요? 요즘 코딩이 대세인데", timestamp: Date(timeIntervalSince1970: 1705025700))
        ],
        chatRoomType: .personal
    ),
    
    // MARK: 2. Jack - 메시지 많음 (30개)
    ChatRoom(
        chatRoomId: 2,
        participantIds: [0, 2],
        messages: [
            Message(messageId: 201, senderId: 2, content: "깃 브랜치 만들었어?", timestamp: Date(timeIntervalSince1970: 1704952800)),
            Message(messageId: 202, senderId: 0, content: "응!", timestamp: Date(timeIntervalSince1970: 1704952860)),
            Message(messageId: 203, senderId: 2, content: "feature/login으로?", timestamp: Date(timeIntervalSince1970: 1704952920)),
            Message(messageId: 204, senderId: 0, content: "ㅇㅇ", timestamp: Date(timeIntervalSince1970: 1704952980)),
            Message(messageId: 205, senderId: 2, content: "나도 signup 만들었어", timestamp: Date(timeIntervalSince1970: 1704953040)),
            Message(messageId: 206, senderId: 0, content: "굳", timestamp: Date(timeIntervalSince1970: 1704953100)),
            Message(messageId: 207, senderId: 2, content: "충돌나면 어떡해?", timestamp: Date(timeIntervalSince1970: 1704953160)),
            Message(messageId: 208, senderId: 0, content: "Xcode가 도와줘", timestamp: Date(timeIntervalSince1970: 1704953220)),
            Message(messageId: 209, senderId: 2, content: "오키", timestamp: Date(timeIntervalSince1970: 1704953280)),
            Message(messageId: 210, senderId: 0, content: "터미널도 가능", timestamp: Date(timeIntervalSince1970: 1704953340)),
            Message(messageId: 211, senderId: 2, content: "git mergetool?", timestamp: Date(timeIntervalSince1970: 1704953400)),
            Message(messageId: 212, senderId: 0, content: "ㅇㅇ 그거", timestamp: Date(timeIntervalSince1970: 1704953460)),
            Message(messageId: 213, senderId: 2, content: "오늘 저녁에 작업하자", timestamp: Date(timeIntervalSince1970: 1704953520)),
            Message(messageId: 214, senderId: 0, content: "좋아", timestamp: Date(timeIntervalSince1970: 1704953580)),
            Message(messageId: 215, senderId: 2, content: "내일 PR 올려", timestamp: Date(timeIntervalSince1970: 1704953640)),
            Message(messageId: 216, senderId: 0, content: "알겠어", timestamp: Date(timeIntervalSince1970: 1704953700)),
            Message(messageId: 217, senderId: 2, content: "커밋 컨벤션 정하자", timestamp: Date(timeIntervalSince1970: 1704953760)),
            Message(messageId: 218, senderId: 0, content: "feat: fix: 이런거?", timestamp: Date(timeIntervalSince1970: 1704953820)),
            Message(messageId: 219, senderId: 2, content: "응 그거", timestamp: Date(timeIntervalSince1970: 1704953880)),
            Message(messageId: 220, senderId: 0, content: "깃모지도 쓸까?", timestamp: Date(timeIntervalSince1970: 1704953940)),
            Message(messageId: 221, senderId: 2, content: "좋아 이모지 귀여워", timestamp: Date(timeIntervalSince1970: 1704954000)),
            Message(messageId: 222, senderId: 0, content: "ㅋㅋㅋ", timestamp: Date(timeIntervalSince1970: 1704954060)),
            Message(messageId: 223, senderId: 2, content: "🎨 이거 쓰자", timestamp: Date(timeIntervalSince1970: 1704954120)),
            Message(messageId: 224, senderId: 0, content: "굳굳", timestamp: Date(timeIntervalSince1970: 1704954180)),
            Message(messageId: 225, senderId: 2, content: "README도 써야해", timestamp: Date(timeIntervalSince1970: 1704954240)),
            Message(messageId: 226, senderId: 0, content: "내가 할게", timestamp: Date(timeIntervalSince1970: 1704954300)),
            Message(messageId: 227, senderId: 2, content: "고마워!", timestamp: Date(timeIntervalSince1970: 1704954360)),
            Message(messageId: 228, senderId: 0, content: "ㅇㅇ", timestamp: Date(timeIntervalSince1970: 1704954420)),
            Message(messageId: 229, senderId: 2, content: "그럼 이따 봐", timestamp: Date(timeIntervalSince1970: 1704954480)),
            Message(messageId: 230, senderId: 2, content: "깃허브는 푸시하셨나여?", timestamp: Date(timeIntervalSince1970: 1705030200))
        ],
        chatRoomType: .personal
    ),
    
    // MARK: 3. Bran - 메시지 적음 (2개)
    ChatRoom(
        chatRoomId: 3,
        participantIds: [0, 3],
        messages: [
            Message(messageId: 301, senderId: 3, content: "과제 화이팅!", timestamp: Date(timeIntervalSince1970: 1704866400)),
            Message(messageId: 302, senderId: 0, content: "고마워 ㅠㅠ", timestamp: Date(timeIntervalSince1970: 1704866460))
        ],
        chatRoomType: .personal
    ),
    
    // MARK: 4. SeSAC - 긴 메시지 컨텐츠
    ChatRoom(
        chatRoomId: 4,
        participantIds: [0, 4],
        messages: [
            Message(messageId: 401, senderId: 4, content: "잔디는 생물인거 아시죠? :) 매일 물을 주셔야 살 수 있습니다!! 그리고 햇빛도 충분히 받아야 하고, 통풍도 잘 되어야 해요. 식물 키우기가 쉬워 보이지만 생각보다 신경 쓸 게 많답니다.", timestamp: Date(timeIntervalSince1970: 1704873180)),
            Message(messageId: 402, senderId: 0, content: "오늘 주말이에요... 살려주세요 덴님.... 주말이 평일보다 힘듭니다. 과제도 해야하고 복습도 해야하고 예습도 해야하는데 시간이 너무 부족해요. 어떻게 하면 시간 관리를 잘 할 수 있을까요? 조언 부탁드립니다!", timestamp: Date(timeIntervalSince1970: 1704908160)),
            Message(messageId: 403, senderId: 4, content: "푸시\n푸시\n커밋\n커밋\n으하하하하\n푸시푸시\n매일매일\n꾸준히\n잔디를\n심어요", timestamp: Date(timeIntervalSince1970: 1704910800)),
            Message(messageId: 404, senderId: 4, content: "벌써 퇴근하세여?ㅎㅎㅎㅎㅎ", timestamp: Date(timeIntervalSince1970: 1704912600))
        ],
        chatRoomType: .personal
    ),
    
    // MARK: 5. 긴 닉네임 유저 - 내옆자리에앉은개발잘하는친구
    ChatRoom(
        chatRoomId: 5,
        participantIds: [0, 5],
        messages: [
            Message(messageId: 501, senderId: 5, content: "내일 모닝콜 해주실분~~", timestamp: Date(timeIntervalSince1970: 1704780000)),
            Message(messageId: 502, senderId: 0, content: "몇시에?", timestamp: Date(timeIntervalSince1970: 1704780060)),
            Message(messageId: 503, senderId: 5, content: "8시!", timestamp: Date(timeIntervalSince1970: 1704780120)),
            Message(messageId: 504, senderId: 0, content: "알겠어 알람 맞춰놓을게", timestamp: Date(timeIntervalSince1970: 1704780180)),
            Message(messageId: 505, senderId: 5, content: "고마워요 ㅠㅠ 요즘 아침에 못 일어나겠어요", timestamp: Date(timeIntervalSince1970: 1704780240))
        ],
        chatRoomType: .personal
    ),
    
    // MARK: 6. 심심이 - 짧은 메시지들
    ChatRoom(
        chatRoomId: 6,
        participantIds: [0, 6],
        messages: [
            Message(messageId: 601, senderId: 6, content: "ㅎㅇ", timestamp: Date(timeIntervalSince1970: 1704693600)),
            Message(messageId: 602, senderId: 0, content: "ㅎㅇ", timestamp: Date(timeIntervalSince1970: 1704693660)),
            Message(messageId: 603, senderId: 6, content: "뭐해", timestamp: Date(timeIntervalSince1970: 1704693720)),
            Message(messageId: 604, senderId: 0, content: "공부", timestamp: Date(timeIntervalSince1970: 1704693780)),
            Message(messageId: 605, senderId: 6, content: "ㅋ", timestamp: Date(timeIntervalSince1970: 1704693840)),
            Message(messageId: 606, senderId: 6, content: "아닛 주말과제라닛", timestamp: Date(timeIntervalSince1970: 1704693900))
        ],
        chatRoomType: .personal
    ),
    
    // MARK: 7. 가장 짧은 닉네임 A
    ChatRoom(
        chatRoomId: 7,
        participantIds: [0, 7],
        messages: [
            Message(messageId: 701, senderId: 7, content: "안녕", timestamp: Date(timeIntervalSince1970: 1704607200)),
            Message(messageId: 702, senderId: 0, content: "안녕!", timestamp: Date(timeIntervalSince1970: 1704607260)),
            Message(messageId: 703, senderId: 7, content: "오늘 수업 어땠어?", timestamp: Date(timeIntervalSince1970: 1704607320))
        ],
        chatRoomType: .personal
    ),
    
    // MARK: 8. 매우 긴 닉네임 - iOS마스터를꿈꾸는27살김철수
    ChatRoom(
        chatRoomId: 8,
        participantIds: [0, 8],
        messages: [
            Message(messageId: 801, senderId: 8, content: "안녕하세요! 저는 iOS 개발자를 꿈꾸는 27살 김철수입니다. 혹시 스터디 같이 하실 분 계신가요? 매일 저녁 8시에 온라인으로 모여서 그날 배운 내용 복습하고 모르는 거 질문하는 스터디인데 관심 있으시면 연락주세요!", timestamp: Date(timeIntervalSince1970: 1704520800)),
            Message(messageId: 802, senderId: 0, content: "오 관심있어요! 자세히 알려주세요", timestamp: Date(timeIntervalSince1970: 1704520860)),
            Message(messageId: 803, senderId: 8, content: "넵! 디스코드로 진행하고 있어요. 현재 5명이서 하고 있는데 더 모집 중이에요 ㅎㅎ", timestamp: Date(timeIntervalSince1970: 1704520920)),
            Message(messageId: 804, senderId: 0, content: "좋아요 참여할게요!", timestamp: Date(timeIntervalSince1970: 1704520980)),
            Message(messageId: 805, senderId: 8, content: "환영합니다!! 링크 보내드릴게요", timestamp: Date(timeIntervalSince1970: 1704521040))
        ],
        chatRoomType: .personal
    ),
    
    // MARK: 9. SwiftLover - 이모지 많은 메시지
    ChatRoom(
        chatRoomId: 9,
        participantIds: [0, 9],
        messages: [
            Message(messageId: 901, senderId: 9, content: "Swift 너무 재밌어요!! 🎉🎉🎉", timestamp: Date(timeIntervalSince1970: 1704434400)),
            Message(messageId: 902, senderId: 0, content: "맞아요 ㅋㅋㅋ", timestamp: Date(timeIntervalSince1970: 1704434460)),
            Message(messageId: 903, senderId: 9, content: "특히 옵셔널 체이닝이 진짜 좋아요 😍😍", timestamp: Date(timeIntervalSince1970: 1704434520)),
            Message(messageId: 904, senderId: 0, content: "저는 아직 어려워요 😅", timestamp: Date(timeIntervalSince1970: 1704434580)),
            Message(messageId: 905, senderId: 9, content: "화이팅!! 💪💪💪🔥🔥", timestamp: Date(timeIntervalSince1970: 1704434640))
        ],
        chatRoomType: .personal
    ),
    
    // MARK: 10. B - 한 글자 닉네임, 한 글자 메시지
    ChatRoom(
        chatRoomId: 10,
        participantIds: [0, 10],
        messages: [
            Message(messageId: 1001, senderId: 10, content: "ㅇ", timestamp: Date(timeIntervalSince1970: 1704348000)),
            Message(messageId: 1002, senderId: 0, content: "?", timestamp: Date(timeIntervalSince1970: 1704348060))
        ],
        chatRoomType: .personal
    ),
    
    // MARK: 11. 코딩하는디자이너입니다반갑습니다 - 긴 닉네임
    ChatRoom(
        chatRoomId: 11,
        participantIds: [0, 11],
        messages: [
            Message(messageId: 1101, senderId: 11, content: "혹시 Figma 쓸 줄 아세요?", timestamp: Date(timeIntervalSince1970: 1704261600)),
            Message(messageId: 1102, senderId: 0, content: "아뇨 저는 개발만...", timestamp: Date(timeIntervalSince1970: 1704261660)),
            Message(messageId: 1103, senderId: 11, content: "아 저는 디자인하다가 개발 배우러 왔어요!", timestamp: Date(timeIntervalSince1970: 1704261720)),
            Message(messageId: 1104, senderId: 0, content: "오 대단하시네요", timestamp: Date(timeIntervalSince1970: 1704261780)),
            Message(messageId: 1105, senderId: 11, content: "아니에요 ㅎㅎ 아직 많이 부족해요. 그래도 UI 구현할 때 디자인 감각이 도움이 되더라구요. 나중에 같이 사이드 프로젝트 하실 분 있으면 연락주세요!", timestamp: Date(timeIntervalSince1970: 1704261840)),
            Message(messageId: 1106, senderId: 0, content: "네 좋아요! 꼭 연락드릴게요", timestamp: Date(timeIntervalSince1970: 1704261900)),
            Message(messageId: 1107, senderId: 11, content: "감사합니다 😊", timestamp: Date(timeIntervalSince1970: 1704261960))
        ],
        chatRoomType: .personal
    ),
    
    // MARK: 12. 멍 - 짧은 닉네임, URL 포함 메시지
    ChatRoom(
        chatRoomId: 12,
        participantIds: [0, 12],
        messages: [
            Message(messageId: 1201, senderId: 12, content: "이거 봤어? https://developer.apple.com/swift/", timestamp: Date(timeIntervalSince1970: 1704175200)),
            Message(messageId: 1202, senderId: 0, content: "오 애플 공식 문서!", timestamp: Date(timeIntervalSince1970: 1704175260)),
            Message(messageId: 1203, senderId: 12, content: "ㅇㅇ 여기서 공부하면 좋대", timestamp: Date(timeIntervalSince1970: 1704175320)),
            Message(messageId: 1204, senderId: 0, content: "고마워! 북마크 해둘게", timestamp: Date(timeIntervalSince1970: 1704175380))
        ],
        chatRoomType: .personal
    ),
    
    // MARK: 13. SeSAC_iOS_6기_화이팅! - 특수문자 포함 닉네임
    ChatRoom(
        chatRoomId: 13,
        participantIds: [0, 13],
        messages: [
            Message(messageId: 1301, senderId: 13, content: "다들 화이팅!!", timestamp: Date(timeIntervalSince1970: 1704088800)),
            Message(messageId: 1302, senderId: 0, content: "화이팅!!", timestamp: Date(timeIntervalSince1970: 1704088860)),
            Message(messageId: 1303, senderId: 13, content: "오늘 TIL 쓰셨어요?", timestamp: Date(timeIntervalSince1970: 1704088920)),
            Message(messageId: 1304, senderId: 0, content: "아직이요 ㅠㅠ 지금 쓰려구요", timestamp: Date(timeIntervalSince1970: 1704088980)),
            Message(messageId: 1305, senderId: 13, content: "저도요 ㅋㅋㅋ 같이 써요", timestamp: Date(timeIntervalSince1970: 1704089040)),
            Message(messageId: 1306, senderId: 0, content: "좋아요!", timestamp: Date(timeIntervalSince1970: 1704089100)),
            Message(messageId: 1307, senderId: 13, content: "1시간 뒤에 인증하기!", timestamp: Date(timeIntervalSince1970: 1704089160)),
            Message(messageId: 1308, senderId: 0, content: "넵!", timestamp: Date(timeIntervalSince1970: 1704089220)),
            Message(messageId: 1309, senderId: 13, content: "그럼 이따 봐요~", timestamp: Date(timeIntervalSince1970: 1704089280))
        ],
        chatRoomType: .personal
    ),
    
    // MARK: 14. 루 - 짧은 닉네임, 단일 메시지
    ChatRoom(
        chatRoomId: 14,
        participantIds: [0, 14],
        messages: [
            Message(messageId: 1401, senderId: 14, content: "내일 봐요~", timestamp: Date(timeIntervalSince1970: 1704002400))
        ],
        chatRoomType: .personal
    ),
    
    // MARK: 15. 야옹 - 다양한 길이 메시지 혼합
    ChatRoom(
        chatRoomId: 15,
        participantIds: [0, 15],
        messages: [
            Message(messageId: 1501, senderId: 15, content: "ㅎㅇ", timestamp: Date(timeIntervalSince1970: 1703916000)),
            Message(messageId: 1502, senderId: 0, content: "안녕하세요!", timestamp: Date(timeIntervalSince1970: 1703916060)),
            Message(messageId: 1503, senderId: 15, content: "오늘 수업에서 배운 TableView delegate랑 dataSource 차이가 뭔지 아직도 헷갈리는데 혹시 설명해주실 수 있나요? 검색해봐도 잘 모르겠어서요 ㅠㅠ", timestamp: Date(timeIntervalSince1970: 1703916120)),
            Message(messageId: 1504, senderId: 0, content: "아 그거요! dataSource는 데이터 관련이고 delegate는 동작 관련이에요", timestamp: Date(timeIntervalSince1970: 1703916180)),
            Message(messageId: 1505, senderId: 15, content: "오오", timestamp: Date(timeIntervalSince1970: 1703916240)),
            Message(messageId: 1506, senderId: 0, content: "dataSource는 셀 개수, 셀 내용 같은 거 정하고, delegate는 셀 클릭했을 때 동작 같은 거 정해요", timestamp: Date(timeIntervalSince1970: 1703916300)),
            Message(messageId: 1507, senderId: 15, content: "아!!!! 이해됐어요 감사합니다 🙏🙏🙏", timestamp: Date(timeIntervalSince1970: 1703916360)),
            Message(messageId: 1508, senderId: 0, content: "ㅎㅎ 도움이 됐다니 다행이에요", timestamp: Date(timeIntervalSince1970: 1703916420)),
            Message(messageId: 1509, senderId: 15, content: "👍", timestamp: Date(timeIntervalSince1970: 1703916480))
        ],
        chatRoomType: .personal
    )
]
