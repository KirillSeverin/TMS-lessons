//
//  PostsTableViewController.swift
//  NetClassWork16
//
//  Created by Martynov Evgeny on 1.03.21.
//

import UIKit

class PostsTableViewController: UITableViewController {

    var user: User!
    var posts: [Post] = []
    
    //let postsPathURL = "https://jsonplaceholder.typicode.com/posts"
    let postsPathURL = "http://localhost:3000/posts"
    
    override func viewWillAppear(_ animated: Bool) {
        getPosts()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showComments",
            let postId = sender as? Int,
            let commentsVC = segue.destination as? CommentsTableViewController {
            commentsVC.getComments(pathUrl: "\(postsPathURL)/\(postId)/comments")
        } else if segue.identifier == "addPost",
            let addPostVC = segue.destination as? AddPostVC {
            addPostVC.user = user
        }

    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = UITableViewCell(style: UITableViewCell.CellStyle.subtitle, reuseIdentifier: "Cell")
        cell.textLabel?.text = posts[indexPath.row].title
        cell.detailTextLabel?.text = posts[indexPath.row].body
        cell.textLabel?.numberOfLines = 0
        cell.detailTextLabel?.numberOfLines = 0
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let post = posts[indexPath.row].id
        performSegue(withIdentifier: "showComments", sender: post)
    }



    func getPosts() {
        
        guard let userId = user.id else { return }
        let pathUrl = "\(postsPathURL)?userId=\(userId)"

        guard let url = URL(string: pathUrl) else { return }

        let task = URLSession.shared.dataTask(with: url) { (data, _, _) in
            guard let data = data else { return }
            do {
                self.posts = try JSONDecoder().decode([Post].self, from: data)
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
