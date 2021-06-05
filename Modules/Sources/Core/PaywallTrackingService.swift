import Foundation

public struct PaywallTrackingService {
    public var trackView: (Workout) -> Void
    public var trackPurchase: (Workout) -> Void
    
    public init(
        trackView: @escaping (Workout) -> Void,
        trackPurchase: @escaping (Workout) -> Void
    ) {
        self.trackView = trackView
        self.trackPurchase = trackPurchase
    }
}

#if DEBUG
public extension PaywallTrackingService {
    static let dummy = Self(trackView: { _ in}, trackPurchase: { _ in })
}
#endif
