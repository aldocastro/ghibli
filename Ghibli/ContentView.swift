//
//  ContentView.swift
//  Ghibli
//
//  Created by Aldo Castro on 24.11.25.
//

import SwiftUI

struct ContentView: View {
    @State private var viewModel: FilmsViewModel = FilmsViewModel()
    
    var body: some View {
        NavigationStack {
            switch viewModel.state {
            case .empty:
                ContentUnavailableView {
                    Label("No hay peliculas", systemImage: "film")
                } description: {
                    Text("No se encontraron películas de Studio Ghibli")
                }
            case .loading:
                ProgressView {
                    Text("Cargando peliculas...")
                }
            case .loaded(let films):
                List(films) { film in
                    FilmRow(film: film)
                }
            case .error(let error):
                ContentUnavailableView {
                    Label("No se pudieron cargar las películas.", systemImage: "exclamationmark.triangle")
                } description: {
                    Text("Razón: \(error.localizedDescription)")
                }
            }
        }.task {
            await viewModel.loadFilms()
        }
    }
}

#Preview {
    ContentView()
}
