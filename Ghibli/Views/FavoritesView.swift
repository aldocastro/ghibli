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
        NavigationStack {
            if favoritesVM.hasNoFavorites {
                EmptyView()
                    .navigationTitle(viewTitle)
            } else {
                let favorites: [Film] = filmsVM.films.filter { favoritesVM.isFavorite(filmId: $0.id) }
                ContentList(favorites: favorites) { film in
                    favoritesVM.toggleFavorite(filmId: film.id)
                }
                .navigationTitle(viewTitle)
                .navigationDestination(for: Film.self) { film in
                    FilmDetailView(film: film)
                }
            }
        }
    }
}

fileprivate struct ContentList : View {
    let favorites: [Film]
    let removeFromFavorites: (Film) -> Void
    
    var body: some View {
        List(favorites) { film in
            NavigationLink(value: film) {
                FilmRow(film: film, isFavorite: true)
            }
            .buttonStyle(.plain)
            .swipeActions {
                Button {
                    removeFromFavorites(film)
                } label: {
                    Label("Quitar de favoritas", systemImage: "heart.slash")
                }
            }
        }
    }
}

fileprivate struct EmptyView: View {
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
