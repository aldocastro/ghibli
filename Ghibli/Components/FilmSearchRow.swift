//
//  FilmSearchRow.swift
//  Ghibli
//
//  Created by Aldo Castro on 07.12.25.
//

import SwiftUI

struct FilmSearchRow: View {
    @Environment(FilmsViewModel.self) var filmsVM: FilmsViewModel
    @State private var searchTerm: String = ""
    @Binding var foundFilm: Film?

    var body: some View {
        @State var foundFilms = filmsVM.searchFilm(term: searchTerm)
        if let foundFilm {
            FilmRow(film: foundFilm, isFavorite: false)
        } else {
            HStack {
                Image(systemName: "magnifyingglass")
                TextField("Busca película", text: $searchTerm)
            }
            List(foundFilms) { film in
                FilmRow(film: film, isFavorite: false)
                    .onTapGesture {
                        foundFilm = film
                        searchTerm = ""
                    }
            }
        }
    }
}

#Preview {
    FilmSearchRow(foundFilm: .constant(nil))
        .environment(FilmsViewModel())
}
