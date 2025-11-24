//
//  FilmDTO.swift
//  Ghibli
//
//  Created by Aldo Castro on 24.11.25.
//

import Foundation

struct FilmDTO: Codable {
    let id: String
    let title: String
    let originalTitle: String
    let image: String
    let movieBanner: String
    let description: String
    let director: String
    let producer: String
    let releaseDate: String
    let runningTime: String
    let rtScore: String
    let people: [String]

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case title = "title"
        case originalTitle = "original_title"
        case image = "image"
        case movieBanner = "movie_banner"
        case description = "description"
        case director = "director"
        case producer = "producer"
        case releaseDate = "release_date"
        case runningTime = "running_time"
        case rtScore = "rt_score"
        case people = "people"
    }
}

extension FilmDTO {
    func toFilm() -> Film {
        Film(
            id: id,
            title: title,
            originalTitle: originalTitle,
            image: URL(string: image),
            movieBanner: URL(string: movieBanner),
            description: description,
            director: director,
            producer: producer,
            releaseDate: releaseDate,
            runningTime: Int(runningTime) ?? 0,
            rtScore: Int(rtScore) ?? 0,
            people: people.map { URL(string: $0) }
        )
    }
}
