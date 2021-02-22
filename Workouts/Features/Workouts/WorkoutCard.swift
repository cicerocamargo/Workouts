import Foundation
import SwiftUI

struct WorkoutCard: View {
    let workout: Workout

    var body: some View {
        ZStack(alignment: .bottom) {
            Color(.systemGray5)

            Color.black.opacity(0.2)
            textOverlay.padding()
        }
        .frame(height: 200)
        .cornerRadius(8.0)
        .padding(.vertical)
    }

    private var textOverlay: some View {
        VStack(alignment: .leading) {
            Text(workout.title)
                .font(.title2)
                .bold()
                .foregroundColor(.white)
            Text(workout.duration)
                .font(.title3)
                .foregroundColor(.white)
            if workout.isRecommended {
                Text("Recomendado")
                    .font(.caption)
                    .foregroundColor(.white)
                    .padding(4)
                    .background(Color(.systemBlue))
                    .cornerRadius(3.0)
            }
        }
    }
}
