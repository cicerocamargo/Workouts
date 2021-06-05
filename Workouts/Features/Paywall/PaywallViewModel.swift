import Combine
import Foundation

final class PaywallViewModel: ObservableObject {
    private let sourceWorkout: Workout
    private let trackingService: PaywallTrackingService
    private let didFinishPurchase: (Workout) -> Void

    init(
        sourceWorkout: Workout,
        trackingService: PaywallTrackingService,
        didFinishPurchase: @escaping (Workout) -> Void
    ) {
        self.sourceWorkout = sourceWorkout
        self.trackingService = trackingService
        self.didFinishPurchase = didFinishPurchase
    }

    func handleOnAppear() {
        trackingService.trackPurchase(from: sourceWorkout)
    }

    func buyButtonTapped() {
        isSubscriber = true
        trackingService.trackPurchase(from: sourceWorkout)
        didFinishPurchase(sourceWorkout)
    }
}
