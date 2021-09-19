import Profile
import Payment
import WorkoutsCore
import SwiftUI

struct RootView: View {
    let subscriptionManager: SubscriptionManager = .shared

    var body: some View {
        TabView {
            workoutsTab
            settingsTab
        }
    }

    private var workoutsTab: some View {
        NavigationView {
            WorkoutsView(viewModel: .init(service: .live))
        }
        .tabItem {
            Text("Workouts")
            Image(systemName: "bolt.heart")
        }
    }

    private var settingsTab: some View {
        NavigationView {
            ProfileView(
                subscriptionManager: subscriptionManager,
                makePaywallView: { didFinishPurchase in
                    PaywallView(
                        viewModel: .init(
                            sourceWorkout: nil,
                            trackingService: FirebaseAnalyticsPaywallTrackingService(),
                            subscriptionManager: subscriptionManager,
                            didFinishPurchase: { _ in didFinishPurchase() }
                        )
                    )
                }
            )
        }
        .tabItem {
            Text("Profile")
            Image(systemName: "person.circle")
        }
    }
}

#if DEBUG
struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
    }
}
#endif
