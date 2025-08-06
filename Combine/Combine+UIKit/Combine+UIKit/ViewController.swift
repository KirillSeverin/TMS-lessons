//
//  ViewController.swift
//  Combine+UIKit
//
//  Created by Martynov Evgeny on 2.06.21.
//

import UIKit
import Combine

enum WeatherError: Error {
    case invalideResponse
}

class ViewController: UIViewController {
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var cityTF: UITextField!
    @IBOutlet weak var temperatureLbl: UILabel!
    @IBOutlet weak var seachButton: UIButton!
    
    private let baseURL = "https://api.openweathermap.org/data/2.5/weather"
    private let apiKey = "3a5edcd15576a17cdf175469a6372cd3"
    
    private var cancelable: AnyCancellable?
    
    @IBAction func serchTapped(_ sender: Any) {
        guard let cityName = cityTF.text else { return }
        getTemperature(cityName: cityName)
    }
    
    private func getTemperature(cityName: String) {
        
        guard let weatherURL = URL(string: "\(baseURL)?APPID=\(apiKey)&q=\(cityName)&units=metric") else { return }
        
        activityIndicator.startAnimating()
        seachButton.isEnabled = false
        
        cancelable = URLSession.shared.dataTaskPublisher(for: weatherURL)
            .subscribe(on: DispatchQueue(label: "DispatchQueueName"))
            .tryMap { data, response -> Data in
                guard let httpResponse = response as? HTTPURLResponse,
                      httpResponse.statusCode == 200 else {
                    throw WeatherError.invalideResponse
                }
                return data
            }
            .decode(type: Temperature.self, decoder: JSONDecoder())
            .catch { error in
                return Just(Temperature.placeholder)
            }
            .map { $0.main?.temp ?? 0.0 }
            .map { "Weather in \(cityName) : \($0)C" }
            .receive(on: RunLoop.main)
            .sink(receiveCompletion: { [weak self] comletion in
                self?.activityIndicator.stopAnimating()
                self?.seachButton.isEnabled = true
            }, receiveValue: { tempString in
                print(tempString)
                self.temperatureLbl.text = tempString
            })
    }
}

