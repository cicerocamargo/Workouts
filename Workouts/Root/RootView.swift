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
            WorkoutsView(
                viewModel: WorkoutsViewModel(
                    service: .live,
                    selectWorkout: selectWorkout
                )
            )
        }
        .tabItem {
            Text("Treinos")
            Image(systemName: "bolt.heart")
        }
    }

    private var settingsTab: some View {
        NavigationView {
            SettingsView()
        }
        .tabItem {
            Text("Configurações")
            Image(systemName: "gear")
        }
    }

    private func selectWorkout(workout: Workout) {
        modal = isSubscriber ? .player(workout) : .paywall(workout)
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
                PaywallView(
                    viewModel: .init(
                        sourceWorkout: workout,
                        trackingService: DummyPaywallTrackingService(),
                        didFinishPurchase: {
                            self.modal = nil
                            nextModal = .player($0)
                        }
                    )
                )
            )

        case .player(let workout):
            return AnyView(WorkoutPlayerView(workout: workout))
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
