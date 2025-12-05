//
//  FilmsListView.swift
//  Ghibli
//
//  Created by Aldo Castro on 29.11.25.
//

import SwiftUI

struct FilmsListView: View {
    private let viewTitle = "Peliculas"
    @Environment(FilmsViewModel.self) private var viewModel
    @Environment(FavoritesViewModel.self) private var favViewModel
    
    var body: some View {
        NavigationStack {
            switch viewModel.state {
            case .empty:
                EmptyList()
                    .navigationTitle(viewTitle)
            case .loading:
                ProgressView {
                    Text("Cargando peliculas...")
                }
                .navigationTitle(viewTitle)
            case .loaded(let films):
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
                            Label(
                                isFavorite ? "Quitar de favoritas" : "Añadir a favoritos",
                                systemImage: isFavorite
                                    ? "heart.slash.fill" : "heart.fill"
                            )
                        }
                    }
                }
                .navigationTitle(viewTitle)
                .navigationDestination(for: Film.self) { film in
                    FilmDetailView(film: film)
                }
            case .error(let error):
                ErrorView(error: error)
                    .navigationTitle(viewTitle)
            }
        }
    }
}

fileprivate struct EmptyList: View {
    var body: some View {
        ContentUnavailableView {
            Label("No hay peliculas", systemImage: "film")
        } description: {
            Text("No se encontraron películas de Studio Ghibli")
        }
    }
}

fileprivate struct ErrorView: View {
    let error: Error
    
    var body: some View {
        ContentUnavailableView {
            Label("No se pudieron cargar las películas.", systemImage: "exclamationmark.triangle")
        } description: {
            Text(error.localizedDescription)
        }
    }
}

#Preview {
    let vm = FilmsViewModel()
    FilmsListView()
        .environment(vm)
        .environment(FavoritesViewModel())
        .task {
            await vm.loadFilms()
        }
}
