//
//  MatrixErrors.swift
//  Matrix
//
//  Created by 多鹿豊 on 2016/12/27.
//  Copyright © 2016年 engideer. All rights reserved.
//

import Foundation

public enum MatrixError: Error {
    public typealias Shape = (Int, Int)
    
    case invalidIndex
    case invalidColumns
    case mismatchShapes(Shape, Shape)
}
