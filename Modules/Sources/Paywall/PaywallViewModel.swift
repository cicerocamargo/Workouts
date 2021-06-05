import Core
import Combine
import Foundation

public final class PaywallViewModel: ObservableObject {
    private let sourceWorkout: Workout
    private let trackingService: PaywallTrackingService
    private let subscriptionManager: SubscriptionManager
    private let didFinishPurchase: (Workout) -> Void

    public init(
        sourceWorkout: Workout,
        trackingService: PaywallTrackingService,
        subscriptionManager: SubscriptionManager,
        didFinishPurchase: @escaping (Workout) -> Void
    ) {
        self.sourceWorkout = sourceWorkout
        self.trackingService = trackingService
        self.subscriptionManager = subscriptionManager
        self.didFinishPurchase = didFinishPurchase
    }

    func handleOnAppear() {
        trackingService.trackPurchase(sourceWorkout)
    }

    func buyButtonTapped() {
        subscriptionManager.isSubscriber = true
        trackingService.trackPurchase(sourceWorkout)
        didFinishPurchase(sourceWorkout)
    }
}
