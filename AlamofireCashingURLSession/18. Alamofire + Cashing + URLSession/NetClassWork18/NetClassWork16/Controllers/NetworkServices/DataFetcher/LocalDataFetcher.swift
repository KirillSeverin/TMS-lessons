//
//  LocalDataFetcher.swift
//  Liscov
//
//  Created by Martynov Evgeny on 28.03.21.
//

import Foundation

/*
 Модуль нижнего уровня для DataFetcherService
 Модуль высшего  уровня для NetworkService
 */

class LocalDataFetcher: NetworkDataFetcher {

    override func fetchGenericJSONData<T>(urlString: String, response: @escaping (T?) -> Void) where T: Decodable {

//        guard let file = Bundle.main.url(forResource: urlString, withExtension: nil) else {
//            print("Couldn't find \(urlString) in main bundle.")
//            response(nil)
//            return
//        }
        guard let file = Bundle.main.url(forResource: urlString, withExtension: nil) else {
            
            
            
            return <#return value#> }
        

        let data = try? Data(contentsOf: file)

        let decoded = self.decodeJSON(type: T.self, data: data)
        response(decoded)
    }
}
