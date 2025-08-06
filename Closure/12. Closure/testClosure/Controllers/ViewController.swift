//
//  ViewController.swift
//  testClosure
//
//  Created by Martynov Evgeny on 10.02.21.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var label: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func buttonAction() {
        guard let secondViewController = storyboard?.instantiateViewController(identifier: "SecondViewController") as? SecondViewController else { return }
        secondViewController.text = "From first"
        secondViewController.completionHandler = { [weak self] text in
            self?.label.text = text
        }
        navigationController?.pushViewController(secondViewController, animated: true)
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
