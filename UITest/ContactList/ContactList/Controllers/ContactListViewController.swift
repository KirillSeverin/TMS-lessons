//
//  ViewController.swift
//  ContactList
//
//  Created by Martynov Evgeny on 31.03.21.
//

import UIKit

class ContactListViewController: UIViewController {

    @IBOutlet var tableView: UITableView!
    @IBOutlet var dataSource: ContactListDataSource!
    // привязали через добавление object в storyboard

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = dataSource
        tableView.delegate = dataSource

        let contactManager = ContactManager()
        dataSource.contactManager = contactManager

        NotificationCenter.default.addObserver(self,
                                               selector: #selector(showDetail(withNotification:)),
                                               name: NSNotification.Name(rawValue: "DidSelectRow notification"),
                                               object: nil)

        // идентификатор для view для UI теста
        view.accessibilityIdentifier = "mainView"
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }

    @IBAction func addNewContact(_ sender: UIBarButtonItem) {
        if let newContactVC = storyboard?.instantiateViewController(
                withIdentifier: "NewContactViewController"
            ) as? NewContactViewController {

            newContactVC.modalPresentationStyle = .fullScreen
            newContactVC.contactManager = dataSource.contactManager
            present(newContactVC, animated: true)
        }
    }

    @objc func showDetail(withNotification notification: Notification) {
        guard let userInfo = notification.userInfo,
            let person = userInfo["person"] as? Person,
            let detailVC = storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController else { fatalError() }

        detailVC.person = person
        navigationController?.pushViewController(detailVC, animated: true)
    }
}

