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
                TabView {
                    PlayView()
                        .tabItem {
                            Text("Home")
                            Image("home")
                        }
                    VStack{}
                        .tabItem {
                            Text("Voucher")
                            Image("voucher")
                        }
                    VStack{}
                        .tabItem {
                            Text("Exchange")
                            Image("exchange")
                        }
                    VStack{}
                        .tabItem {
                            Text("Escrow")
                            Image("shake")
                        }
                }
                .tint(.blue)
            }
           // }
        }
    }
}
