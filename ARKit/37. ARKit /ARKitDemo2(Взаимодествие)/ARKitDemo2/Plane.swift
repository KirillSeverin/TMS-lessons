//
//  Plane.swift
//  ARKitDemo2
//
//  Created by Martynov Evgeny on 19.05.21.
//

import SceneKit
import ARKit

class Plane: SCNNode { // SCNNode - тк поверхность представляет объект
    
    var anchor: ARPlaneAnchor! // якорь для размещениея объекта по координатам
    var planeGeometry: SCNPlane! // для задачи размеров

    init(anchor: ARPlaneAnchor) { // в init передаем сразу якорь для размещения
        self.anchor = anchor
        super.init()
        configure()
    }

    private func configure() {

        // определяем поверхность // берем x и z тк нам нужна горизонтальная поверхность
        self.planeGeometry = SCNPlane(width: CGFloat(anchor.extent.x), height: CGFloat(anchor.extent.z))
        
        // материал который будем использовать
        let material = SCNMaterial()
        material.diffuse.contents = UIImage(named: "hello.png")

        // присваиваем материал
        self.planeGeometry.materials = [material]

        // присваиваем planeGeometry
        self.geometry = planeGeometry
        
        // так же как и для box но устанавливаем .static
        let physicsShape = SCNPhysicsShape(geometry: self.geometry!, options: nil)
        self.physicsBody = SCNPhysicsBody(type: .static, shape: physicsShape)
        
        // BitMaskCategory
        self.physicsBody?.categoryBitMask = BitMaskCategory.plane
        self.physicsBody?.collisionBitMask = BitMaskCategory.box
        self.physicsBody?.contactTestBitMask = BitMaskCategory.box

        // задаем позицию // 0 - тк мы хотим что бы позиция Plane была на удалено на 0 от определенной поверхности
        self.position = SCNVector3(anchor.center.x, 0, anchor.center.z)

        // для отображения в горизонтале нужно SCNMatrix4MakeRotation (угол поворота,X,Y,Z)
        self.transform = SCNMatrix4MakeRotation(Float(-Double.pi / 2), 1.0, 0.0, 0.0)
    }

    func update(anchor: ARPlaneAnchor) {
        // для перерисовки width + height если мы перемещаем телефон
        self.planeGeometry.width = CGFloat(anchor.extent.x)
        self.planeGeometry.height = CGFloat(anchor.extent.z)
        // задаем новую position
        self.position = SCNVector3(anchor.center.x, 0, anchor.center.z)
    }

    // требование SCNNode
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
