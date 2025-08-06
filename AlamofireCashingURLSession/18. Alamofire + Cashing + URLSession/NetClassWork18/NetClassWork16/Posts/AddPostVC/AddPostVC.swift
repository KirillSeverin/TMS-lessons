//
//  AddPostVC.swift
//  NetClassWork16
//
//  Created by Martynov Evgeny on 1.03.21.
//

import UIKit
import Alamofire
import SwiftyJSON

class AddPostVC: UIViewController {

    @IBOutlet weak var titlePostTF: UITextField!
    @IBOutlet weak var textPostTV: UITextView!
    @IBOutlet weak var addPostBtn: UIButton!

    var user: User!
    //let postsPathURL = URL(string: "https://jsonplaceholder.typicode.com/posts")
    let postsPathURL = URL(string: "http://localhost:3000/posts")

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func addPostAction(_ sender: Any) {
        if let userId = user.id,
            let url = postsPathURL,
            let title = titlePostTF.text,
            let text = textPostTV.text {

            var request = URLRequest(url: url)

            request.httpMethod = "POST"
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")

            let post: [String: Any] = ["userId": userId,
                                       "title": title,
                                       "body": text]

            guard let httpBody = try? JSONSerialization.data(withJSONObject: post, options: []) else { return }
            request.httpBody = httpBody

            URLSession.shared.dataTask(with: request) { [weak self] (data, response, error) in
                print(response ?? "")
                if let data = data {
                    print(JSON(data))
                    DispatchQueue.main.async {
                        self?.navigationController?.popViewController(animated: true)
                    }
                } else if let error = error {
                    print(error)
                }
            }.resume()
        }
    }

    @IBAction func addAFPostAction(_ sender: Any) {
        if let userId = user.id,
            let url = postsPathURL,
            let title = titlePostTF.text,
            let text = textPostTV.text {

            let post: [String: Any] = ["userId": userId,
                                       "title": title,
                                       "body": text]

            AF.request(url, method: .post, parameters: post, encoding: JSONEncoding.default)
                .responseJSON { response in
                    
                debugPrint(response)
                print(response.request)
                print(response.response)
                debugPrint(response.result)
                    
                    switch response.result {
                case .success(let data):
                    print(data)
                    print(JSON(data))
                    self.navigationController?.popViewController(animated: true)
                case .failure(let error):
                    print(error)
                }
            }
        }
    }
}
