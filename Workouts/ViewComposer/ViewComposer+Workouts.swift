import CoreDomain
import BrowseWorkouts
import Foundation

extension ViewComposer {
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
}
