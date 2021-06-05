import Core
import WorkoutPlayer
import BrowseWorkouts
import Settings
import Paywall
import Foundation
import SwiftUI

enum ViewComposer {
    static let subscriptionManager = SubscriptionManager()

    static func composeWorkoutsView(
        selectWorkout: @escaping (Workout) -> Void
    ) -> WorkoutsView {
        .init(
            viewModel: WorkoutsViewModel(
                service: .live,
                selectWorkout: selectWorkout
            )
        )
    }

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

    static func composeWorkoutPlayerView(
        workout: Workout
    ) -> WorkoutPlayerView {
        .init(workout: workout)
    }

    static func composeSettingsView() -> SettingsView {
        .init(subscriptionManager: subscriptionManager)
    }
}
