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
        // достаем cellViewModel по indexPath
        let cellViewModel = viewModel.createCellViewModel(forIndexPath: indexPath)
        // присваиваем cellViewModel
        tableViewCell.viewModel = cellViewModel
        return tableViewCell
    }
}
