import Core
import FirebaseAnalytics
import Foundation

public extension PaywallTrackingService {
    static let firebaseAnalytics = PaywallTrackingService(
        trackView: { workout in
            Analytics.logEvent(
                "Hit Paywall",
                parameters: ["workoutID": workout.id]
            )
        },
        trackPurchase: { workout in
            Analytics.logEvent(
                "New Subscription",
                parameters: ["workoutID": workout.id]
            )
        }
    )
}
