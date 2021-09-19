import WorkoutsCore
import SwiftUI

public struct ProfileView<PaywallView: View>: View {
    @ObservedObject
    private var subscriptionManager: SubscriptionManager

    @State
    private var isShowingPaywall = false

    @State
    private var isShowingUnsubscribeAlert = false

    private let makePaywallView: (_ didFinishPurchase: @escaping () -> Void) -> PaywallView

    public init(
        subscriptionManager: SubscriptionManager,
        makePaywallView: @escaping (_ didFinishPurchase: @escaping () -> Void) -> PaywallView
    ) {
        self.subscriptionManager = subscriptionManager
        self.makePaywallView = makePaywallView
    }

    public var body: some View {
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
        .sheet(isPresented: $isShowingPaywall) {
            makePaywallView { isShowingPaywall = false }
        }
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
}

#if DEBUG
struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ProfileView(
                subscriptionManager: .shared,
                makePaywallView: { callback in
                    VStack {
                        Text("Paywall View Placeholder")
                        Button(action: callback) {
                            Text("Complete Purchase")
                        }
                    }
                }
            )
        }
    }
}
#endif
