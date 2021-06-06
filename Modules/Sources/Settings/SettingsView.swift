import CoreDomain
import SwiftUI

public struct SettingsView: View {
    let subscriptionManager: SubscriptionManager
    
    public init(subscriptionManager: SubscriptionManager) {
        self.subscriptionManager = subscriptionManager
    }

    public var body: some View {
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
