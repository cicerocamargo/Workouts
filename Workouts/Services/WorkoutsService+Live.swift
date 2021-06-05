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
    let path = "/cicerocamargo/7b1459e1f103313723112446c4008506/raw/b605c401d179fd017b6772625155176f1c993bb0/workouts.json"
    let method: Moya.Method = .get
    let sampleData = Data()
    let task: Task = .requestPlain
    let headers: [String : String]? = nil
}
