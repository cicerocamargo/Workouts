import Core
import SwiftUI

public struct WorkoutsView: View {
    @ObservedObject var viewModel: WorkoutsViewModel

    public init(viewModel: WorkoutsViewModel) {
        self.viewModel = viewModel
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
        .alert(isPresented: .constant(viewModel.state.error != nil)) {
            Alert(
                title: Text("Erro"),
                message: Text("Ocorreu um erro ao carregar os treinos"),
                dismissButton: .default(
                    Text("Tentar novamente"),
                    action: viewModel.reload
                )
            )
        }
        .listStyle(GroupedListStyle())
        .navigationTitle("Treinos")
        .onAppear(perform: viewModel.reload)
    }

    private var workoutsSection: some View {
        Section(header: Text("Escolha seu treino e começe agora mesmo").bold()) {
            ForEach(viewModel.state.workouts) { workout in
                Button(action: { viewModel.selectWorkout(workout) }) {
                    WorkoutCard(workout: workout)
                }
            }
        }
    }
}

#if DEBUG
struct WorkoutsView_Previews: PreviewProvider {
    private struct Preview: View {
        @State var selectedWorkout: Workout?
        let service: WorkoutsService

        var body: some View {
            NavigationView {
                WorkoutsView(
                    viewModel: WorkoutsViewModel(
                        service: service,
                        selectWorkout: { selectedWorkout = $0 }
                    )
                )
            }
            .sheet(item: $selectedWorkout) { workout in
                Text(String(describing: workout))
            }
        }
    }

    static var previews: some View {
        Group {
            Preview(service: .loading)

            Preview(service: .happyPath)

            Preview(service: .happyPath)
                .preferredColorScheme(.dark)

            Preview(service: .failing)
        }
    }
}
#endif
