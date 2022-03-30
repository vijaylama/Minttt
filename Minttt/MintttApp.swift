//
//  MintttApp.swift
//  Minttt
//
//  Created by Vijay Lama on 3/29/22.
//

import SwiftUI

@main
struct MintttApp: App {
    @StateObject var transactionListVM = TransactionListViewModel()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(transactionListVM)
        }
    }
}
