//
//  AlbomsTableVC.swift
//  NetClassWork16
//
//  Created by Martynov Evgeny on 1.03.21.
//

import UIKit
import Alamofire
import SwiftyJSON

class AlbomsTableVC: UITableViewController {

    var user: User!
    var alboms: [JSON] = []

    override func viewDidLoad() {
        getData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showPhotos",
            let photosCollectionVC = segue.destination as? PhotosCollectionVC,
            let album = sender as? JSON {
            photosCollectionVC.user = user
            photosCollectionVC.album = album
        }
    }

    private func getData() {

        guard let userId = user.id else { return }
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/albums?userId=\(userId)") else { return }

        AF.request(url).responseJSON { response in
            switch response.result {
            case .success(let data):
                self.alboms = JSON(data).arrayValue
                self.tableView.reloadData()
            case .failure(let error):
                print(error)
            }
        }
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return alboms.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = UITableViewCell(style: UITableViewCell.CellStyle.subtitle, reuseIdentifier: "Cell")
        cell.textLabel?.text = (alboms[indexPath.row]["id"].int ?? 0).description
        cell.detailTextLabel?.text = alboms[indexPath.row]["title"].stringValue
        cell.detailTextLabel?.numberOfLines = 0
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let albom = alboms[indexPath.row]
        performSegue(withIdentifier: "showPhotos", sender: albom)
    }
}
