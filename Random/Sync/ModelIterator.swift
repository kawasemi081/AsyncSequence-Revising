
class ModelIterator: IteratorProtocol {
    ///- Note: Step 3 -An Infinite Sequence
    /// We get as many values as you'd like. In this case there is no memory for past values
    /// but Model is a Sequence with it's iterator ModelIterator.
    /// Difference between  AsyncSequences and Sequences is that it might be taking time for each elements or not.
    func next() -> Int? {
        return Int.random(in: 1...99)
    }
}

//class ModelIterator: IteratorProtocol {
    ///- Note: Step 3 - Next, let's build our own iterator.
    /// It's helpful to think of array when we're picturing a sequence
    /// but a sequence can be infinite and we can consume the sequence when we iterate it.
    /// This is going to help us to think of streams - if you want to persist a stream
    ///  you need to hold on to the elements as they go by.
//    private var count = 5
//    func next() -> Int? {
//        guard count > 0 else { return nil }
//        count -= 1
//        return Int.random(in: 1...99)
//    }
//}
