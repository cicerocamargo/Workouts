import SwiftUI

struct RootView: View {
    @State var modal: Modal?
    @State var nextModal: Modal?

    var body: some View {
        TabView {
            workoutsTab
            settingsTab
        }
        .sheet(
            item: $modal,
            onDismiss: {
                modal = nextModal
                nextModal = nil
            },
            content: viewForModal(_:)
        )
    }

    private var workoutsTab: some View {
        NavigationView {
            ViewComposer.composeWorkoutsView(
                selectWorkout: { workout in
                    modal = ViewComposer.subscriptionManager.isSubscriber
                        ? .player(workout)
                        : .paywall(workout)
                }
            )
        }
        .tabItem {
            Text("Treinos")
            Image(systemName: "bolt.heart")
        }
    }

    private var settingsTab: some View {
        NavigationView {
            ViewComposer.composeSettingsView()
        }
        .tabItem {
            Text("Configurações")
            Image(systemName: "gear")
        }
    }
}

// MARK: - Sheets

extension RootView {
    enum Modal: Identifiable {
        case paywall(Workout)
        case player(Workout)

        var id: String {
            switch self {
            case .paywall(let workout):
                return "paywall" + workout.id

            case .player(let workout):
                return "player" + workout.id
            }
        }
    }

    private func viewForModal(_ modal: Modal) -> AnyView {
        switch modal {
        case .paywall(let workout):
            return AnyView(
                ViewComposer.composePaywallView(
                    workout: workout,
                    didFinishPurchase: {
                        self.modal = nil
                        nextModal = .player($0)
                    }
                )
            )

        case .player(let workout):
            return AnyView(
                ViewComposer.composeWorkoutPlayerView(workout: workout)
            )
        }
    }
}

extension Workout: Identifiable {
    var id: String { title }
}

#if DEBUG
struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
    }
}
#endif
