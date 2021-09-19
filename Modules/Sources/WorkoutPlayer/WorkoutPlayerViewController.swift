import WorkoutsCore
import UIKit

public final class WorkoutPlayerViewController: UIViewController {
    private let workout: Workout

    public init(workout: Workout) {
        self.workout = workout
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public override func viewDidLoad() {
        super.viewDidLoad()

        title = "Workout Player"
        
        navigationItem.rightBarButtonItem = .init(
            image: .init(systemName: "xmark"),
            primaryAction: UIAction { [weak self] _ in
                self?.dismiss(animated: true, completion: nil)
            },
            menu: nil
        )

        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 20
        stack.addArrangedSubview({
            let imageView = UIImageView(
                image: .init(systemName: "play.circle.fill")
            )
            NSLayoutConstraint.activate([
                imageView.widthAnchor.constraint(equalToConstant: 100),
                imageView.heightAnchor.constraint(equalToConstant: 100)
            ])
            return imageView
        }())
        stack.addArrangedSubview({
            let label = UILabel()
            label.text = "Under Construction"
            label.font = .preferredFont(forTextStyle: .title1)
            return label
        }())
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.alignment = .center

        view.addSubview(stack)
        NSLayoutConstraint.activate([
            stack.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stack.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
}

#if DEBUG
import SwiftUI

struct WorkoutPlayer_Previews: PreviewProvider {
    static var previews: some View {
        UINavigationController(
            rootViewController: WorkoutPlayerViewController(workout: .sample)
        )
        .asSwiftUIView
        .edgesIgnoringSafeArea(.all)
    }
}
#endif
