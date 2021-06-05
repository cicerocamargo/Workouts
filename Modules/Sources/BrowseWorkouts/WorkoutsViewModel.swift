import Core
import Combine
import Foundation

public final class WorkoutsViewModel: ObservableObject {
    @Published private(set) var state: WorkoutsViewState = .init()
    private var cancellables = Set<AnyCancellable>()
    private let service: WorkoutsService

    let selectWorkout: (Workout) -> Void

    public init(service: WorkoutsService, selectWorkout: @escaping (Workout) -> Void) {
        self.service = service
        self.selectWorkout = selectWorkout
    }

    func reload() {
        state = .init(isLoading: true, workouts: [.sample, .sample, .sample])
        service.loadWorkouts().sink(
            receiveCompletion: { [weak self] completion in
                self?.state.isLoading = false
                if case .failure(let error) = completion {
                    self?.state.error = error
                    self?.state.workouts = []
                }
            },
            receiveValue: { [weak self] workouts in
                self?.state.workouts = workouts
            }
        )
        .store(in: &cancellables)
    }
}
