//
//  UsersVC.swift
//  NetClassWork16
//
//  Created by Martynov Evgeny on 24.02.21.
//

import UIKit
import SwiftyJSON

class UsersVC: UITableViewController {


    private let jsonUrl = URLS.usersUrl

    private var users: [User] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        //fetchData()
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let desination = segue.destination as? DetailViewController,
            let user = sender as? User {
            desination.user = user
        }
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! UserCell
        let user = users[indexPath.row]
        cell.configure(with: user)
        return cell
    }

    // MARK: - TableViewDelegate

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let user = users[indexPath.row]
        performSegue(withIdentifier: "showDetail", sender: user)
    }

    func fetchData() {

        guard let url = URL(string: jsonUrl) else { return }

        let task = URLSession.shared.dataTask(with: url) { (data, _, _) in
            guard let data = data else { return }
            let jsonData = JSON(data)
            print(jsonData)
            do {
                self.users = try JSONDecoder().decode([User].self, from: data)
                //print(self.users)
            } catch let error {
                print(error)
            }
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        task.resume()
    }
}
