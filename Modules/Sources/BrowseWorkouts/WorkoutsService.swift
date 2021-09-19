import Combine
import Foundation
import WorkoutsCore

public struct WorkoutsService {
    public let loadWorkouts: () -> AnyPublisher<[Workout], Error>

    public init(loadWorkouts: @escaping () -> AnyPublisher<[Workout], Error>) {
        self.loadWorkouts = loadWorkouts
    }
}

#if DEBUG
extension WorkoutsService {
    static let happyPath = Self {
        Just([.sample, .sample, .sample])
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }

    static let loading = Self {
        Empty(completeImmediately: false)
            .eraseToAnyPublisher()
    }
}
#endif
