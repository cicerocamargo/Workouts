import SwiftUI

final class SubscriptionManager {
    var isSubscriber: Bool {
        get { UserDefaults.standard.bool(forKey: "isSubscriber") }
        set { UserDefaults.standard.set(newValue, forKey: "isSubscriber") }
    }
}

struct SettingsView: View {
    let subscriptionManager: SubscriptionManager

    var body: some View {
        List {
            Toggle(
                "Assinante: ",
                isOn: Binding(
                    get: { subscriptionManager.isSubscriber },
                    set: { subscriptionManager.isSubscriber = $0 }
                )
            )
        }
        .listStyle(InsetGroupedListStyle())
        .navigationTitle("Configurações")
    }
}

#if DEBUG
struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            SettingsView(subscriptionManager: .init())
        }
    }
}
#endif
