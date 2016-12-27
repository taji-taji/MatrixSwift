//
//  VectorOperators.swift
//  Matrix
//
//  Created by 多鹿豊 on 2016/12/27.
//  Copyright © 2016年 engideer. All rights reserved.
//

import Foundation

extension Vector {
    
    // MARK: - Operators
    
    public static func *(lhs: Vector, rhs: Vector) throws -> Double {
        guard lhs.shape == rhs.shape else {
            throw MatrixError.mismatchShapes(lhs.shape, rhs.shape)
        }
        let count = lhs.count
        var result: Double = 0
        for i in 0..<count {
            result += lhs.array[i] * rhs.array[i]
        }
        return result
    }
    
    public static func +(lhs: Vector, rhs: Vector) throws -> Vector {
        guard lhs.shape == rhs.shape else {
            throw MatrixError.mismatchShapes(lhs.shape, rhs.shape)
        }
        var array: [Double] = []
        for i in 0..<lhs.count {
            array.append(lhs[i] + rhs[i])
        }
        return Vector(array)
    }
    
    public static func -(lhs: Vector, rhs: Vector) throws -> Vector {
        guard lhs.shape == rhs.shape else {
            throw MatrixError.mismatchShapes(lhs.shape, rhs.shape)
        }
        var array: [Double] = []
        for i in 0..<lhs.count {
            array.append(lhs[i] - rhs[i])
        }
        return Vector(array)
    }
    
}
