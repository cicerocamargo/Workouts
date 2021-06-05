import Foundation

public struct Workout: Decodable {
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
        imageURL: nil,
        isRecommended: true
    )
}
