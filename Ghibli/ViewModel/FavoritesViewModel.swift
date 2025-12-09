//
//  FavoritesViewModel.swift
//  Ghibli
//
//  Created by Aldo Castro on 30.11.25.
//

import Foundation
import SwiftData
import SwiftUI

@MainActor @Observable
final class FavoritesViewModel {
    let modelContainer: ModelContainer

    private var context: ModelContext {
        modelContainer.mainContext
    }

    init() {
        let schema = Schema([FavoriteFilm.self])
        let modelCOnfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            modelContainer = try ModelContainer(
                for: schema,
                configurations: [modelCOnfiguration]
            )
        } catch {
            fatalError("Couldn't create ModelContainer: \(error)")
        }
    }

    func toggleFavorite(film: Film) {
        let favoriteFilm = fetchFavorite(from: film)
        if let favoriteFilm {
            context.delete(favoriteFilm)
        } else {
            context.insert(film.toFavoriteFilm())
        }
        try? context.save()
    }

    func isFavorite(film: Film) -> Bool {
        fetchFavorite(from: film) != nil
    }
    
    private func fetchFavorite(from film: Film) -> FavoriteFilm? {
        let predicate = #Predicate<FavoriteFilm> { $0.id == film.id }
        let descriptor = FetchDescriptor<FavoriteFilm>(predicate: predicate)
        return try? context.fetch(descriptor).first
    }

    private func fetchFavoriteCount() -> Int {
        let descriptor = FetchDescriptor<FavoriteFilm>()
        return (try? context.fetchCount(descriptor)) ?? 0
    }

    private func loadMockFavorites() {
        for film in Film.samples {
            context.insert(film.toFavoriteFilm())
        }
    }
}
