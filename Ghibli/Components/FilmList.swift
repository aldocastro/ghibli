//
//  FilmList.swift
//  Ghibli
//
//  Created by Aldo Castro on 05.12.25.
//

import SwiftUI
import SwiftData

struct FilmList: View {
    @Environment(FavoritesViewModel.self) private var favViewModel
    @Query private var favoriteFilms: [FavoriteFilm]
    private var favoriteIds: Set<String> {
        Set(favoriteFilms.map { $0.id })
    }

    let films: [Film]
    let viewTitle: String
    

    var body: some View {
        List(films) { film in
            let isFavorite = favoriteIds.contains(film.id)
            NavigationLink(value: film) {
                FilmRow(film: film, isFavorite: isFavorite)
            }
            .buttonStyle(.plain)
            .swipeActions(edge: .trailing, allowsFullSwipe: true) {
                Button {
                    favViewModel.toggleFavorite(film: film)
                } label: {
                    let (text, image) =
                        isFavorite
                        ? ("Quitar de favoritas", "heart.slash.fill")
                        : ("Añadir a favoritos", "heart.fill")
                    Label(text, systemImage: image)
                }
                .tint(isFavorite ? .gray : .red)
            }
        }
        .navigationTitle(viewTitle)
        .navigationDestination(for: Film.self) { film in
            FilmDetailView(film: film)
        }
    }
}

#Preview {
    FilmList(films: [.sample], viewTitle: "Films")
        .environment(FavoritesViewModel())
}
