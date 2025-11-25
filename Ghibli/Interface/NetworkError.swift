//
//  NetworkError.swift
//  Ghibli
//
//  Created by Aldo Castro on 25.11.25.
//

import Foundation

enum NetworkError: Error {
    case general(Error)
    case nonHTTP
    case json(Error)
    case status(Int)
}
