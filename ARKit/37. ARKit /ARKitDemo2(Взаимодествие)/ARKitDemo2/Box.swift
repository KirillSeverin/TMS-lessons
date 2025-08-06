//
//  Box.swift
//  ARKitDemo2
//
//  Created by Martynov Evgeny on 19.05.21.
//

import SceneKit
import ARKit

class Box: SCNNode {

    init(atPosition position: SCNVector3) {
        super.init()
        let boxGeometry = SCNBox(width: 0.1, height: 0.1, length: 0.1, chamferRadius: 0) // SCNSphere(radius: 0.05)
        let material = SCNMaterial()
        material.diffuse.contents = UIColor.red
        boxGeometry.materials = [material]
        
        self.geometry = boxGeometry
        // SCNPhysicsShape - Абстракция твердого объема физического тела для настройки обнаружения столкновений.
        let physicsShape = SCNPhysicsShape(geometry: self.geometry!, options: nil)
        // dynamic - Физическое тело, на которое могут воздействовать силы и столкновения.
        // kinematic - Физическое тело, на которое не влияют силы или столкновения, но которое может вызвать столкновения, влияющие на другие тела при перемещении.
        // static - Физическое тело, которое не подвержено воздействию сил или столкновений и не может двигаться.
        self.physicsBody = SCNPhysicsBody(type: .dynamic, shape: physicsShape)
        
        // BitMaskCategory
        // установили categoryBitMask
        self.physicsBody?.categoryBitMask = BitMaskCategory.box
        // установили битовые маски с которыми мы сталкиваемся
        self.physicsBody?.collisionBitMask = BitMaskCategory.box | BitMaskCategory.plane
        // какие столкновения мы регистрируем (можем что-то делать при столкновенни с plane)
        self.physicsBody?.contactTestBitMask = BitMaskCategory.plane

        self.position = position
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
