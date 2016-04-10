//
//  PhysicsCategories.swift
//  TextShooter
//
//  Created by Steve D'Amico on 4/8/16.
//  Copyright © 2016 Steve D'Amico. All rights reserved.
//

/* Category constants for playerNode, enemyNode, and playerMissles which are bitmasks which can be logivcally OR'd together. A single API call tells physics engine how to deal with collisions between different nodes */
let PlayerCategory: UInt32 = 1 << 1
let EnemyCategory: UInt32 = 1 << 2
let PlayerMissleCategory: UInt32 = 1 << 3
let GravityFieldCategory: UInt32 = 1 << 4


