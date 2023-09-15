//
//  User.swift
//  FriendFace
//
//  Created by Vitali Martsinovich on 2023-09-14.
//

import Foundation

struct User: Decodable, Identifiable {
    let id: UUID
    let isActive: Bool
    let name: String
    let age: Int
    let company, email, address, about: String
    let registered: Date
    let tags: [String]
    let friends: [Friend]
    
    static let example = User(id: UUID(), isActive: true, name: "Paul Hudson", age: 35, company: "Hudson Heavy Industries", email: "paul@hackingwithswift.com", address: "555, Taylor Swift Avenue, Nashville, Tennessee", about: "Paul writes about Swift and iOS development.", registered: Date.now, tags: ["swift", "swiftui", "dogs"], friends: [])
}

// MARK: - Friend
struct Friend: Decodable, Identifiable {
    let id: UUID
    let name: String
}
