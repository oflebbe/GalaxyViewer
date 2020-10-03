//
//  ViewController.swift
//  GalaxyViewer
//
//  Created by Olaf Flebbe on 03.10.20.
//

import Cocoa
import SceneKit

class ViewController: NSViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        // create a new scene
        let scene = SCNScene()
        
        // create and add a camera to the scene
        let cameraNode = SCNNode()
        cameraNode.camera = SCNCamera()
        cameraNode.camera?.zNear = 1.0
        cameraNode.camera?.zFar = 2200.0
        scene.rootNode.addChildNode(cameraNode)
        
        let galaxyNode = SCNNode()
       
        
        
        let number = 50
        // place the camera
        cameraNode.position = SCNVector3(x: 0, y: 0, z: 2000)
        let box = SCNBox( width: 2.0, height: 2.0, length: 2.0, chamferRadius: 0.0)
        box.firstMaterial?.diffuse.contents = NSColor.green
        box.firstMaterial?.lightingModel = .lambert
        box.firstMaterial?.metalness.contents = 1.0
        for xx in -number ... number {
            for yy in -number ... number {
                for zz in -number ... number {
                    if Int.random(in: 1...100) < 10 {
                        
                        let brick = SCNNode( geometry: box.copy() as? SCNGeometry)
                        
                        brick.position = SCNVector3(x: CGFloat(xx*5), y: CGFloat(yy*5), z: CGFloat( zz * 5))
                        
                        galaxyNode.addChildNode(brick)
                    }
                }
            }
        }
        scene.rootNode.addChildNode( galaxyNode)
        // animate the 3d object
            galaxyNode.runAction(SCNAction.repeatForever(SCNAction.rotateBy(x: 1, y: 2, z: 0, duration: 5)))
        
        // retrieve the SCNView
        let scnView = self.view as! SCNView
        
        // set the scene to the view
        scnView.scene = scene
        
        // allows the user to manipulate the camera
        scnView.allowsCameraControl = true
        scnView.autoenablesDefaultLighting = true
        
        // show statistics such as fps and timing information
        scnView.showsStatistics = true
        
        // configure the view
        scnView.backgroundColor = NSColor.black
    }
    
    override var representedObject: Any? {
        didSet {
            // Update the view, if already loaded.
        }
    }
    
    
}

