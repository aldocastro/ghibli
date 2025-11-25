//
//  URL.swift
//  Ghibli
//
//  Created by Aldo Castro on 25.11.25.
//

import Foundation

fileprivate let api = URL(string: "https://ghibliapi.vercel.app")!

extension URL {
    static let films = api.appending(path: "films")
    static func film(id: String) -> URL {
        api.appending(path: "films").appending(path: "\(id)")
    }
    static let people = api.appending(path: "people")
    static let locations = api.appending(path: "locations")
    static let species = api.appending(path: "species")
    static let vehicles = api.appending(path: "vehicles")
}
