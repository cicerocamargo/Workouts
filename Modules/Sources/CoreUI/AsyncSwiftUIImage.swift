import Foundation
import SwiftUI

public var AsyncSwiftUIImage: (URL?) -> AnyView = { _ in
    #if DEBUG
    AnyView(Image(systemName: "photo").resizable())
    #else
    AnyView(EmptyView())
    #endif
}
