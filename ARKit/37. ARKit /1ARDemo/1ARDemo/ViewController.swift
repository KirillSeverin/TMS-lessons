//
//  ViewController.swift
//  1ARDemo
//
//  Created by Martynov Evgeny on 15.05.21.
//

import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController {

    @IBOutlet var sceneView: ARSCNView!

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        // Create a session configuration
        let configuration = ARWorldTrackingConfiguration()

        // Run the view's session
        sceneView.session.run(configuration)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)

        // Pause the view's session
        sceneView.session.pause()
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Show statistics such as fps and timing information
        sceneView.showsStatistics = true
        // свет от камеры
        sceneView.autoenablesDefaultLighting = true

        // Создаем свою сцену
        let scene = SCNScene()

        // Создаем объекты
        createBox(in: scene)
        createText(in: scene)
        createSphere(in: scene)
        createFigures(in: scene)

        // нажатие
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(boxTapped(touch:)))
        self.sceneView.addGestureRecognizer(gestureRecognizer)

        // добавили сцену
        sceneView.scene = scene
    }

    private func createBox(in scene: SCNScene) {
        // Создаем объект
        let box = SCNBox(width: 0.2, height: 0.2, length: 0.2, chamferRadius: 0.05)

        // Создаем материал
        let boxMaterial = SCNMaterial()
        boxMaterial.diffuse.contents = UIColor.red
        // подсвечивание от камеры
        boxMaterial.specular.contents = UIColor.yellow

        // Создаем материал 2
        let sphereMaterial = SCNMaterial()
        sphereMaterial.specular.contents = UIColor.yellow

        // SCNNode - совокупность всех свойств
        let boxNode = SCNNode(geometry: box)
        boxNode.geometry?.materials = [boxMaterial, sphereMaterial]
        // задаем вектор
        boxNode.position = SCNVector3(0.0, 0.0, -1.0)
        // добавили boxNode
        scene.rootNode.addChildNode(boxNode)
    }

    private func createText(in scene: SCNScene) {
        // Создаем текст
        let textGeometry = SCNText(string: "This is the cube", extrusionDepth: 2.0) // extrusionDepth глубина на Z
        let textMaterial = SCNMaterial()
        textMaterial.diffuse.contents = UIColor.red

        let textNode = SCNNode(geometry: textGeometry)
        // маштаб текста
        textNode.scale = SCNVector3(0.005, 0.005, 0.005)
        textNode.geometry?.materials = [textMaterial]

        textNode.position = SCNVector3(-0.2, 0.2, -1.0)
        scene.rootNode.addChildNode(textNode)
    }

    private func createSphere(in scene: SCNScene) {

        let sphere = SCNSphere(radius: 0.5)

        let sphereMaterial = SCNMaterial()
        sphereMaterial.diffuse.contents = UIImage(named: "earth.jpg")

        let sphereNode = SCNNode(geometry: sphere)
        sphereNode.geometry?.materials = [sphereMaterial]
        sphereNode.position = SCNVector3(0.0, 0.0, -1.5)
        scene.rootNode.addChildNode(sphereNode)
    }

    private func createFigures(in scene: SCNScene) {
        let array: [SCNGeometry] = [SCNPlane(), SCNSphere(), SCNBox(), SCNPyramid(), SCNTube(), SCNCone(), SCNTorus(), SCNCylinder(), SCNCapsule()]
        var xCoordinate: Double = 1

        for geometryShape in array {
            let node = SCNNode(geometry: geometryShape)

            let material = SCNMaterial()
            material.diffuse.contents = UIColor.red

            node.geometry?.materials = [material]
            node.scale = SCNVector3(0.1, 0.1, 0.1)

            node.position = SCNVector3(xCoordinate, 0, -1)
            xCoordinate -= 0.2

            scene.rootNode.addChildNode(node)
        }
    }

    @objc func boxTapped(touch: UITapGestureRecognizer) {
        // отлавливаем SCNView
        let sceneView = touch.view as! SCNView
        // координаты прикосновения
        let touchLocation = touch.location(in: sceneView)
        let touchResults = sceneView.hitTest(touchLocation, options: [:])

        guard !touchResults.isEmpty, let node = touchResults.first?.node else { return }
        let boxMaterial = SCNMaterial()
        boxMaterial.diffuse.contents = UIColor.blue
        boxMaterial.specular.contents = UIColor.red
        node.geometry?.materials[0] = boxMaterial
    }
}
