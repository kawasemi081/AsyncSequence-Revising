class Model: Sequence {
    ///- Note: Step 3 - Iterators
    /// We can clear most of the code out of Model. All it needs to be able to do it make an iterator.
    func makeIterator() -> ModelIterator {
        ModelIterator()
    }
}

//class Model {
//  private var numbers: [Int] = []
//
//  init() {
//    for _ in 1...5 {
//      let number = Int.random(in: 1...99)
//      numbers.append(number)
//    }
//  }
//}
//
//extension Model: Sequence {
    ///- Note: Step 2 - Sequence
    /// If a sequence is a collection of items of type Element, then next() -> Element?
    /// we'll build our own sequence.
    /// A sequence must have an iterator. So a sequence returns an iterator in the makeIterator() method.
    /// An iterator must have a next() method.
//    func makeIterator() -> IndexingIterator<[Int]> {
//        numbers.makeIterator()
//    }
//}
