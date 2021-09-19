import Combine
import Foundation
import WorkoutsCore

struct WorkoutsService {
    let loadWorkouts: () -> AnyPublisher<[Workout], Error>
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
