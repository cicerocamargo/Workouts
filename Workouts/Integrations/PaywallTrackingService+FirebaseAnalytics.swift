import FirebaseAnalytics
import Foundation
import Payment
import WorkoutsCore

struct FirebaseAnalyticsPaywallTrackingService: PaywallTrackingService {
    func trackView(workout: Workout?) {
        Analytics.logEvent(
            "Hit Paywall",
            parameters: ["workoutID": workout?.id ?? "no workout"]
        )
    }

    func trackPurchase(workout: Workout?) {
        Analytics.logEvent(
            "New Subscription",
            parameters: ["workoutID": workout?.id ?? "no workout"]
        )
    }
}
