import SwiftUI

struct PaywallView: View {
    var body: some View {
        VStack {
            Text("Paywall").font(.largeTitle)
            Image(systemName: "dollarsign.circle.fill")
                .resizable()
                .frame(width: 100, height: 100)
            Text("(To be developed)")
        }
    }
}

#if DEBUG
struct PaywallView_Previews: PreviewProvider {
    static var previews: some View {
        PaywallView()
    }
}
#endif
