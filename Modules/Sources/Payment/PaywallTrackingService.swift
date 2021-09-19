import WorkoutsCore
import Foundation

public protocol PaywallTrackingService {
    func trackView(workout: Workout?)
    func trackPurchase(workout: Workout?)
}

#if DEBUG
struct DummyPaywallTrackingService: PaywallTrackingService {
    func trackView(workout: Workout?) {}
    func trackPurchase(workout: Workout?) {}
}
#endif
