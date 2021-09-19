import SwiftUI

struct PaywallView: View {
    @ObservedObject var viewModel: PaywallViewModel

    var body: some View {
        VStack {
            Text("Start your 7-day trial!").font(.largeTitle)
            Group {
                Text("Pay only ")
                    + Text("$9,90").foregroundColor(.blue)
                    + Text(" (billed monthly) and have access to our workout library with more than 100 workouts!")
            }
            .multilineTextAlignment(.center)
            .font(.headline)
            .padding()
            Button(action: viewModel.buyButtonTapped) {
                Group {
                    if viewModel.isLoading {
                        ProgressView()
                            .progressViewStyle(
                                CircularProgressViewStyle(tint: .white)
                            )
                    } else {
                        Text("Subscribe")
                    }
                }
                .frame(width: 120, height: 40)
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(10)
            }
            .disabled(viewModel.isLoading)
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
                trackingService: .dummy,
                subscriptionManager: .shared,
                didFinishPurchase: { _ in }
            )
        )
    }
}
#endif
