//
//  ContactListDataSource.swift
//  ContactList
//
//  Created by Martynov Evgeny on 5.04.21.
//

import UIKit

class ContactListDataSource: NSObject {
    var contactManager: ContactManager?
}

// MARK: - UITableViewDataSource
extension ContactListDataSource: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contactManager?.contactsCount ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ContactCell

        // configure cell with person
        if let person = contactManager?.person(at: indexPath.row) {
            cell.configure(with: person)
        }
        return cell
    }
}

extension ContactListDataSource: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let person = contactManager?.person(at: indexPath.row) else { return }
        NotificationCenter.default.post(name: NSNotification.Name("DidSelectRow notification"),
                                        object: self,
                                        userInfo: ["person": person]
        )
    }
}
