//
//  FriendFaceApp.swift
//  FriendFace
//
//  Created by Vitali Martsinovich on 2023-09-14.
//

import SwiftUI

@main
struct FriendFaceApp: App {
    @StateObject var dataController = DataController()
//    let networkManager = NetworkManager()
    let networkManagerAsync = NetworkManagerAsync()

    var body: some Scene {
        WindowGroup {
            ContentView(networkManager: networkManagerAsync)
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
