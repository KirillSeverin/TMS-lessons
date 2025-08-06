//
//  DetailViewController.swift
//  MVVM2
//
//  Created by Martynov Evgeny on 18.04.21.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var textLabel: UILabel!

    var detailViewModel: DetailViewModelProtocol?
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        guard let viewModel = detailViewModel else { return }
        self.textLabel.text = viewModel.description
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        detailViewModel?.age.bind { [unowned self] in // у viewModel устанавливаем наблюдателя
            guard let string = $0 else { return } // $0 - тк у нас 1 параметр
            self.textLabel.text = string
        }

        // пример применения Data Binding с применением Boxing
        // при изменении значений во ViewModel мы автоматически должны обновить интерфейс
        delay(delay: 5) { [weak self] in
            self?.detailViewModel?.age.value = "some new value" // как будто из TextField
        }
    }

    private func delay(delay: Double, closure: @escaping () -> ()) {
        DispatchQueue.main.asyncAfter(wallDeadline: .now() + delay) {
            closure()
        }
    }
}
