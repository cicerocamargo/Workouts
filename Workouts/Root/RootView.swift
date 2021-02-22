import SwiftUI

struct RootView: View {
    enum Modal: Identifiable {
        case paywall
        case player(Workout)

        var id: String {
            switch self {
            case .paywall:
                return "paywall"

            case .player(let workout):
                return workout.id
            }
        }
    }

    @State var modal: Modal?

    var body: some View {
        TabView {
            NavigationView {
                WorkoutsView(
                    viewModel:
                        WorkoutsViewModel(
                            service: .live,
                            selectWorkout: selectWorkout
                        )
                )
            }
            .tabItem {
                Text("Treinos")
                Image(systemName: "bolt.heart")
            }

            NavigationView {
                SettingsView()
            }
            .tabItem {
                Text("Configurações")
                Image(systemName: "gear")
            }
        }
        .sheet(item: $modal) { modal -> AnyView in
            switch modal {
            case .paywall:
                return AnyView(PaywallView())

            case .player(let workout):
                return AnyView(WorkoutPlayerView(workout: workout))
            }
        }
    }

    private func selectWorkout(workout: Workout) {
        modal = isSubscriber ? .player(workout) : .paywall
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
