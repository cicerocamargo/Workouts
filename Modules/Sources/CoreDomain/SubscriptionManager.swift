import Foundation

public final class SubscriptionManager {
    public init() {}

    public var isSubscriber: Bool {
        get { UserDefaults.standard.bool(forKey: "isSubscriber") }
        set { UserDefaults.standard.set(newValue, forKey: "isSubscriber") }
    }
}
