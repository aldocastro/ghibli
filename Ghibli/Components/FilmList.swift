//
//  FilmList.swift
//  Ghibli
//
//  Created by Aldo Castro on 05.12.25.
//

import SwiftUI

struct FilmList: View {
    @Environment(FavoritesViewModel.self) private var favViewModel
    let films: [Film]
    let viewTitle: String

    var body: some View {
        List(films) { film in
            let isFavorite = favViewModel.isFavorite(filmId: film.id)
            NavigationLink(value: film) {
                FilmRow(film: film, isFavorite: isFavorite)
            }
            .buttonStyle(.plain)
            .swipeActions(edge: .trailing, allowsFullSwipe: true) {
                Button {
                    favViewModel.toggleFavorite(filmId: film.id)
                } label: {
                    let (text, image) =
                        isFavorite
                        ? ("Quitar de favoritas", "heart.slash.fill")
                        : ("Añadir a favoritos", "heart.fill")
                    Label(text, systemImage: image)
                }
            }
        }
        .navigationTitle(viewTitle)
        .navigationDestination(for: Film.self) { film in
            FilmDetailView(film: film)
        }
    }
}
