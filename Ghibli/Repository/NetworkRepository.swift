//
//  NetworkRepository.swift
//  Ghibli
//
//  Created by Aldo Castro on 29.11.25.
//

import Foundation

protocol NetworkRepository: Sendable, NetworkInteractor {
    func getFilms() async throws (NetworkError) -> [Film]
    func getFilm(id: String) async throws (NetworkError) -> Film
}

struct Network: NetworkRepository {
    func getFilms() async throws(NetworkError) -> [Film] {
        let filmsDto: [FilmDTO] = try await getJson(request: URLRequest.get(url: URL.films))
        return filmsDto.map { $0.toFilm() }
    }
    
    func getFilm(id: String) async throws(NetworkError) -> Film {
        let filmDto: FilmDTO = try await getJson(request: URLRequest.get(url: URL.film(id: id)))
        return filmDto.toFilm()
    }
}

struct NetworkTest: NetworkRepository {
    func getFilms() async throws(NetworkError) -> [Film] {
        [.sample]
    }
    
    func getFilm(id: String) async throws(NetworkError) -> Film {
        .sample
    }
}
