//
//  NetworkManagerAsync.swift
//  FriendFace
//
//  Created by Vitali Martsinovich on 2023-09-15.
//

import Foundation

class NetworkManagerAsync {
    
    private let decoder = JSONDecoder()
    private let dataURL = URL(string: "https://www.hackingwithswift.com/samples/friendface.json")!
    
    init() {
        decoder.dateDecodingStrategy = .iso8601
    }
    
    // Use async and throw to indicate asynchronous and error-throwing behavior
    func fetchUsers() async throws -> [User] {
        do {
            let (data, _) = try await URLSession.shared.data(from: dataURL)
            
            let users = try self.decoder.decode([User].self, from: data)
            return users
        } catch {
            throw NetworkError.decodingError
        }
    }
}
