//
//  swiftUiPracticeApp.swift
//  swiftUiPractice
//
//  Created by dremobaba on 2022/12/17.
//

import SwiftUI

@main
struct swiftUiPracticeApp: App {
    var body: some Scene {
        WindowGroup {
            //ContentView()
           // NavigationStack {
//                DummyUi()
//                    .preferredColorScheme(.dark)
              //  SheetExampleView()
            NavigationStack {
               CustomTabView()
            }
           // }
        }
    }
}
