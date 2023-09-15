//
//  NetworkManager.swift
//  FriendFace
//
//  Created by Vitali Martsinovich on 2023-09-14.
//

import Foundation

enum NetworkError: Error {
    case noData
    case decodingError
}

class NetworkManager {
    
    private let decoder = JSONDecoder()
    private let dataURL = URL(string: "https://www.hackingwithswift.com/samples/friendface.json")!

    init() {
        decoder.dateDecodingStrategy = .iso8601
    }

    func fetchUsers(completion: @escaping (Result<[User], Error>) -> Void) {
        URLSession.shared.dataTask(with: dataURL) { data, _, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else {
                completion(.failure(NetworkError.noData))
                return
            }
            
            do {
                let users = try self.decoder.decode([User].self, from: data)
                completion(.success(users))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
}
