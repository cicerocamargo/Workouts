import SwiftUI
import Kingfisher
import WorkoutsCore
import WorkoutPlayer

struct WorkoutDetail: View {
    let workout: Workout

    @State
    private var isShowingPaywall = false

    @State
    private var isShowingPlayer = false

    var body: some View {
        VStack(alignment: .leading) {
            Spacer()
            Text(workout.title.uppercased())
                .font(.title2)
                .bold()
                .foregroundColor(.white)
            Text(workout.duration)
                .font(.title3)
                .foregroundColor(.white)
        }
        .padding()
        .frame(
            minWidth: 0,
            maxWidth: .infinity,
            minHeight: 0,
            maxHeight: .infinity,
            alignment: .topLeading
        )
        .background(background)
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarItems(trailing: startButton)
        .sheet(
            isPresented: $isShowingPaywall,
            onDismiss: {
                if SubscriptionManager.shared.isSubscriber {
                    isShowingPlayer = true
                }
            },
            content: makePaywallView
        )
        .fullScreenCover(isPresented: $isShowingPlayer, content: makeWorkoutPlayer)
    }

    private var background: some View {
        ZStack {
            KFImage(workout.imageURL)
                .resizable()
                .aspectRatio(contentMode: .fill)

            Color.black.opacity(0.2)
        }
    }

    private var startButton: some View {
        Button(
            action: {
                if SubscriptionManager.shared.isSubscriber {
                    isShowingPlayer = true
                } else {
                    isShowingPaywall = true
                }
            },
            label: { Text("Start") }
        )
    }

    private func makePaywallView() -> some View {
        PaywallView(
            viewModel: .init(
                sourceWorkout: workout,
                trackingService: .firebaseAnalytics,
                subscriptionManager: .shared,
                didFinishPurchase: { _ in isShowingPaywall = false }
            )
        )
    }

    private func makeWorkoutPlayer() -> some View {
        UINavigationController(
            rootViewController: WorkoutPlayerViewController(workout: workout)
        )
        .asSwiftUIView
        .edgesIgnoringSafeArea(.all)
    }
}

struct WorkoutDetail_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            WorkoutDetail(workout: .sample)
        }
    }
}
