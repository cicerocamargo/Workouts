import Foundation
import SwiftUI

enum ViewComposer {
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
                trackingService: FirebasePaywallTrackingService(),
                didFinishPurchase: didFinishPurchase
            )
        )
    }

    static func composeWorkoutPlayerView(
        workout: Workout
    ) -> WorkoutPlayerView {
        .init(workout: workout)
    }
}
