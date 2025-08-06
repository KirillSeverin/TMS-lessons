//
//  File.swift
//  FirebaseToDoCW
//
//  Created by Martynov Evgeny on 12.04.21.
//

import Foundation
import Firebase

struct User {

    // идентификатор пользователя
    let uid: String
    let email: String

    init(user: Firebase.User) {
        self.uid = user.uid
        self.email = user.email ?? ""
    }
}
