//
//  FavoritesView.swift
//  Ghibli
//
//  Created by Aldo Castro on 30.11.25.
//

import SwiftUI
import SwiftData

struct FavoritesView: View {
    private let viewTitle = "Favoritas"
    @Environment(FilmsViewModel.self) private var filmsVM
    @Environment(FavoritesViewModel.self) private var favoritesVM
    @Query private var favorites: [FavoriteFilm]
    
    var hasNoFavorites: Bool {
        favorites.isEmpty
    }
    
    var favoritesFilms: [Film] {
        filmsVM.films.filter { film in
            favorites.contains { favorite in
                film.id == favorite.id
            }
        }
    }

    var body: some View {
        NavigationStack {
            if hasNoFavorites {
                EmptyView().navigationTitle(viewTitle)
            } else {
                FilmList(films: favoritesFilms, viewTitle: viewTitle)
            }
        }
    }
}

private struct EmptyView: View {
    var body: some View {
        ContentUnavailableView {
            Label("Sin Favoritas", systemImage: "heart.slash")
        } description: {
            Text("Aún no has guardado ninguna película favorita.")
        }
    }
}

#Preview {
    FavoritesView()
        .environment(FilmsViewModel())
        .environment(FavoritesViewModel())
}
