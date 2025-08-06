//
//  Post.swift
//  NetClassWork16
//
//  Created by Martynov Evgeny on 1.03.21.
//

import Foundation

struct Post: Decodable {
    let userId: Int?
    let id: Int?
    let title: String?
    let body: String?
}
