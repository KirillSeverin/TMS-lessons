//
//  SecondViewController.swift
//  testClosure
//
//  Created by Martynov Evgeny on 10.02.21.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    
    var completionHandler: ((String) -> ())?
    
    var text:String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        label.text = text
    }
    
    @IBAction func buttonAction() {
        
        if let completionHandler = completionHandler {
            let count = completionHandler("From second")
            label.text = String(text.count)
        }
        
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
