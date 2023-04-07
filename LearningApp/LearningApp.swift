//
//  LearningAppApp.swift
//  LearningApp
//
//  Created by Colstin Donaldson on 4/7/23.
//

import SwiftUI

@main
struct LearningApp: App {
    var body: some Scene {
        WindowGroup {
            HomeView()
                .environmentObject(ContentModel())
        }
    }
}
