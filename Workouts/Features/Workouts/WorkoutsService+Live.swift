import Combine
import Foundation
import Moya

extension WorkoutsService {
    static let live = Self {
        Future { promise in
            let provider = MoyaProvider<GetWorkouts>()
            provider.request(GetWorkouts()) { result in
                do {
                    let response = try result.get()
                    let workouts = try response.map([Workout].self)
                    promise(.success(workouts))
                } catch {
                    promise(.failure(error))
                }
            }
        }
        .eraseToAnyPublisher()
    }

}

private struct GetWorkouts: TargetType {
    let baseURL = URL(string: "https://gist.githubusercontent.com")!
    let path = "/cicerocamargo/7b1459e1f103313723112446c4008506/raw/b215cf4b3f0072ac00c67600aaa8b766945c93e1/workouts.json"
    let method: Moya.Method = .get
    let sampleData = Data()
    let task: Task = .requestPlain
    let headers: [String : String]? = nil
}
