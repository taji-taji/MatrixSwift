//
//  MatrixOperators.swift
//  Matrix
//
//  Created by 多鹿豊 on 2016/12/27.
//  Copyright © 2016年 engideer. All rights reserved.
//

import Foundation

infix operator +*

extension Matrix {
    
    // MARK: - Operators
    
    /// inner product
    public static func +*(lhs: Matrix, rhs: Matrix) throws -> Matrix {
        guard lhs.shape.1 == rhs.shape.0 else {
            throw MatrixError.mismatchShapes(lhs.shape, rhs.shape)
        }
        var vectors: [Vector] = []
        for rowIndex in 0..<lhs.rows {
            let row = lhs[rowIndex]
            let columns = rhs.columns
            var array: [Double] = []
            for columnIndex in 0..<columns {
                let column = rhs.column(i: columnIndex)
                try array.append(row +* column)
            }
            vectors.append(Vector(array))
        }
        return try Matrix(vectors: vectors)
    }
    
    public static func +(lhs: Matrix, rhs: Matrix) throws -> Matrix {
        guard lhs.shape == rhs.shape else {
            throw MatrixError.mismatchShapes(lhs.shape, rhs.shape)
        }
        let vectors: [Vector] = try (0..<lhs.rows).map({ (i) -> Vector in
            return try lhs[i] + rhs[i]
        })
        return try Matrix(vectors: vectors)
    }
    
    public static func -(lhs: Matrix, rhs: Matrix) throws -> Matrix {
        guard lhs.shape == rhs.shape else {
            throw MatrixError.mismatchShapes(lhs.shape, rhs.shape)
        }
        let vectors: [Vector] = try (0..<lhs.rows).map({ (i) -> Vector in
            return try lhs[i] - rhs[i]
        })
        return try Matrix(vectors: vectors)
    }
    
    public static func *(lhs: Double, rhs: Matrix) throws -> Matrix {
        let vectors: [Vector] = (0..<rhs.rows).map({ (i) -> Vector in
            return lhs * rhs[i]
        })
        return try Matrix(vectors: vectors)
    }
    
    public static func /(lhs: Matrix, rhs: Double) throws -> Matrix {
        return try (1 / rhs) * lhs
    }
    
}
