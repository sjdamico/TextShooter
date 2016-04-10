//
//  Geometry.swift
//  TextShooter
//
//  Created by Steve D'Amico on 4/8/16.
//  Copyright © 2016 Steve D'Amico. All rights reserved.
//

import UIKit

// Takes a CGVector and a CGFloat
// Returns a new CGFloat where each component of v has been multiplied by m.

 func vectorMultiply(v: CGVector, m: CGFloat) -> CGVector {         // Changed _m to m
    return CGVectorMake(v.dx * m, v.dy * m)
}

// Takes two CGPoints.
// Returns a CGVector representing a direction from p1 to p2.
func vectorBetweenPoints(p1: CGPoint, p2: CGPoint) -> CGVector {    // Changed _p2 to p2
    return CGVectorMake(p2.x - p1.x, p2.y - p1.y)
}

// Takes a CGVector.
// Returns a CGFloat containing the length of the vector, calculated using
// Pythagoras' theorem.
func vectorLength(v: CGVector) -> CGFloat {
    return CGFloat(sqrtf(powf(Float(v.dx), 2) + powf(Float(v.dy), 2)))
}

// Takes two CGPoints. Returns a CGFloat containing the distance between them,
// calculated with Pythagoras' theorem.
func pointDistance(p1: CGPoint, p2: CGPoint) -> CGFloat {           // Changed -p2 to p2
    return CGFloat(sqrtf(powf(Float(p2.x - p1.x), 2) + powf(Float(p2.y - p1.y), 2)))
}
