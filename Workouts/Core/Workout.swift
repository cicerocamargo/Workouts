import Foundation

struct Workout: Decodable, Hashable {
    let title: String
    let duration: String
    let imageURL: URL?
    let isRecommended: Bool
}

extension Workout: Identifiable {
    var id: String { title }
}

extension Workout {
    static let sample = Self(
        title: "GANHE MÚSCULO SEM USAR PESOS",
        duration: "12 semanas",
        imageURL: nil,
        isRecommended: true
    )
}
