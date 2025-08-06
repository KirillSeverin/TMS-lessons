//
//  ImageDataFetcher.swift
//  NetClassWork18
//
//  Created by Kirill Severin on 29.03.21.
//

import UIKit

protocol ImageDataFetcherProtocol {
    func getImage(imageUrl: URL, imageResponse: @escaping (UIImage?) -> Void)
}

class ImageDataFetcher: ImageDataFetcherProtocol {

    public func getImage(imageUrl: URL, imageResponse: @escaping (UIImage?) -> Void) {
        
        let session = URLSession.shared
        
        session.dataTask(with: imageUrl) { (data, response, error) in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            if let response = response {
                print(response)
            }
            if let data = data, let image = UIImage(data: data) {
                imageResponse(image)
            }
        }.resume()
    }
}
