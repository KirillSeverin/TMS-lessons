//
//  AppGroup.swift
//  OCP
//
//  Created by Martynov Evgeny on 24.03.21.
//

import Foundation

struct  AppGroup: Decodable {
    let feed: Feed
}

struct Feed: Decodable {
    let title: String
    let results: [FeedResult]
}

struct FeedResult: Decodable {
    let artistName: String
    let name: String
    let id: String
}
