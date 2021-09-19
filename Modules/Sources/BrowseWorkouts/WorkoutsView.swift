import WorkoutsCore
import SwiftUI

public struct WorkoutsView<WorkoutDetail: View>: View {
    @ObservedObject
    var viewModel: WorkoutsViewModel

    let makeWorkoutDetail: (Workout) -> WorkoutDetail

    public init(
        viewModel: WorkoutsViewModel,
        makeWorkoutDetail: @escaping (Workout) -> WorkoutDetail
    ) {
        self.viewModel = viewModel
        self.makeWorkoutDetail = makeWorkoutDetail
    }

    public var body: some View {
        List {
            if viewModel.state.isLoading {
                workoutsSection
                    .redacted(reason: .placeholder)
                    .disabled(true)
            } else {
                workoutsSection
            }
        }
        .listStyle(GroupedListStyle())
        .navigationTitle("Workouts")
        .onAppear(perform: viewModel.reload)
        .background(detailNavLink)
    }

    private var workoutsSection: some View {
        Section(header: Text("Chose your workout:").bold()) {
            ForEach(viewModel.state.workouts) { workout in
                Button(action: { viewModel.selectWorkout(workout) }) {
                    WorkoutCard(workout: workout)
                }
            }
        }
    }

    private var detailNavLink: some View {
        NavigationLink(
            destination: viewModel.state.selected.map(makeWorkoutDetail),
            isActive: .init(
                get: { viewModel.state.selected != nil },
                set: { isActive in
                    if !isActive {
                        viewModel.selectWorkout(nil)
                    }
                }
            ),
            label: EmptyView.init
        )
    }
}

#if DEBUG
struct WorkoutsView_Previews: PreviewProvider {
    private struct Preview: View {
        @ObservedObject var viewModel: WorkoutsViewModel

        init(service: WorkoutsService) {
            viewModel = .init(service: service)
        }

        var body: some View {
            NavigationView {
                WorkoutsView(viewModel: viewModel) { workout in
                    Text(String(describing: workout))
                }
            }
        }
    }

    static var previews: some View {
        Group {
            Preview(service: .loading)

            Preview(service: .happyPath)

            Preview(service: .happyPath)
                .preferredColorScheme(.dark)
        }
    }
}
#endif
