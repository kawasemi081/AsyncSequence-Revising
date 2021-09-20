import SwiftUI


struct MainView {
    @State private var value = ""
    @State private var isRunning = false
}

//struct MainView {
//    @State private var value: String = ""
//    let numbers = AsyncModel()
//}

extension MainView: View {
    var body: some View {
        VStack (spacing: 40) {
            Text(value)
            Button("Next",
                   action: nextNumber)
        }
    }
}

extension MainView {
    ///- Note: Step 8
    /// Let's create our AsyncStream - it pauses a second, issues a value using yield and repeats.
    private func nextNumber() {
        Task {
          await startSequence()
        }
    }
    
    private func startSequence() async {
        /// Let's finish with a concrete implementation of AsyncSequence called AsyncStream. It is useful to create a concrete instance.
        let numbers = AsyncStream(Int.self) { [self] continuation in
            self.isRunning = true
            
            Task.detached {
                while self.isRunning {
                    sleep(1)
                    let number = Int.random(in: 1...99)
                    print(number)
                    continuation.yield(number)
                    if number.isMultiple(of: 10) {
                        /// - Important : don't forget `continuation.finish()` so that to update self value
                        ///  because until you call `finish()`,  the Task is never end.
                        self.isRunning = false
                        continuation.finish()
                    }
                }
            }
        }
        
        for await number in numbers {
            self.value = number.description
        }
    }
}

//extension MainView {
//    ///- Note: Step 7
//    private func nextNumber() {
//        Task {
//          await startSequence()
//        }
//    }
//    private func startSequence() async {
//        for await number in numbers {
//            self.value = number.description
//        }
//    }
//}

//struct MainView {
//    @State private var value: String = ""
//    /// mind @StateObect for watching changes of object value
//    @StateObject private var receiver = Receiver()
//    private let notifier = Notifier()
//}

//struct MainView {
//    @State private var value: String = ""
////    private let numbers = Model().makeIterator()
//    /// Sequences for Fast Enumeration
////    private let numbers = Model()
//}

//extension MainView: View {
//    var body: some View {
//        VStack (spacing: 40) {
//            Text(receiver.number.description)
//            Button("Next",
//                   action: nextNumber)
//        }
//    }
//}

//extension MainView {
//    ///- Note: Step 3
//    /// We're about to move to infinitely many values. Let's update MainView to be able to receive them.
//    /// Update nextNumber() to set value to the next number.
//    private func nextNumber() {
//        notifier.postRandomNumber()
//    }
//}



//extension MainView {
    ///- Note: Step 3
    /// We're about to move to infinitely many values. Let's update MainView to be able to receive them.
    /// Update nextNumber() to set value to the next number.
//    private func nextNumber() {
//        if let number = numbers.next() {
//            value = number.description
//        } else {
//            value = "No more"
//        }
//    }
//}

//extension MainView {
    ///- Note: Step1 - Array
    /// First of all, every sequence has an iterator.
    /// `for in {...}` is essentially syntactic sugar for
    /// ```
    /// while let number = iterator.next() {
    ///    print(number.description)
    /// }
    /// ``
//    private func nextNumber() {`
//        for number in numbers {
//            print(number.description)
//        }
//    }
//}

