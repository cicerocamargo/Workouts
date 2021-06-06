import CoreDomain
import Foundation
import WorkoutPlayer

extension ViewComposer {
    static func composeWorkoutPlayerView(
        workout: Workout
    ) -> WorkoutPlayerView {
        .init(workout: workout)
    }
}
