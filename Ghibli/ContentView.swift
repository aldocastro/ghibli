//
//  ContentView.swift
//  Ghibli
//
//  Created by Aldo Castro on 24.11.25.
//

import SwiftUI

struct ContentView: View {
    var repository: NetworkRepository = Network()
    
    var body: some View {
        VStack {
            Button("Obtener peliculas") {
                Task {
                    do {
                        let films = try await repository.getFilms()
                        print("Peliculas obtenidas: \(films.count)")
                        print("---")
                        films.forEach { film in
                            print("Titulo: \(film.title)")
                            print("Director: \(film.director)")
                            print("Año: \(film.releaseDate)")
                            print("Puntuacion: \(film.scorePercentage)")
                            print("")
                        }
                    } catch {
                        print("Error al obtener peliculas: \(error.localizedDescription)")
                    }
                }
            }
            .buttonStyle(.borderedProminent)
        }
        .padding()
    }
}

#Preview {
    ContentView(repository: NetworkTest())
}
