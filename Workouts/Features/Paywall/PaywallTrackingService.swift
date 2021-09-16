import Foundation

struct PaywallTrackingService {
    var trackView: (Workout?) -> Void
    var trackPurchase: (Workout?) -> Void
}

#if DEBUG
extension PaywallTrackingService {
    static let dummy = Self(trackView: { _ in }, trackPurchase: { _ in })
}
#endif
