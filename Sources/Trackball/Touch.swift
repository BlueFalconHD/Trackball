import AppKit
import SwiftUI

/// Represents a touch point on the trackpad.
public struct Touch: Identifiable {
    public let id: Int
    public let normalizedX: CGFloat
    public let normalizedY: CGFloat
    public let force: CGFloat

    /// Initializes a Touch object from an NSTouch object.
    /// - Parameter nsTouch: The NSTouch object.
    public init(_ nsTouch: NSTouch) {
        self.id = nsTouch.hash
        self.normalizedX = nsTouch.normalizedPosition.x
        self.normalizedY = 1.0 - nsTouch.normalizedPosition.y
        self.force = nsTouch.force
    }
}
