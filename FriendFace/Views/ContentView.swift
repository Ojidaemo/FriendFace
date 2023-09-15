//
//  ContentView.swift
//  FriendFace
//
//  Created by Vitali Martsinovich on 2023-09-14.
//

import SwiftUI

struct ContentView: View {
    @FetchRequest(sortDescriptors: [SortDescriptor(\.name)]) var users: FetchedResults<CachedUser>
//    @State private var users = [User]()
    @Environment(\.managedObjectContext) var moc
    
    let networkManager: NetworkManagerAsync
    
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
                        
                        Text(user.wrappedName)
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
                await MainActor.run {
                    User.example.updateCache(in: moc, with: fetchedUsers)
                }
            } catch {
                print("Error fetching users: \(error.localizedDescription)")
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(networkManager: NetworkManagerAsync())
    }
}
