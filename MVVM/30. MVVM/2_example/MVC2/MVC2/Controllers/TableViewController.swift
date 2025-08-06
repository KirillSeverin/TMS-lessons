//
//  TableViewController.swift
//  MVC2
//
//  Created by Martynov Evgeny on 18.04.21.
//

import UIKit

class TableViewController: UITableViewController {

    var profiles: [Profile]!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Заполним массив
        profiles = [
            Profile(name: "name1", secondName: "secondName1", age: 11),
            Profile(name: "name2", secondName: "secondName2", age: 22),
            Profile(name: "name3", secondName: "secondName3", age: 33)]
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return profiles.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? TableViewCell

        guard let tableViewCell = cell else { return UITableViewCell() }

        let profile = profiles[indexPath.row]

        tableViewCell.ageLabel.text = "\(profile.age)"
        tableViewCell.fullNameLabel.text = "\(profile.name) \(profile.secondName)"

        return tableViewCell
    }
}
