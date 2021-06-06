import CoreDomain
import Foundation
import Paywall

extension ViewComposer {
    static func composePaywallView(
        workout: Workout,
        didFinishPurchase: @escaping (Workout) -> Void
    ) -> PaywallView {
        .init(
            viewModel: .init(
                sourceWorkout: workout,
                trackingService: .firebaseAnalytics,
                subscriptionManager: subscriptionManager,
                didFinishPurchase: didFinishPurchase
            )
        )
    }
}
