//
//  NetworkDataFetcher.swift
//  OCP
//
//  Created by Martynov Evgeny on 24.03.21.
//

import Foundation

class NetworkDataFetcher {
    
    var networkService = NetworkService()
    
    static let shared = NetworkDataFetcher()
    private init(networkService: NetworkService = NetworkService()) {
        self.networkService = networkService
    }
    
    func fetchNewGames(urlString: String, completion: @escaping (AppGroup?) -> Void) {
        networkService.request(urlString: urlString) { (data, error) in
            let decoder = JSONDecoder()
            guard let data = data else { return }
            let response = try? decoder.decode(AppGroup.self, from: data)
            completion(response)
        }
    }
    
    func fetchFreeGames(urlString: String, completion: @escaping (AppGroup?) -> Void) {
        networkService.request(urlString: urlString) { (data, error) in
            let decoder = JSONDecoder()
            guard let data = data else { return }
            let response = try? decoder.decode(AppGroup.self, from: data)
            completion(response)
        }
    }
    
    func fetchCountry(urlString: String, completion: @escaping ([Country]?) -> Void) {
        networkService.request(urlString: urlString) { (data, error) in
            let decoder = JSONDecoder()
            guard let data = data else { return }
            let response = try? decoder.decode([Country].self, from: data)
            completion(response)
        }
    }
}
