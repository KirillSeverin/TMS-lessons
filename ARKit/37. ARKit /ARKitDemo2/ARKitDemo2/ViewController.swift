//
//  ViewController.swift
//  ARKitDemo2
//
//  Created by Martynov Evgeny on 19.05.21.
//

import UIKit
import SceneKit
import ARKit

// не забываем о info.plist (нужно добавить доступ к камере)
class ViewController: UIViewController {

    @IBOutlet var sceneView: ARSCNView!

    // массив различных поверхностей
    var planes = [Plane]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the view's delegate
        sceneView.delegate = self

        // Show statistics such as fps and timing information
        sceneView.showsStatistics = true

        // ARSCNDebugOptions.showFeaturePoints - желтые точки, которые определяют поверхность
        // ARSCNDebugOptions.showWorldOrigin - оси координат
        sceneView.debugOptions = [ARSCNDebugOptions.showFeaturePoints, ARSCNDebugOptions.showWorldOrigin]

        // освещение от камеры
        sceneView.autoenablesDefaultLighting = true

        // Create a new scene
        let scene = SCNScene()

        // Set the scene to the view
        sceneView.scene = scene

        setupGestures()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        // Create a session configuration
        let configuration = ARWorldTrackingConfiguration()

        // Определение горизонтальных поверхностей
        configuration.planeDetection = .horizontal

        // Run the view's session
        sceneView.session.run(configuration)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)

        // Pause the view's session
        sceneView.session.pause()
    }
}

// MARK: - ARSCNViewDelegate

extension ViewController: ARSCNViewDelegate {

    // срасбативает при добавлении node по anchor
    func renderer(_ renderer: SCNSceneRenderer, didAdd node: SCNNode, for anchor: ARAnchor) {

        // если мы определили что то кроме поверхности не добавляем
        guard anchor is ARPlaneAnchor else { return }

        // создаем поверхность
        let plane = Plane(anchor: anchor as! ARPlaneAnchor)

        // добавляем в массив + node
        self.planes.append(plane)
        node.addChildNode(plane)
    }

    // обоновление node если мы движем камерой вдоль поверхности
    func renderer(_ renderer: SCNSceneRenderer, didUpdate node: SCNNode, for anchor: ARAnchor) {

        // пытаемся определить поверхность из planes (фильтруем по совпадению с anchor)
        let plane = self.planes.filter { plane in
            return plane.anchor.identifier == anchor.identifier
        }.first

        guard plane != nil else { return }

        // расширим поверхность
        plane?.update(anchor: anchor as! ARPlaneAnchor)
    }
}

// MARK: - Works with objects

extension ViewController {

    func setupGestures() {
        // создаем TapGestureRecognizer
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(placeBox))
        // количетсво нажатий для дествия
        tapGestureRecognizer.numberOfTapsRequired = 2
        self.sceneView.addGestureRecognizer(tapGestureRecognizer)
    }

    // Установка коробки
    @objc func placeBox(tapGesture: UITapGestureRecognizer) {

        // достали sceneView
        let sceneView = tapGesture.view as! ARSCNView
        // достали location (место нажатия)
        let location = tapGesture.location(in: sceneView)

        // ARRaycastQuery - Математический луч, который вы используете для поиска 3D-позиций на реальных поверхностях.
        guard let query = sceneView.raycastQuery(from: location, allowing: .existingPlaneInfinite, alignment: .any) else {
            return
        }
        // [ARRaycastResult] - Информация о поверхности реального мира, найденная при исследовании точки на экране.
        let results = sceneView.session.raycast(query)
        // достаем первый
        guard let hitResult = results.first else {
            print("No surface found")
            return
        }
        // создаем коробку
        createBox(hitResult: hitResult)
    }

    func createBox(hitResult: ARRaycastResult) {
        // координаты реального мира
        let position = SCNVector3(hitResult.worldTransform.columns.3.x,
                                  hitResult.worldTransform.columns.3.y + 0.05, // 0.05 - половина высоты кубика
                                  hitResult.worldTransform.columns.3.z)

        // создание и добавление box
        let box = Box(atPosition: position)
        sceneView.scene.rootNode.addChildNode(box)

        let position2 = SCNVector3(hitResult.worldTransform.columns.3.x,
                                   hitResult.worldTransform.columns.3.y + 0.15,
                                   hitResult.worldTransform.columns.3.z + 0.5)
        let scene = SCNScene(named: "art.scnassets/ship.scn")!
        let ship: SCNNode = scene.rootNode.childNodes.first!
        ship.position = position2
        sceneView.scene.rootNode.addChildNode(ship)
    }
}
