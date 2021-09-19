import Foundation

final class SubscriptionManager: ObservableObject {
    static let shared = SubscriptionManager()

    @Published
    var isSubscriber: Bool {
        willSet {
            UserDefaults.standard.set(newValue, forKey: "isSubscriber")
        }
    }

    private init() {
        isSubscriber = UserDefaults.standard.bool(forKey: "isSubscriber")
    }
}
