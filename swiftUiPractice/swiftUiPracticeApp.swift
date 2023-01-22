//
//  swiftUiPracticeApp.swift
//  swiftUiPractice
//
//  Created by dremobaba on 2022/12/17.
//

import SwiftUI

@main
struct swiftUiPracticeApp: App {
    @StateObject private var dataController = DataController.shared
    var body: some Scene {
        WindowGroup {
           CustomTabBar()
        }
    }
}
