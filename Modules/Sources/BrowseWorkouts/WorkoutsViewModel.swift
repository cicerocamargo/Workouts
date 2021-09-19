import Combine
import Foundation
import SwiftUI
import WorkoutsCore

public final class WorkoutsViewModel: ObservableObject {
    struct State {
        var isLoading = false
        var workouts: [Workout] = []
        var selected: Workout?
    }

    @Published private(set) var state = State()
    
    private let service: WorkoutsService

    public init(service: WorkoutsService) {
        self.service = service
    }
    
    func selectWorkout(_ workout: Workout?) {
        state.selected = workout
    }

    func reload() {
        state = .init(isLoading: true, workouts: [.sample, .sample, .sample])
        service.loadWorkouts()
            .replaceError(with: [])
            .map { State(workouts: $0) }
            .assign(to: &$state)
    }
}
