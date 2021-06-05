import Foundation

protocol PaywallTrackingService {
    func trackView(from workout: Workout)
    func trackPurchase(from workout: Workout)
}

#if DEBUG
struct DummyPaywallTrackingService: PaywallTrackingService {
    func trackView(from workout: Workout) {}
    func trackPurchase(from workout: Workout) {}
}
#endif
