import Foundation

@MainActor
class Receiver: ObservableObject {
    @Published var number: Int = 0
    
    init() {
        Task {
            await registerForNotification()
        }
    }
}

extension Receiver {
    ///- Note: Step 6
    /// Higher-Order Functions
    /// We can simplify our for loop by taking advantage of some of the higher order functions for AsyncSequence.
    func registerForNotification() async {
        let numbers = NotificationCenter.default
            .notifications(named: randomNumberNotification, // stream of notifications
                           object: nil)
            .compactMap { notification in
                notification.object as? Notifier // stream of Notifier
            }
            .map(\.number) // stream of Int
        
        for await number in numbers {
            /// - Note: You can break out of the for loop when a condition is met.
            /// - We can also use continue to skip values.
//            if number.isMultiple(of: 2) {
//                print(number)
//                continue
//            }
            
            /// or  when our number is a multiple of 10.
//            if number.isMultiple(of: 10) {
//                print(number)
//                break
//            }
            self.number = number
        }
    }
}

//extension Receiver {
//    ///- Note: Step 5
//    /// More Async
//    /// registerForNotification runs on the main actor.
////    @MainActor
//    func registerForNotification() async {
//        let notifications = NotificationCenter.default
//            .notifications(named: randomNumberNotification, // stream of notifications
//                           object: nil)
//        // - Note: Notifications is an AsyncSequence. We have no idea when the next element is coming so we use a variant of for in.
//        for await notification in notifications {
//            if let object = notification.object as? Notifier {
//                self.number = object.number
//            }
//        }
//    }
//}


//extension Receiver {
    ///- Note: Step 5
    /// In iOS15, There's a new type inside of NotificationCenter named Notifications.
    /// Notifications conforms to AsyncSequence.
    /// Instead of adding an observer we're returning notifications with a name for an object.
    /// In our previous code we passed in a closure of what we wanted to do with each notification we receive.
    /// For now we're going to do the exact same thing with each notification - we get its object if it exists,
    ///  check its type, and if it's the right type we assign it's number's description.
    ///
    /// We use a version of fast enumeration on our notifications
//    func registerForNotification() {
//        NotificationCenter.default
//            .addObserver(forName: randomNumberNotification, object: nil, queue: nil) { notification in
//                if let object = notification.object as? Notifier {
//                    self.number = object.number
//                }
//        }
//    }
//}


//extension Receiver {
    ///- Note: Step 4
    /// We're registering to receive our randomNumberNotifications from notifier.
    /// Each time we get a notification, we'll check that it includes an object (it should) and check that its object is a Notifier (it should be).
    ///  If so, we'll extract the Int as number and set it to the number property that is republished.
//    func registerForNotification() {
//        NotificationCenter.default
//            .addObserver(forName: randomNumberNotification, object: nil, queue: nil) { notification in
//                if let object = notification.object as? Notifier {
//                    self.number = object.number
//                }
//        }
//    }
//}
