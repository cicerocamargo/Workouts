import CoreDomain
import Foundation
import Settings

extension ViewComposer {
    static func composeSettingsView() -> SettingsView {
        .init(subscriptionManager: subscriptionManager)
    }
}
