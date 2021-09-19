import SwiftUI

struct ProfileView: View {
    @ObservedObject
    var subscriptionManager: SubscriptionManager

    @State
    private var isShowingPaywall = false

    @State
    private var isShowingUnsubscribeAlert = false

    var body: some View {
        List {
            Section {
                HStack {
                    Image(systemName: "person.circle")
                        .resizable()
                        .frame(width: 30, height: 30)

                    VStack(alignment: .leading) {
                        Text("John Doe")
                        Text("john@doe.com").font(.caption2)
                    }
                }
            }

            Section(header: Text("Subscription")) {
                if subscriptionManager.isSubscriber {
                    Text("Your subscription is active.")
                    Button("Cancel Subscription") {
                        isShowingUnsubscribeAlert = true
                    }
                    .foregroundColor(.red)
                } else {
                    Text("Start your free trial now!")
                    Button("Subscribe") {
                        isShowingPaywall = true
                    }
                }
            }
        }
        .listStyle(InsetGroupedListStyle())
        .alert(isPresented: $isShowingUnsubscribeAlert, content: makeUnsubscribeAlert)
        .sheet(isPresented: $isShowingPaywall, content: makePaywallView)
        .navigationTitle("Profile")
        .navigationBarItems(
            trailing: Button("Logout") {}.disabled(true)
        )
    }

    private func makeUnsubscribeAlert() -> Alert {
        Alert(
            title: Text("Confirm"),
            message: Text("Do you really want to cancel your subscription?"),
            primaryButton: .cancel(Text("No")),
            secondaryButton: .destructive(Text("Yes")) {
                subscriptionManager.isSubscriber = false
            }
        )
    }

    private func makePaywallView() -> some View {
        PaywallView(
            viewModel: .init(
                sourceWorkout: nil,
                trackingService: .firebaseAnalytics,
                subscriptionManager: .shared,
                didFinishPurchase: { _ in isShowingPaywall = false }
            )
        )
    }
}

#if DEBUG
struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ProfileView(subscriptionManager: .shared)
        }
    }
}
#endif
