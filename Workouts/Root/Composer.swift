import BrowseWorkouts
import Foundation
import Payment
import Profile
import WorkoutPlayer
import WorkoutsCore
import SwiftUI

struct Composer {
    static let subscriptionManager = SubscriptionManager.shared

    static func makeWorkoutPlayerView(workout: Workout) -> some View {
        UINavigationController(
            rootViewController: WorkoutPlayerViewController(workout: workout)
        )
        .asSwiftUIView
        .edgesIgnoringSafeArea(.all)
    }

    static func makePaywallView(
        _ didFinishPurchase: @escaping () -> Void
    ) -> PaywallView {
        PaywallView(
            viewModel: .init(
                sourceWorkout: nil,
                trackingService: FirebaseAnalyticsPaywallTrackingService(),
                subscriptionManager: subscriptionManager,
                didFinishPurchase: { _ in didFinishPurchase() }
            )
        )
    }

    static func makeWorkoutDetail(workout: Workout) -> some View {
        WorkoutDetail(
            workout: workout,
            makePaywallView: makePaywallView,
            makeWorkoutPlayerView: makeWorkoutPlayerView
        )
    }

    static func makeWorkoutsView() -> some View {
        WorkoutsView(
            viewModel: .init(service: .live),
            makeWorkoutDetail: makeWorkoutDetail
        )
    }

    static func makeProfileView() -> some View {
        ProfileView(
            subscriptionManager: subscriptionManager,
            makePaywallView: makePaywallView
        )
    }
}
