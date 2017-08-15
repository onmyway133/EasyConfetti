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
}
