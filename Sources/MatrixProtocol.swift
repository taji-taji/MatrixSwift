//
//  MatrixProtocol.swift
//  Matrix
//
//  Created by 多鹿豊 on 2016/12/27.
//  Copyright © 2016年 engideer. All rights reserved.
//

import Foundation

public protocol MatrixProtocol: CustomStringConvertible {
    var rows: Int { get }
    var columns: Int { get }
    var count: Int { get }
    var shape: (Int, Int) { get }
}

public extension MatrixProtocol {
    public var shape: (Int, Int) { return (rows, columns) }
}
