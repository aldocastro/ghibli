//
//  FilmsViewModel.swift
//  Ghibli
//
//  Created by Aldo Castro on 29.11.25.
//

import Foundation

enum ViewState {
    case loading, loaded([Film]), empty, error(Error)
}

@MainActor @Observable
final class FilmsViewModel {
    let repository: NetworkRepository = Network()
    var totalOfFilms: Int = 0

    private(set) var state: ViewState = .empty
    private(set) var films: [Film] = [] {
        didSet {
            totalOfFilms = films.count
        }
    }
    
    func loadFilms() async -> Void {
        state = .loading
        do {
            print("Fetching from network...")
            films = try await repository.getFilms()
            state = films.count > 0 ? .loaded(films) : .empty
        } catch {
            state = .error(error)
        }
    }
}
