//
//  ContentView.swift
//  FriendFace
//
//  Created by Vitali Martsinovich on 2023-09-14.
//

import SwiftUI

struct ContentView: View {
    @State private var users = [User]()
    
    let networkManager: NetworkManagerAsync
    
    // Initialize the view with the injected networkManager
    init(networkManager: NetworkManagerAsync) {
        self.networkManager = networkManager
    }
    
    var body: some View {
        NavigationView {
            List(users) { user in
                NavigationLink {
                    DetailedUserView(user: user)
                } label: {
                    HStack {
                        Circle()
                            .fill(user.isActive ? .green : .red)
                            .frame(width: 30)
                        
                        Text(user.name)
                    }
                }
            }
            .navigationTitle("FriendFace")
        }
        .task {
            guard users.isEmpty else { return }
            
            do {
                // Fetch users asynchronously using async/await
                let fetchedUsers = try await networkManager.fetchUsers()
                self.users = fetchedUsers
            } catch {
                print("Error fetching users: \(error.localizedDescription)")
            }
            
//            networkManager.fetchUsers { result in
//                switch result {
//                case .success(let fetchedUsers):
//                    self.users = fetchedUsers
//                case .failure(let error):
//                    print("Error fetching users: \(error.localizedDescription)")
//                }
//            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(networkManager: NetworkManagerAsync())
    }
}
