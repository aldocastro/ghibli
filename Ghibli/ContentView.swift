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
                    } catch {
                        print("Error \(error.localizedDescription)")
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
