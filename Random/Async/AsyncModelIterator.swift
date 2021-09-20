import Foundation

class AsyncModelIterator: AsyncIteratorProtocol {
    ///- Note: Step 7
    /// As you might expect, an AsyncSequence must be able to make an AsyncIterator and an AsyncIterator must have a next() method.
    func next() async -> Int? {
        sleep(1)
        return Int.random(in: 1...99)
    }
}
