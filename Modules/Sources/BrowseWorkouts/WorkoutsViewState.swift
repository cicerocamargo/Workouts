import CoreDomain
import Foundation

struct WorkoutsViewState {
    var isLoading = false
    var workouts: [Workout] = []
    var error: Error?
}
