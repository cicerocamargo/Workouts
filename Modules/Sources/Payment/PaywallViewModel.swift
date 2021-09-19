import Combine
import Foundation
import WorkoutsCore

public final class PaywallViewModel: ObservableObject {
    private let sourceWorkout: Workout?
    private let trackingService: PaywallTrackingService
    private let subscriptionManager: SubscriptionManager
    private let didFinishPurchase: (Workout?) -> Void

    @Published private(set) var isLoading = false

    public init(
        sourceWorkout: Workout?,
        trackingService: PaywallTrackingService,
        subscriptionManager: SubscriptionManager,
        didFinishPurchase: @escaping (Workout?) -> Void
    ) {
        self.sourceWorkout = sourceWorkout
        self.trackingService = trackingService
        self.subscriptionManager = subscriptionManager
        self.didFinishPurchase = didFinishPurchase
    }

    func handleOnAppear() {
        trackingService.trackView(workout: sourceWorkout)
    }

    func buyButtonTapped() {
        isLoading = true

        // add a delay to pretend we're making a real request
        DispatchQueue.main.asyncAfter(
            deadline: .now() + 1,
            execute: finishSubscription
        )
    }

    private func finishSubscription() {
        isLoading = false
        subscriptionManager.isSubscriber = true
        trackingService.trackPurchase(workout: sourceWorkout)
        didFinishPurchase(sourceWorkout)
    }
}
