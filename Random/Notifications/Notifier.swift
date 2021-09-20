import Foundation

let randomNumberNotification = Notification.Name("randomNumberNotification")

class Notifier {
    ///- Note: Step4
    /// There's a class named Notifier in the Notifications folder.
    /// It has a notification name and a method we can call to pick a random number and post a notification containing that number.
    var number: Int = 0
    
    func postRandomNumber() {
        number = Int.random(in: 1...99)
        NotificationCenter.default
            .post(name: randomNumberNotification,
                  object: self)
    }
}
