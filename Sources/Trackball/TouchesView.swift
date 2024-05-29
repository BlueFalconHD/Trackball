import SwiftUI

/// An NSViewRepresentable wrapper to integrate AppKitTouchesView with SwiftUI.
@available(macOS 10.15, *)
public struct TouchesView: NSViewRepresentable {
    @Binding public var touches: [Touch]

    public init(touches: Binding<[Touch]>) {
        self._touches = touches
    }

    public func makeNSView(context: Context) -> AppKitTouchesView {
        let view = AppKitTouchesView()
        view.delegate = context.coordinator
        return view
    }

    public func updateNSView(_ nsView: AppKitTouchesView, context: Context) {}

    public func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    public class Coordinator: NSObject, AppKitTouchesViewDelegate {
        let parent: TouchesView

        public init(_ view: TouchesView) {
            self.parent = view
        }

        public func touchesView(_ view: AppKitTouchesView, didUpdateTouchingTouches touches: Set<NSTouch>) {
            parent.touches = touches.map(Touch.init)
        }
    }
}
