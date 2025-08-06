//
//  TableViewController.swift
//  MVVM3
//
//  Created by Martynov Evgeny on 19.04.21.
//

import UIKit

class TableViewController: UITableViewController {

    // injected from storyboard
    @IBOutlet var tableViewModel: TableViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()

        tableViewModel.fetchIPhones { [weak self] in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
    }

    // MARK: - Table View Data Soutce
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableViewModel.numberOfRowsInSection()
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = tableViewModel.titleForCell(atIndexPath: indexPath) // отдельную viewModelCell не будем создавать
        return cell
    }
}
