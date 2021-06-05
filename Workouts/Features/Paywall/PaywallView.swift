import SwiftUI

struct PaywallView: View {
    @ObservedObject var viewModel: PaywallViewModel

    var body: some View {
        VStack {
            Text("Assine já!").font(.largeTitle)
            Group {
                Text("Pague apenas ")
                    + Text("R$17,90 ao mês").foregroundColor(.blue)
                    + Text(" e tenha acesso a todos os nossos treinos!")
            }
            .multilineTextAlignment(.center)
            .font(.headline)
            .padding()
            Button(action: viewModel.buyButtonTapped) {
                Text("Assinar")
                    .padding(.vertical, 8)
                    .padding(.horizontal)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
        }
        .onAppear(perform: viewModel.handleOnAppear)
    }
}

#if DEBUG
struct PaywallView_Previews: PreviewProvider {
    static var previews: some View {
        PaywallView(
            viewModel: .init(
                sourceWorkout: .sample,
                trackingService: DummyPaywallTrackingService(),
                didFinishPurchase: { _ in }
            )
        )
    }
}
#endif
