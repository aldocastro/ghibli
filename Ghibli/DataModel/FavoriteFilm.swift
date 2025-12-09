//
//  FavoriteFilm.swift
//  Ghibli
//
//  Created by Aldo Castro on 09.12.25.
//

import Foundation
import SwiftData

@Model
final class FavoriteFilm {
    #Index<FavoriteFilm>([\.title])
    @Attribute(.unique) var id: String
    var title: String
    var originalTitle: String
    var image: URL?
    var director: String
    var releaseDate: String
    var rtScore: Int
    
    init(id: String, title: String, originalTitle: String, image: URL? = nil, director: String, releaseDate: String, rtScore: Int) {
        self.id = id
        self.title = title
        self.originalTitle = originalTitle
        self.image = image
        self.director = director
        self.releaseDate = releaseDate
        self.rtScore = rtScore
    }
}

extension FavoriteFilm {
    var scorePercentage: String {
        "\(rtScore)%"
    }
}
