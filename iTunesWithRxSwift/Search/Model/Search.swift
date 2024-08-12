//
//  Search.swift
//  iTunesWithRxSwift
//
//  Created by 양승혜 on 8/9/24.
//

import Foundation

struct SearchiTunes: Decodable {
    let resultCount: Int
    let results: [iTunesResult]
}

struct iTunesResult: Decodable {
    let trackId: Int
    let trackName: String
    let artworkUrl60: String
    let screenshotUrls: [String]
    let genres: [String]
    let sellerName: String
    let averageUserRating: Float?
    let version: String
}
