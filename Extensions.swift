//
//  Extensions.swift
//  Portal1
//
//  Created by Fernando Jt on 21/6/18.
//  Copyright © 2018 Fernando Jumbo Tandazo. All rights reserved.
//

import Foundation
import SceneKit
import ARKit

var width : CGFloat = 0.02
var height : CGFloat = 1
var length: CGFloat = 1

var doorLengh : CGFloat = 0.3

func createBox(isDoor : Bool) -> SCNNode{
    let node = SCNNode()
    
    //Add first Box
    let firstBox = SCNBox(width: width, height: height, length: isDoor ? doorLengh: length, chamferRadius: 0)
    let firstBoxNode = SCNNode(geometry: firstBox)
    firstBoxNode.renderingOrder = 200
    node.addChildNode(firstBoxNode)
    //Ad masked box
    let maskedBox = SCNBox(width: width, height: height, length: isDoor ? doorLengh : length, chamferRadius: 0)
    maskedBox.firstMaterial?.diffuse.contents = UIColor.white
    maskedBox.firstMaterial?.transparency = 0.00001
    
    let maskedBoxNode = SCNNode(geometry: maskedBox)
    maskedBoxNode.renderingOrder = 100
    maskedBoxNode.position = SCNVector3.init(width, 0, 0)
    
    node.addChildNode(maskedBoxNode)
    
    return node
}
extension FloatingPoint{
    var degressToRadians : Self{
        return self * .pi / 180
    }
    var radiansToDegress : Self {
        return self * 180 / .pi
    }
}
