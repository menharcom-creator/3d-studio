import SwiftUI
import WebKit

@main struct StudioApp: App {
    var body: some Scene { WindowGroup { StudioWebView().ignoresSafeArea(.keyboard).background(Color.black) } }
}

struct StudioWebView: UIViewRepresentable {
    func makeUIView(context: Context) -> WKWebView {
        let c = WKWebViewConfiguration()
        c.allowsInlineMediaPlayback = true
        let w = WKWebView(frame: .zero, configuration: c)
        w.scrollView.bounces = false
        w.scrollView.contentInsetAdjustmentBehavior = .never
        w.isOpaque = false; w.backgroundColor = .black
        if let u = Bundle.main.url(forResource: "index", withExtension: "html", subdirectory: "www") {
            w.loadFileURL(u, allowingReadAccessTo: u.deletingLastPathComponent())
        }
        return w
    }
    func updateUIView(_ v: WKWebView, context: Context) {}
}
