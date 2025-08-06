//
//  Comment.swift
//  NetClassWork16
//
//  Created by Martynov Evgeny on 1.03.21.
//

import Foundation

struct Comment: Decodable {
    let postId: Int?
    let id: Int?
    let name: String?
    let email: String?
    let body: String?
}
