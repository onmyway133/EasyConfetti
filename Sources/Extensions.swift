import Foundation

extension Array {
  func shuffled() -> [Element] {
    if count < 2 { return self }
    var list = self
    for i in 0..<(list.count - 1) {
      let j = Int(arc4random_uniform(UInt32(list.count - i))) + i
      if i != j {
        #if swift(>=3.2)
          list.swapAt(i, j)
        #else
          swap(&list[i], &list[j])
        #endif
      }
    }
    return list
  }

  /// Creates an array containing all combinations of two arrays.
  static func createAllCombinations<T, U>(
    from lhs: Array<T>,
    and rhs: Array<U>
  ) -> Array<(T, U)> {
    let result: [(T, U)] = lhs.reduce([]) { (accum, t) in
      let innerResult: [(T, U)] = rhs.reduce([]) { (innerAccum, u) in
        return innerAccum + [(t, u)]
      }
      return accum + innerResult
    }
    return result
  }
}
