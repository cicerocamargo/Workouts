import CoreDomain
import CoreUI
import Foundation
import SwiftUI

struct WorkoutCard: View {
    let workout: Workout

    var body: some View {
        Color(.systemGray5)
            .frame(height: 200)
            .overlay(
                ZStack(alignment: .bottom) {
                    AsyncSwiftUIImage(workout.imageURL)
                        .aspectRatio(contentMode: .fill)

                    Color.black.opacity(0.2)
                    
                    HStack {
                        textOverlay
                        Spacer()
                    }
                    .padding()
                }
            )
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
