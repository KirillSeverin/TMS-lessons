//
//  ImageViewController.swift
//  NetClassWork16
//
//  Created by Martynov Evgeny on 24.02.21.
//

import UIKit

class ImageViewController: UIViewController {


    let dataFetcherService = DataFetcherService()
    
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var activityIndicator: UIActivityIndicatorView!

    override func viewDidLoad() {
        super.viewDidLoad()
        fetchImage()
        activityIndicator.startAnimating()
        activityIndicator.hidesWhenStopped = true // будет скрываться после остановки
    }

    private func fetchImage() {
        guard let url = URL(string: URLS.imageUrl) else { return }

        dataFetcherService.fetchImage(imageUrl: url) { image in
            DispatchQueue.main.async {
                self.activityIndicator.stopAnimating()
                self.imageView.image = image
            }
        }
        
    }
}

