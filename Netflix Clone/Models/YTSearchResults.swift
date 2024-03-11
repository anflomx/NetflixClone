//
//  YTSearchResults.swift
//  Netflix Clone
//
//  Created by Antonio Flores on 11/03/24.
//

import Foundation

struct YTSearchResponse: Codable {
    let items: [VideoElement]
}

struct VideoElement: Codable {
    let id: IdVideoElement
}

struct IdVideoElement: Codable {
    let kind: String
    let videoId: String
}
