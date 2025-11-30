//
//  FilmsListView.swift
//  Ghibli
//
//  Created by Aldo Castro on 29.11.25.
//

import SwiftUI

struct FilmsListView: View {
    @State private var viewModel: FilmsViewModel = FilmsViewModel()
    
    var body: some View {
        NavigationStack {
            switch viewModel.state {
            case .empty:
                EmptyList()
            case .loading:
                ProgressView {
                    Text("Cargando peliculas...")
                }
            case .loaded(let films):
                List(films) { film in
                    NavigationLink(value: film) {
                        FilmRow(film: film)
                    }
                    .buttonStyle(.plain)
                }
                .navigationTitle("Peliculas")
                .navigationDestination(for: Film.self) { film in
                    FilmDetailView(film: film)
                }
            case .error(let error):
                ErrorView(error: error)
            }
        }
        .task {
            await viewModel.loadFilms()
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
    FilmsListView()
}
