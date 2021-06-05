import FirebaseAnalytics
import Foundation

final class FirebasePaywallTrackingService: PaywallTrackingService {
    func trackView(from workout: Workout) {
//        Analytics.logEvent(
//            "Hit Paywall",
//            parameters: ["workoutID": workout.id]
//        )
    }

    func trackPurchase(from workout: Workout) {
//        Analytics.logEvent(
//            "New Subscription",
//            parameters: ["workoutID": workout.id]
//        )
    }
}
