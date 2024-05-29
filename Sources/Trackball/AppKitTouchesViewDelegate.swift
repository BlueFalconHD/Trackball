import AppKit

/// Protocol to handle touch updates from AppKitTouchesView.
public protocol AppKitTouchesViewDelegate: AnyObject {
    /// Called when the touch points are updated.
    /// - Parameters:
    ///   - view: The view that detected the touches.
    ///   - touches: A set of NSTouch objects representing the current touches.
    func touchesView(_ view: AppKitTouchesView, didUpdateTouchingTouches touches: Set<NSTouch>)
}
