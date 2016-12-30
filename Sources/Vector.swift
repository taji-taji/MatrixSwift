//
//  Vector.swift
//  Matrix
//
//  Created by 多鹿豊 on 2016/12/27.
//  Copyright © 2016年 engideer. All rights reserved.
//

import Foundation

public struct Vector: MatrixProtocol {
    public var rows: Int { return 1 }
    public var columns: Int { return array.count }
    public var count: Int { return columns }
    public var array: [Double] = []
    
    public var description: String {
        let arrayString = array.map({ (Double) -> String in
            return "\(Double)"
        })
        return "[" + arrayString.joined(separator: ",") + "]"
    }
    
    public init(_ array: [Double]) {
        self.array = array
    }
    
    public subscript(i: Int) -> Double {
        get {
            return array[i]
        }
        set {
            array[i] = newValue
        }
    }
    
}
