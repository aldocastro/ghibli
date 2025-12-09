//
//  GhibliApp.swift
//  Ghibli
//
//  Created by Aldo Castro on 24.11.25.
//

import SwiftUI
import SwiftData

@main
struct GhibliApp: App {
    @State private var filmsViewModel = FilmsViewModel()
    @State private var favoritesViewModel = FavoritesViewModel()

    var body: some Scene {
        WindowGroup {
            MainTabView()
                .environment(filmsViewModel)
                .environment(favoritesViewModel)
        }.modelContainer(favoritesViewModel.modelContainer)
    }
}
