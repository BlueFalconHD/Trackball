import AppKit

/// A custom NSView to handle trackpad touch events.
public final class AppKitTouchesView: NSView {
    public weak var delegate: AppKitTouchesViewDelegate?

    public override init(frame frameRect: NSRect) {
        super.init(frame: frameRect)
        allowedTouchTypes = [.indirect]
        wantsRestingTouches = true
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    /// Handles touch events and notifies the delegate.
    /// - Parameter event: The NSEvent object containing touch information.
    private func handleTouches(with event: NSEvent) {
        let touches = event.touches(matching: .touching, in: self)
        delegate?.touchesView(self, didUpdateTouchingTouches: touches)
    }

    public override func touchesBegan(with event: NSEvent) {
        handleTouches(with: event)
    }

    public override func touchesEnded(with event: NSEvent) {
        handleTouches(with: event)
    }

    public override func touchesMoved(with event: NSEvent) {
        handleTouches(with: event)
    }

    public override func touchesCancelled(with event: NSEvent) {
        handleTouches(with: event)
    }
}
