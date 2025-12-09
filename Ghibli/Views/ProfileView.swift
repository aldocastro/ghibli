//
//  ProfileView.swift
//  Ghibli
//
//  Created by Aldo Castro on 30.11.25.
//

import SwiftUI
import SwiftData

struct ProfileView: View {
    private let viewTitle = "Perfil"
    @Query private var favorites: [FavoriteFilm]
    
    @State private var profileViewModel = ProfileViewModel()
    @Environment(FavoritesViewModel.self) private var favoritesViewModel
    @Environment(FilmsViewModel.self) private var filmsViewModel

    @State private var name: String = ""
    @State private var foundFilm: Film?
    
    var favoriteCount: Int {
        favorites.count
    }
    
    var totalOfFilms: Int {
        filmsViewModel.totalOfFilms
    }

    var body: some View {
        @Bindable var favoritesVM = favoritesViewModel
        @Bindable var filmsVM = filmsViewModel

        NavigationStack {
            Form {
                Section(header: Text("Información Personal")) {
                    TextField("Tu nombre", text: $name)
                    FilmSearchRow(foundFilm: $foundFilm)
                }
                Section(header: Text("Estadísticas")) {
                    TitleValueRow(
                        title: "Películas Favoritas",
                        titleColor: .red,
                        image: "heart.fill",
                        value: favoriteCount
                    )

                    TitleValueRow(
                        title: "Películas Disponibles",
                        titleColor: .blue,
                        image: "film.fill",
                        value: totalOfFilms
                    )
                }

                Button("Guardar") {
                    print("Guardando cambios en perfil")
                    profileViewModel.save()
                }
            }
            .navigationTitle(viewTitle)
        }
    }
}

private struct EmptyView: View {
    var body: some View {
        ContentUnavailableView {
            Label("Aquí va tu perfil", systemImage: "person.circle")
        }
        .navigationTitle("Perfil")
    }
}

#Preview {
    ProfileView()
        .environment(FilmsViewModel())
        .environment(FavoritesViewModel())
}
