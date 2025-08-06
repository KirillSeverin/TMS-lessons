//
//  NetworkService.swift
//  SRP
//
//  Created by Martynov Evgeny on 24.03.21.
//

import Foundation

/*
 Под абстракциями мы применяем protocos
 Модуль нижнего уровня для NetworkDataFetcher
 Модуль нижнего уровня для LocalDataFetcher
 */

protocol Networking {
    func request(urlString: String, completion: @escaping (Data?, Error?) -> Void)
}

class NetworkService: Networking {

    public func request(urlString: String, completion: @escaping (Data?, Error?) -> Void) {
        guard let url = URL(string: urlString) else { return }
        let request = URLRequest(url: url)
        let task = createDataTask(from: request, completion: completion)
        task.resume()
    }

     func createDataTask(from requst: URLRequest, completion: @escaping (Data?, Error?) -> Void) -> URLSessionDataTask {
        return URLSession.shared.dataTask(with: requst, completionHandler: { (data, response, error) in
            DispatchQueue.main.async {
                completion(data, error)
            }
        })
    }
}

