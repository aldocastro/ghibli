//
//  MainTabView.swift
//  Ghibli
//
//  Created by Aldo Castro on 30.11.25.
//

import SwiftUI

struct MainTabView: View {
    @Environment(FilmsViewModel.self) var viewModel
    
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
            await viewModel.loadFilms()
        }
    }
}

#Preview {
    MainTabView()
        .environment(FilmsViewModel())
}
