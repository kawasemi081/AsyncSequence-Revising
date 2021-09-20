class AsyncModel: AsyncSequence {
    typealias Element = Int
    
    func makeAsyncIterator() -> AsyncModelIterator {
        AsyncModelIterator()
    }
}
