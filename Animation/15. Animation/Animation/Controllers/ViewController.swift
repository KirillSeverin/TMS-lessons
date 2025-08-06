//
//  ViewController.swift
//  Animation
//
//  Created by Martynov Evgeny on 22.02.21.
//

import Spring

class ViewController: UIViewController {

    @IBOutlet weak var coreAnimationView: UIView!
    @IBOutlet weak var springAnimationView: SpringView!
    @IBOutlet weak var coreAnimationBtn: UIButton!
    @IBOutlet weak var springAnimationBtn: SpringButton!

    private var originCoordinate: CGFloat?

    override func viewDidLoad() {
        super.viewDidLoad()

        originCoordinate = coreAnimationView.frame.origin.x

//        springAnimationView.animation = "flash"
//        springAnimationView.animate()
//
//        springAnimationBtn.animation = "flash"
//        springAnimationBtn.animate()
    }

    @IBAction func coreAnimationBtnAction(_ sender: UIButton) {
        
        sender.pulsate()
        
        // продолжительность / задержка / опции анимации
        // Запустите анимацию назад и вперед (необходимо комбинировать с опцией повтора).

        UIView.animate(withDuration: 0.5, delay: 0, options: [.autoreverse, .repeat], animations: {
            self.coreAnimationView.frame.origin.x += 20
        })
    }

    @IBAction func springAnimationBtnAction() {
        // тип анимации
        springAnimationView.animation = "wobble"
        // анимационная кривая
        springAnimationView.curve = "easeIn"
        // сила
        springAnimationView.force = 2
        // продолжительность
        springAnimationView.duration = 1
        // задержка
        springAnimationView.delay = 0.3
        // старт анимции
        springAnimationView.animate()

        // тип анимации
        springAnimationBtn.animation = "morph"
        // анимационная кривая
        springAnimationBtn.curve = "easeOut"
        // старт анимции
        springAnimationBtn.animate()
    }
}

