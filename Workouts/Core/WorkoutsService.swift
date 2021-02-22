import Combine
import Foundation

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

    static let failing = Self {
        Fail(
            outputType: [Workout].self,
            failure: NSError(domain: "WorkoutsService", code: -1, userInfo: nil)
        )
        .eraseToAnyPublisher()
    }

    static let loading = Self {
        Empty(completeImmediately: false)
            .eraseToAnyPublisher()
    }
}
#endif
