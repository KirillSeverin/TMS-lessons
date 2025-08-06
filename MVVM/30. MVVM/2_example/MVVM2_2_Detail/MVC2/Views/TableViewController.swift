//
//  TableViewController.swift
//  MVC2
//
//  Created by Martynov Evgeny on 18.04.21.
//

import UIKit

class TableViewController: UITableViewController {

    // !!! Мы должны через контроллер обращаться не к модели а к VeiwModel -> убираем pofiles из контроллера
    private var viewModel: TableViewViewModelProtocol? // тип - протокол

    override func viewDidLoad() {
        super.viewDidLoad()

        viewModel = TableViewViewModel()
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.numberOfRows() ?? 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? TableViewCell
        guard let tableViewCell = cell, let viewModel = viewModel else { return UITableViewCell() }
        let cellViewModel = viewModel.cellViewModel(forIndexPath: indexPath)
        
        tableViewCell.viewModel = cellViewModel
        return tableViewCell
    }

    // MARK: - Table view delegate

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let viewModel = viewModel else { return }
        // сохраним выбранный indexPath в TableViewViewModel
        viewModel.selectRow(atIndexPath: indexPath)
        performSegue(withIdentifier: "detailSegue", sender: nil)
    }

    // MARK: - Prepare for segue

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let identifier = segue.identifier, let viewModel = viewModel else { return }
        if identifier == "detailSegue" {
            if let dvc = segue.destination as? DetailViewController {
                dvc.detailViewModel = viewModel.viewModelForSelectedRow()
            }
        }
    }
}
