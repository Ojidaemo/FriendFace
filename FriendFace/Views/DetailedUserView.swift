//
//  DetailedUserView.swift
//  FriendFace
//
//  Created by Vitali Martsinovich on 2023-09-15.
//

import SwiftUI

struct DetailedUserView: View {
    let user: CachedUser

    var body: some View {
        List {
            Section {
                Text(user.wrappedAbout)
                    .padding(.vertical)
            } header: {
                Text("About")
            }

            Section {
                Text("Address: \(user.wrappedAddress)")
                Text("Company: \(user.wrappedCompany)")
            } header: {
                Text("Contact details")
            }

            Section {
                ForEach(user.friendsArray) { friend in
                    Text(friend.wrappedName)
                }
            } header: {
                Text("Friends")
            }
        }
        .listStyle(.grouped)
        .navigationTitle(user.wrappedName)
        .navigationBarTitleDisplayMode(.inline)
    }
}

//struct DetailedUserView_Previews: PreviewProvider {
//    static var previews: some View {
//        DetailedUserView(user: User.example)
//    }
//}
