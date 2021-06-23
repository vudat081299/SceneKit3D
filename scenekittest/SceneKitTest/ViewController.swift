//
//  ViewController.swift
//  SceneKitTest
//
//  Created by Lito Arias on 27/04/2019.
//  Copyright © 2019 Lito Arias. All rights reserved.
//

import UIKit
import SceneKit

class ViewController: UIViewController {
    
    @IBOutlet weak var sceneView: SCNView!
    var button: SCNNode!
    var listButton: [SCNNode] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // 1: Load .obj file
        guard let scene = SCNScene(named: "converse_obj.obj") else {
            return
        }
        
        // 2: Add camera node
        let cameraNode = SCNNode()
        cameraNode.camera = SCNCamera()
        // 3: Place camera
        cameraNode.position = SCNVector3(x: 0, y: 0, z: 250)
        cameraNode.camera?.zFar += 200
        // 4: Set camera on scene
        scene.rootNode.addChildNode(cameraNode)
        
        // 5: Adding light to scene
        let lightNode = SCNNode()
        lightNode.light = SCNLight()
        lightNode.light?.type = .omni
        lightNode.position = SCNVector3(x: 0, y: 10, z: 35)
        scene.rootNode.addChildNode(lightNode)
        
        // 6: Creating and adding ambien light to scene
//        let ambientLightNode = SCNNode()
//        ambientLightNode.light = SCNLight()
//        ambientLightNode.light?.type = .ambient
//        ambientLightNode.light?.color = UIColor.darkGray
//        scene?.rootNode.addChildNode(ambientLightNode)
//
//        scene?.rootNode.addChildNode(button)
//        let tapRecognizer = UITapGestureRecognizer()
//            tapRecognizer.numberOfTapsRequired = 1
//            tapRecognizer.numberOfTouchesRequired = 1
//        tapRecognizer.addTarget(self, action: #selector(sceneTapped))
//            sceneView.gestureRecognizers = [tapRecognizer]
        
        
        let buttonGeometry = SCNBox(width: 1, height: 1, length: 1, chamferRadius: 0)
        let buttonMaterial = SCNMaterial()
        buttonMaterial.diffuse.contents = UIColor(displayP3Red: 0, green: 0, blue: 0, alpha: 1)
        buttonGeometry.materials = [buttonMaterial]
        
        let ambientLightNode = SCNNode()
        ambientLightNode.light = SCNLight()
        ambientLightNode.light?.type = .ambient
        ambientLightNode.light?.color = UIColor.darkGray
        scene.rootNode.addChildNode(ambientLightNode)
        
        for i in 0...1000 {
            var buttonx: SCNNode!
            buttonx = SCNNode(geometry: buttonGeometry)
            buttonx.position = SCNVector3(x: Float(5 * i), y: 0.5, z: 15)
            scene.rootNode.addChildNode(buttonx)
            listButton.append(buttonx)
        }
        
//        button = SCNNode(geometry: buttonGeometry)
//        button.position = SCNVector3(x: 0, y: 0.5, z: 15)
//        scene?.rootNode.addChildNode(button)
        
//        let tapRecognizer = UITapGestureRecognizer()
//        tapRecognizer.numberOfTapsRequired = 1
//        tapRecognizer.numberOfTouchesRequired = 1
//        tapRecognizer.addTarget(self, action: #selector(sceneTapped))
//        sceneView.gestureRecognizers = [tapRecognizer]
        
        // Allow user to manipulate camera
        sceneView.allowsCameraControl = true
        
        // Show FPS logs and timming
        sceneView.showsStatistics = true
        
        // Set background color
        sceneView.backgroundColor = UIColor.white
        
        // Allow user translate image
        sceneView.cameraControlConfiguration.allowsTranslation = false
        
        // Set scene settings
        sceneView.scene = scene
    }
    
    @objc func sceneTapped(recognizer: UITapGestureRecognizer) {
        feedback(type: 6)
        let location = recognizer.location(in: sceneView)
        let hitResults = sceneView.hitTest(location, options: nil)
        if hitResults.count > 0 {
            let result = hitResults[0]
            let node = result.node
            if listButton.contains(node) {
//            if node == button {
                SCNTransaction.begin()
                SCNTransaction.animationDuration = 0.5
                let materials = node.geometry?.materials
                let material = materials![0]
                material.diffuse.contents = UIColor(displayP3Red: 1, green: 1, blue: 1, alpha: 1)
                SCNTransaction.commit()
                     
                let action = SCNAction.moveBy(x: 0, y: -50, z: 0, duration: 0.3)
                node.runAction(action)
            }
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        // 1
        let touch = touches.first!
        // 2
        let location = touch.location(in: sceneView)
        // 3
        let hitResults = sceneView.hitTest(location, options: nil)
        // 4
        if hitResults.count > 0 {
            // 5
            let result = hitResults.first!
            // 6
            handleTouchFor(node: result.node)
        }
    }
    
    func handleTouchFor(node: SCNNode) {
        if listButton.contains(node) {
//            if node == button {
            SCNTransaction.begin()
            SCNTransaction.animationDuration = 0.5
            let materials = node.geometry?.materials
            let material = materials![0]
            material.diffuse.contents = UIColor(displayP3Red: 1, green: 1, blue: 1, alpha: 0.3)
            SCNTransaction.commit()
            
            let action = SCNAction.moveBy(x: 0, y: -0.5, z: 0, duration: 0.3)
            node.runAction(action)
            
        }
    }
    
    
}



import Foundation

func feedback(type: Int) {
    switch type {
    case 1:
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(.error)

    case 2:
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(.success)

    case 3:
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(.warning)

    case 4:
        let generator = UIImpactFeedbackGenerator(style: .light)
        generator.impactOccurred()

    case 5:
        let generator = UIImpactFeedbackGenerator(style: .medium)
        generator.impactOccurred()

    case 6:
        let generator = UIImpactFeedbackGenerator(style: .heavy)
        generator.impactOccurred()

    default:
        let generator = UISelectionFeedbackGenerator()
        generator.selectionChanged()
    }
}
