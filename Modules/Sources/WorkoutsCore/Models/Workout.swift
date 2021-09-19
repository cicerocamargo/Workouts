import Foundation

public struct Workout: Decodable, Hashable {
    public init(title: String, duration: String, imageURL: URL?, isRecommended: Bool) {
        self.title = title
        self.duration = duration
        self.imageURL = imageURL
        self.isRecommended = isRecommended
    }

    public let title: String
    public let duration: String
    public let imageURL: URL?
    public let isRecommended: Bool
}

extension Workout: Identifiable {
    public var id: String { title }
}

public extension Workout {
    static let sample = Self(
        title: "GANHE MÚSCULO SEM USAR PESOS",
        duration: "12 semanas",
        imageURL: URL(string: "https://assets.freeletics.com/training_plans/weights_free_gain/key_visual.jpg"),
        isRecommended: true
    )
}
