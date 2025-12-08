//
//  FavoritesView.swift
//  Ghibli
//
//  Created by Aldo Castro on 30.11.25.
//

import SwiftUI

struct FavoritesView: View {
    private let viewTitle = "Favoritas"
    @Environment(FilmsViewModel.self) private var filmsVM
    @Environment(FavoritesViewModel.self) private var favoritesVM

    var body: some View {
        @State var favorites = filmsVM.films.filter {
            favoritesVM.isFavorite(filmId: $0.id)
        }

        NavigationStack {
            if favoritesVM.hasNoFavorites {
                EmptyView().navigationTitle(viewTitle)
            } else {
                FilmList(films: favorites, viewTitle: viewTitle)
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
