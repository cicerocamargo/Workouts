import Combine
import Foundation

public struct WorkoutsService {
    public let loadWorkouts: () -> AnyPublisher<[Workout], Error>
    
    public init(loadWorkouts: @escaping () -> AnyPublisher<[Workout], Error>) {
        self.loadWorkouts = loadWorkouts
    }
}

#if DEBUG
public extension WorkoutsService {
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
