import Foundation

public final class SubscriptionManager: ObservableObject {
    public static let shared = SubscriptionManager()

    @Published
    public var isSubscriber: Bool {
        willSet {
            UserDefaults.standard.set(newValue, forKey: "isSubscriber")
        }
    }

    private init() {
        isSubscriber = UserDefaults.standard.bool(forKey: "isSubscriber")
    }
}
