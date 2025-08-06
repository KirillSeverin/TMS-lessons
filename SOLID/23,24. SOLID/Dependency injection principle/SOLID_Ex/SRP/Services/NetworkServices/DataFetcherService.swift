//
//  DataFetcherService.swift
//  OCP
//
//  Created by Martynov Evgeny on 24.03.21.
//

import Foundation

/*
 Модуль высшего уровня
 Модуль верхнего уровня не должен зависеть от модулей нижнего уровня. Все зависят от абстракций.
 */

class DataFetcherService {
    
    /*
     Наши абстракции
     */
    var networkDataFetcher: DataFetcher
    var localDataFetcher: DataFetcher

    init(dataFetcher: DataFetcher = NetworkDataFetcher(), localDataFetcher: DataFetcher = LocalDataFetcher()) {
        self.networkDataFetcher = dataFetcher
        self.localDataFetcher = localDataFetcher
    }

    public func fetchNewGames(completion: @escaping (AppGroup?) -> Void) {
        let urlNewGames = "https://rss.itunes.apple.com/api/v1/us/ios-apps/new-games-we-love/all/10/explicit.json"
        networkDataFetcher.fetchGenericJSONData(urlString: urlNewGames, response: completion)
    }

    public func fetchFreeGames(completion: @escaping (AppGroup?) -> Void) {
        let urlFreeGames = "https://rss.itunes.apple.com/api/v1/us/ios-apps/top-free-ipad/all/10/explicit.json"
        networkDataFetcher.fetchGenericJSONData(urlString: urlFreeGames, response: completion)
    }

    public func fetchCountry(completion: @escaping ([Country]?) -> Void) {
        let urlString = "https://raw.githubusercontent.com/Softex-Group/task-mobile/master/test.json"
        networkDataFetcher.fetchGenericJSONData(urlString: urlString, response: completion)
    }

    func fetchLocalCountry(completion: @escaping ([Country]?) -> Void) {
        let localUrlString = "usersAPI.txt"
        localDataFetcher.fetchGenericJSONData(urlString: localUrlString, response: completion)
    }
}
