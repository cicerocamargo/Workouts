import Foundation

struct Workout {
    let title: String
    let duration: String
    let imageURL: URL?
    let isRecommended: Bool
}

extension Workout {
    static let sample = Self(
        title: "GANHE MÚSCULO SEM USAR PESOS",
        duration: "12 semanas",
        imageURL: nil,
        isRecommended: true
    )
}
