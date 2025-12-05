//
//  MainTabView.swift
//  Ghibli
//
//  Created by Aldo Castro on 30.11.25.
//

import SwiftUI

struct MainTabView: View {
    @Environment(FilmsViewModel.self) private var filmsViewModel
    
    var body: some View {
        TabView {
            Tab("Películas", systemImage: "film.stack") {
                FilmsListView()
            }
            Tab("Favoritas", systemImage: "heart.fill") {
                FavoritesView()
            }
            Tab("Buscar", systemImage: "magnifyingglass") {
                SearchView()
            }
            Tab("Perfil", systemImage: "person.fill") {
                ProfileView()
            }
        }
        .task {
            await filmsViewModel.loadFilms()
        }
    }
}

#Preview {
    MainTabView()
        .environment(FilmsViewModel())
        .environment(FavoritesViewModel())
        .environment(ProfileViewModel())
}
