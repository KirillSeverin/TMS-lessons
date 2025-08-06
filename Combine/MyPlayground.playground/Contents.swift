//: A UIKit based Playground for presenting user interface

import UIKit
import PlaygroundSupport
import Combine

enum State {
    case success
    case failure
}

extension State {
    var colorRepresentation: UIColor {
        switch self {
        case .success:
            return .green
        case .failure:
            return .red
        }
    }
}

class MyViewController: UIViewController {
    
    let stateChanged = Notification.Name("statr_changed")
    
    var state: State = .success {
        didSet {
            NotificationCenter.default.post(name: stateChanged, object: state)
        }
    }
    
    override func loadView() {
        let view = UIView()
        view.backgroundColor = .green
        
        let label = UILabel()
        label.frame = CGRect(x: 150, y: 200, width: 200, height: 20)
        label.text = "Combine!"
        label.textColor = .black
        
        view.addSubview(label)
        self.view = view
        
        Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(repeatFunc), userInfo: nil, repeats: true)
    }
    
    func setupPublisherAndSubscryber() {
        let publisher = NotificationCenter.Publisher(center: .default, name: stateChanged, object: nil)
            .map { notification -> UIColor? in
                (notification.object as? State)?.colorRepresentation
            }
        let subscriber = Subscribers.Assign(object: view, keyPath: \.backgroundColor)
        publisher.subscribe(subscriber)
    }
    
    override func viewDidLoad() {
        setupPublisherAndSubscryber()
    }
    
    @objc func repeatFunc() {
        state = state == .success ? .failure : .success
    }
}
// Present the view controller in the Live View window
PlaygroundPage.current.liveView = MyViewController()
