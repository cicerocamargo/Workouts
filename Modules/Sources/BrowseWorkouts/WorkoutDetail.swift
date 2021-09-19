import SwiftUI
import Kingfisher
import WorkoutsCore

public struct WorkoutDetail<PaywallView: View, WorkoutPlayerView: View>: View {
    private let workout: Workout

    private let makePaywallView: (_ didFinishPurchase: @escaping () -> Void) -> PaywallView

    private let makeWorkoutPlayerView: (Workout) -> WorkoutPlayerView

    @State
    private var isShowingPaywall = false

    @State
    private var isShowingPlayer = false

    public init(
        workout: Workout,
        makePaywallView: @escaping (_ didFinishPurchase: @escaping () -> Void) -> PaywallView,
        makeWorkoutPlayerView: @escaping (Workout) -> WorkoutPlayerView
    ) {
        self.workout = workout
        self.makePaywallView = makePaywallView
        self.makeWorkoutPlayerView = makeWorkoutPlayerView
    }

    public var body: some View {
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
            content: {
                makePaywallView { isShowingPaywall = false }
            }
        )
        .fullScreenCover(isPresented: $isShowingPlayer) {
            makeWorkoutPlayerView(workout)
        }
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
}

struct WorkoutDetail_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            WorkoutDetail(
                workout: .sample,
                makePaywallView: { callback in
                    VStack {
                        Text("Paywall View Placeholder")
                        Button(action: {
                            SubscriptionManager.shared.isSubscriber = true
                            callback()
                        }) {
                            Text("Complete Purchase")
                        }
                    }
                },
                makeWorkoutPlayerView: { workout in
                    Text("Playing " + workout.title)
                }
            )
        }
    }
}
