import Foundation

public struct Matrix: MatrixProtocol {
    
    public typealias VectorArray = Array<Double>
    
    
    // MARK: - Properties
    
    public var rows: Int { return vectors.count }
    public var columns: Int { return vectors.first?.count ?? 0 }
    public var count: Int { return rows * columns }
    public var vectors: [Vector] = []
    
    public var description: String {
        let vectorString = vectors.map { (vector) -> String in
            return vector.description
        }
        return "[" + vectorString.joined(separator: "\n") + "]"
    }
    
    
    // MARK: - Initializer
    
    public init(vectors: [Vector]) throws {
        self.vectors = vectors
        try vectors.forEach { (vector) in
            if vector.count != self.columns {
                throw MatrixError.invalidColumns
            }
        }
    }
    
    public init(arrays: [VectorArray]) throws {
        let columnCount = arrays.first?.count ?? 0
        try arrays.forEach { (array) in
            if columnCount != array.count {
                throw MatrixError.invalidColumns
            }
            let vector = Vector(array)
            self.vectors.append(vector)
        }
    }
    
    public init(shape: (rows: Int, columns: Int)) {
        self.vectors = (0..<rows).map { (i) -> Vector in
            var array = Array<Double>(repeating: 0, count: columns)
            array[i] = 1
            return Vector(array)
        }
    }
    
    // MARK: - Subscripts
    
    public subscript(row: Int) -> Vector {
        get {
            return vectors[row]
        }
        set {
            vectors[row] = newValue
        }
    }
    
    
    // MARK: - Methods
    
    public func column(i: Int) -> Vector {
        var array: [Double] = []
        for row in 0..<rows {
            array.append(vectors[row][i])
        }
        return Vector(array)
    }

}
