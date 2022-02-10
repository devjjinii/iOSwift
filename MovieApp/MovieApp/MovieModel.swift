//
//  MovieModel.swift
//  MovieApp
//
//  Created by dev jin on 2022/02/10.
//

import Foundation

struct MovieModel: Codable {
    let resultCount: Int
    let results: [MovieResult]
    
}

struct MovieResult: Codable {
    let trackName: String
    let previewUrl: String
    let image: String
    let shortDescription: String?
    let longDescription: String
    let trackPrice: Double
    let currency: String
    let releaseDate: String

    
    // api 에서 가져오는 변수명 변경시 사용
    enum CodingKeys: String, CodingKey {
        case image = "artworkUrl100"
        case trackName
        case previewUrl
        case shortDescription
        case longDescription
        case trackPrice
        case currency
        case releaseDate
    }
}
