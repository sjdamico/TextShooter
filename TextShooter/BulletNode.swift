//
//  BulletNode.swift
//  TextShooter
//
//  Created by Steve D'Amico on 4/8/16.
//  Copyright © 2016 Steve D'Amico. All rights reserved.
//

import SpriteKit

class BulletNode: SKNode {      // Creates bullets
    // Property holds the bullet'sthrust vector
    var thrust: CGVector = CGVectorMake(0, 0)
    
    override init() {
        super.init()
        
        let dot = SKLabelNode(fontNamed: "Courier")     // Single dot for the bullet
        dot.fontColor = SKColor.blackColor()
        dot.fontSize = 40
        dot.text = "."
        addChild(dot)

        // Creates physics body and the category it belongs to for use in collisions
        let body = SKPhysicsBody(circleOfRadius: 1)
        
        body.dynamic = true
        body.categoryBitMask = PlayerMissleCategory
        body.contactTestBitMask = EnemyCategory
        body.contactTestBitMask = EnemyCategory
        body.fieldBitMask = GravityFieldCategory
        body.mass = 0.01
        
        physicsBody = body
        name = "Bullet \(self)"
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        let dx = aDecoder.decodeFloatForKey("thrustX")
        let dy = aDecoder.decodeFloatForKey("thrustY")
        thrust = CGVectorMake(CGFloat(dx), CGFloat(dy))
    }
    
    override func encodeWithCoder(aCoder: NSCoder) {
        super.encodeWithCoder(aCoder)
        aCoder.encodeFloat(Float(thrust.dx), forKey: "thrustX")
        aCoder.encodeFloat(Float(thrust.dy), forKey: "thrustY")
    }

    // Creates a new bullet with a thrust vector that the physics engine uses to propel the bullet
    class func bullet(from start: CGPoint, toward destination: CGPoint) -> BulletNode {
        let bullet = BulletNode()
        bullet.position = start
        let movement = vectorBetweenPoints(start, p2: destination)
        let magnitude = vectorLength(movement)
        let scaledMovement = vectorMultiply(movement, m: 1/magnitude)
        
        let thrustMagnitude = CGFloat(100.0)
        bullet.thrust = vectorMultiply(scaledMovement, m: thrustMagnitude)
        
        bullet.runAction(SKAction.playSoundFileNamed("shoot.wav", waitForCompletion: false))
        
        return bullet
    }
    
    func applyRecurringForce() {
        physicsBody!.applyForce(thrust)
    }
}
