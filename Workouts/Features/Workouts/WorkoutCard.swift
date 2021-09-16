import Foundation
import Kingfisher
import SwiftUI

struct WorkoutCard: View {
    let workout: Workout

    var body: some View {
        Color(.systemGray2)
            .frame(height: 200)
            .overlay(
                ZStack(alignment: .bottom) {
                    KFImage(workout.imageURL)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                    
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
            Text(workout.title.uppercased())
                .font(.title2)
                .bold()
                .foregroundColor(.white)
            Text(workout.duration)
                .font(.title3)
                .foregroundColor(.white)

            if workout.isRecommended {
                Text("Recommended")
                    .font(.caption)
                    .foregroundColor(.white)
                    .padding(4)
                    .background(Color(.systemBlue))
                    .cornerRadius(3.0)
            }
        }
    }		
}
