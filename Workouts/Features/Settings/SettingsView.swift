import SwiftUI

var isSubscriber = false

struct SettingsView: View {
    var body: some View {
        List {
            Toggle(
                "Assinante: ",
                isOn: Binding(get: { isSubscriber }, set: { isSubscriber = $0 })
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
            SettingsView()
        }
    }
}
#endif
