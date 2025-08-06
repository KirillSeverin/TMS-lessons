//
//  UsersDataFetcher.swift
//  NetClassWork18
//
//  Created by Kirill Severin on 2.04.21.
//

import UIKit

protocol UsersDataFetcherProtocol {
    func getUsers(usersUrl: URL, usersResponse: @escaping (String?) -> Void)
}

class UsersDataFetcher: UsersDataFetcherProtocol {
    func getUsers(usersUrl: URL, usersResponse: @escaping (String?) -> Void) {
        
        let session = URLSession.shared
        
        session.dataTask(with: usersUrl) { (data, response, error) in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            if let response = response {
                print(response)
            }
            if let data = data,
               let users = String(data: data, encoding: .utf8) {
                usersResponse(users)
            }
        }.resume()
    }
}
