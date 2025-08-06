//
//  DataFetcherService.swift
//  OCP
//
//  Created by Martynov Evgeny on 24.03.21.
//

import UIKit

/*
 Модуль высшего уровня
 Модуль верхнего уровня не должен зависеть от модулей нижнего уровня. Все зависят от абстракций.
 */

class DataFetcherService {
    
    /*
     Наши абстракции
     */
    var networkDataFetcher: DataFetcher
    var imageDataFetcher: ImageDataFetcherProtocol

    init(dataFetcher: DataFetcher = NetworkDataFetcher(), imageDataFetcher: ImageDataFetcherProtocol = ImageDataFetcher()) {
        self.networkDataFetcher = dataFetcher
        self.imageDataFetcher = imageDataFetcher
    }
    
    

    public func fetchImage(imageUrl: URL, completion: @escaping (UIImage?) -> Void) {
        imageDataFetcher.getImage(imageUrl: imageUrl) { image in
            completion(image)
        }
    }
    
    public func fetchUsers(usersUrl: URL, completion: @escaping (String?) -> Void {
        usersDataFetcher.getUsers(usersUrl: usersUrl) { users in
            completion(users)
        }
    
    }
//
//    public func fetchFreeGames(completion: @escaping (AppGroup?) -> Void) {
//        let urlFreeGames = "https://rss.itunes.apple.com/api/v1/us/ios-apps/top-free-ipad/all/10/explicit.json"
//        networkDataFetcher.fetchGenericJSONData(urlString: urlFreeGames, response: completion)
//    }
//
//    public func fetchCountry(completion: @escaping ([Country]?) -> Void) {
//        let urlString = "https://raw.githubusercontent.com/Softex-Group/task-mobile/master/test.json"
//        networkDataFetcher.fetchGenericJSONData(urlString: urlString, response: completion)
//    }
//
//    func fetchLocalCountry(completion: @escaping ([Country]?) -> Void) {
//        let localUrlString = "usersAPI.txt"
//        localDataFetcher.fetchGenericJSONData(urlString: localUrlString, response: completion)
//    }
}
