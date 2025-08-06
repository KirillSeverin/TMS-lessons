//
//  Photo.swift
//  NetClassWork16
//
//  Created by Martynov Evgeny on 1.03.21.
//

import Foundation

struct Photo: Decodable {
    let albumId: Int?
    let id: Int?
    let title: String?
    let url: String?
    let thumbnailUrl: String?
}
