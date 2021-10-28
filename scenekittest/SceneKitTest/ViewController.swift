//
//  ViewController.swift
//  MacCatalystSceneKit
//
//  Created by Dat vu on 18/10/2021.
//

import UIKit
import SceneKit

class ViewController: UIViewController {
    
    @IBOutlet weak var sceneView: SCNView!
    var button: SCNNode!
    var listButton: [SCNNode] = []
    var cameraNode = SCNNode()
    
    let geometryButtonList: [(Float, Float, Float, CGFloat, CGFloat, CGFloat)] = [
        (0.13, 0.4, 0.6, 20, 13, 0.5),
        (-0.3, 0.1, 0.45, 16, 12, 0.5),
        (0.13, 0.12, 0.45, 16, 12, 0.5),
        (-0.17, 0.4, 0.45, 3, 13, 0.5),
        
        (-0.55, 0.11, 0.0, 0.5, 12, 14)
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // MARK: - Set up Scene
        // 1: Load .obj file
        guard let scene = SCNScene(named: "Ecopark-1.obj") else {
            print("fail")
            return
        }
        
//        let bundle = Bundle.main
//        let path = bundle.path(forResource: "ok1", ofType: "obj")
//        let url = URL(fileURLWithPath: path!)
//        let asset = MDLAsset(url: url)
//
//        guard let scene = SCNScene(named: url.absoluteString) else {
//            print("fail")
//            return
//        }
        
        
        // 2: Add camera node
//        let cameraNode = SCNNode()
        cameraNode.camera = SCNCamera()
        
        // 3: Place camera
        cameraNode.position = SCNVector3(x: 2, y: 0, z: 200)
        cameraNode.camera?.zFar += 200
        
        // 4: Set camera on scene
        scene.rootNode.addChildNode(cameraNode)
        
        // 5: Adding light to scene
        let lightNode = SCNNode()
        lightNode.light = SCNLight()
        lightNode.light?.type = .omni
        lightNode.position = SCNVector3(x: 0, y: 10, z: 35)
        let lightNode2 = SCNNode()
        lightNode2.light = SCNLight()
        lightNode2.light?.type = .omni
        lightNode2.position = SCNVector3(x: -50, y: 10, z: 0)
        scene.rootNode.addChildNode(lightNode)
        scene.rootNode.addChildNode(lightNode2)
        
        // 6: Creating and adding ambien light to scene
//        let ambientLightNode = SCNNode()
//        ambientLightNode.light = SCNLight()
//        ambientLightNode.light?.type = .ambient
//        ambientLightNode.light?.color = UIColor.darkGray
//        scene?.rootNode.addChildNode(ambientLightNode)
//
        // 7: Add button to scene and add tap regcognizer to scene
//        scene?.rootNode.addChildNode(button)
//        let tapRecognizer = UITapGestureRecognizer()
//            tapRecognizer.numberOfTapsRequired = 1
//            tapRecognizer.numberOfTouches Required = 1
//        tapRecognizer.addTarget(self, action: #selector(sceneTapped))
//            sceneView.gestureRecognizers = [tapRecognizer]
        
//        let tapRecognizer = UITapGestureRecognizer()
//        tapRecognizer.numberOfTapsRequired = 1
//        tapRecognizer.numberOfTouchesRequired = 1
//        tapRecognizer.addTarget(self, action: #selector(sceneTapped))
//        sceneView.gestureRecognizers = [tapRecognizer]
        
        let ambientLightNode = SCNNode()
        ambientLightNode.light = SCNLight()
        ambientLightNode.light?.type = .ambient
        ambientLightNode.light?.color = UIColor.darkGray
        scene.rootNode.addChildNode(ambientLightNode)
//        sceneView.autoenablesDefaultLighting = true
        
        // MARK: - Render Button
        let box = scene.rootNode.boundingBox
        print(scene.rootNode.boundingBox)
        
        let buttonGeometry = SCNBox(width: CGFloat(box.max.x - box.min.x), height: CGFloat(box.max.y - box.min.y), length: CGFloat(box.max.z - box.min.z), chamferRadius: 0)
        let buttonMaterial = SCNMaterial()
        buttonMaterial.diffuse.contents = UIColor(displayP3Red: 1, green: 0.5, blue: 0.5, alpha: 0.7)
        buttonGeometry.materials = [buttonMaterial]
        
        
//        let buttonGeometry2 = SCNBox(width: 16, height: 16, length: 1, chamferRadius: 0)
//        let buttonMaterial2 = SCNMaterial()
//        buttonMaterial2.diffuse.contents = UIColor(displayP3Red: 0.1, green: 0.1, blue: 0.1, alpha: 0.7)
//        buttonGeometry2.materials = [buttonMaterial2]
//
//        var buttonx: SCNNode!
//        buttonx = SCNNode(geometry: buttonGeometry2)
//        buttonx.position = SCNVector3(x: -0.3 * Float((box.max.x - box.min.x)) / 2, y: Float(box.max.y - box.min.y) * 0.1, z: 0.53 * Float(box.max.z - box.min.z) / 2)
//        scene.rootNode.addChildNode(buttonx)
//        listButton.append(buttonx)
        
        for element in geometryButtonList {
            let buttonGeometry3 = SCNBox(width: element.3, height: element.4, length: element.5, chamferRadius: 0)
            let buttonMaterial3 = SCNMaterial()
            buttonMaterial3.diffuse.contents = UIColor(displayP3Red: 0.1, green: 0.1, blue: 0.1, alpha: 0.7)
            buttonGeometry3.materials = [buttonMaterial3]
            var buttonx2: SCNNode!
            buttonx2 = SCNNode(geometry: buttonGeometry3)
            buttonx2.position = SCNVector3(x: element.0 * Float((box.max.x - box.min.x)) / 2, y: Float(box.max.y - box.min.y) * element.1, z: element.2 * Float(box.max.z - box.min.z) / 2)
            scene.rootNode.addChildNode(buttonx2)
            listButton.append(buttonx2)
            
            print("------")
            print(buttonx2.position.x)
            print(buttonx2.position.y)
            print(buttonx2.position.z)
        }
        
        print("------")
//        let buttonGeometry2 = SCNBox(width: 1, height: CGFloat(box.max.y - box.min.y), length: CGFloat(box.max.z - box.min.z), chamferRadius: 0)
//        let buttonMaterial2 = SCNMaterial()
//        buttonMaterial2.diffuse.contents = UIColor(displayP3Red: 0.1, green: 0.1, blue: 0.1, alpha: 0.7)
//        buttonGeometry2.materials = [buttonMaterial2]
//
//        for i in 0...1 {
//            var buttonx: SCNNode!
//            buttonx = SCNNode(geometry: buttonGeometry2)
//            buttonx.position = SCNVector3(x: Float(i) * Float((box.max.x - box.min.x)) - Float((box.max.x - box.min.x) / 2), y: Float(box.max.y - box.min.y) / 2, z: 0)
//            scene.rootNode.addChildNode(buttonx)
//            listButton.append(buttonx)
//        }
        
//        button = SCNNode(geometry: buttonGeometry)
//        button.position = SCNVector3(x: 0, y: 0.5, z: 15)
//        scene?.rootNode.addChildNode(button)
        
        
        // MARK: - Set up Camera
        // Allow user to manipulate camera
        sceneView.allowsCameraControl = true
        
        // Restrict scroll of axis
        sceneView.defaultCameraController.interactionMode = .orbitTurntable
        sceneView.defaultCameraController.inertiaEnabled = true
        sceneView.defaultCameraController.maximumVerticalAngle = 20
        sceneView.defaultCameraController.minimumVerticalAngle = 20
        
        // Show FPS logs and timming
        sceneView.showsStatistics = true
        
        // Set background color
        sceneView.backgroundColor = UIColor.white
        
        // Allow user translate image
        sceneView.cameraControlConfiguration.allowsTranslation = true
        
        // Set scene settings
        sceneView.scene = scene
        
        
        // Place these two lines of code where your sceneView is initialize or its properties are set.
        var pinchRecognizer = UITapGestureRecognizer(target: self, action: #selector(pinchGesture))
        pinchRecognizer.numberOfTapsRequired = 2
        sceneView.addGestureRecognizer(pinchRecognizer)
        
        // Place these two lines of code where your sceneView is initialize or its properties are set.
//        var pan = UIPinchGestureRecognizer(target: self, action: #selector(pinchGesture))
//        sceneView.addGestureRecognizer(pan)
    }
    
    @objc func pinchGesture(_ sender: UITapGestureRecognizer) {
        print(sender.numberOfTouches)
        
          if sender.numberOfTouches == 2 {
              // Disable zoom
              print("zoom attempted")
          }
      }
        
    
    // ref to step 7
    @objc func sceneTapped(recognizer: UITapGestureRecognizer) {
        let location = recognizer.location(in: sceneView)
        let hitResults = sceneView.hitTest(location, options: nil)
        if hitResults.count > 0 {
            let result = hitResults[0]
            let node = result.node
            if listButton.contains(node) {
//            if node == button {
                SCNTransaction.begin()
                SCNTransaction.animationDuration = 0.0
                let materials = node.geometry?.materials
                let material = materials![0]
                material.diffuse.contents = UIColor(displayP3Red: 1, green: 0.5, blue: 0.5, alpha: 1)
                SCNTransaction.commit()
                     
                let action = SCNAction.moveBy(x: 0, y: -100, z: 0, duration: 0)
                node.runAction(action)
            }
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        feedback(type: 6)
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
    var i = true
    func handleTouchFor(node: SCNNode) {
        if listButton.contains(node) {
//            if node == button {
            
            feedback(type: 6)
            
//            SCNTransaction.begin()
//            SCNTransaction.animationDuration = 0.0
//            let materials = node.geometry?.materials
//            let material = materials![0]
////            if i {
////                material.diffuse.contents = UIColor(displayP3Red: 1, green: 0.5, blue: 0.5, alpha: 0.7)
////            } else {
//                material.diffuse.contents = UIColor(displayP3Red: 0.5, green: 0.5, blue: 1, alpha: 0.7)
////            }
//            i = !i
//            SCNTransaction.commit()
            
            let a = node.geometry?.materials[0].diffuse.contents as! UIColor
            var red:CGFloat = 0
            var green:CGFloat = 0
            var blue:CGFloat = 0
            var alpha:CGFloat = 0

            a.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
            if red <= 0.5 {
                node.geometry?.materials[0].diffuse.contents = UIColor(displayP3Red: 0.9, green: 0.5, blue: 0.5, alpha: 0.7)
            } else {
                node.geometry?.materials[0].diffuse.contents = UIColor(displayP3Red: 0.2, green: 0.5, blue: 1, alpha: 0.7)
            }
//            let action = SCNAction.moveBy(x: 0, y: -5, z: 0, duration: 0.3)
//            node.runAction(action)
        }
    }
    
    
    // MARK: - Source code render 3D
    @IBAction func width(_ sender: UISlider) {
        feedback(type: 6)
        
    }
    
    @IBAction func height(_ sender: UISlider) {
        feedback(type: 6)
        
    }
    
    var side = 0
    @IBAction func sideOnChanged(_ sender: UIStepper) {
        feedback(type: 6)
        side = Int(sender.value)
    }
}

// MARK: - Tap Engine
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
