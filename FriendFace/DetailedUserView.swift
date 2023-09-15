//
//  DetailedUserView.swift
//  FriendFace
//
//  Created by Vitali Martsinovich on 2023-09-15.
//

import SwiftUI

struct DetailedUserView: View {
    let user: User

    var body: some View {
        List {
            Section {
                Text(user.about)
                    .padding(.vertical)
            } header: {
                Text("About")
            }

            Section {
                Text("Address: \(user.address)")
                Text("Company: \(user.company)")
            } header: {
                Text("Contact details")
            }

            Section {
                ForEach(user.friends) { friend in
                    Text(friend.name)
                }
            } header: {
                Text("Friends")
            }
        }
        .listStyle(.grouped)
        .navigationTitle(user.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct DetailedUserView_Previews: PreviewProvider {
    static var previews: some View {
        DetailedUserView(user: User.example)
    }
}
