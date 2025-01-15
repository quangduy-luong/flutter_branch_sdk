import Flutter
import UIKit
import BranchSDK

class PasteControlFactory: NSObject, FlutterPlatformViewFactory {
    private var messenger: FlutterBinaryMessenger

    init(messenger: FlutterBinaryMessenger) {
        self.messenger = messenger
        super.init()
    }

    func create(
        withFrame frame: CGRect,
        viewIdentifier viewId: Int64,
        arguments args: Any?
    ) -> FlutterPlatformView {
        return PasteControlNativeView(
            frame: frame,
            viewIdentifier: viewId,
            arguments: args,
            binaryMessenger: messenger
        )
    }
}

class PasteControlNativeView: NSObject, FlutterPlatformView {
    private var _view: UIView

    init(
        frame: CGRect,
        viewIdentifier viewId: Int64,
        arguments args: Any?,
        binaryMessenger messenger: FlutterBinaryMessenger?
    ) {
        _view = UIView()
        super.init()
        createNativeView(view: _view)
    }

    func view() -> UIView {
        return _view
    }

    func createNativeView(view _view: UIView) {
        if #available(iOS 16.0, *) {
            // Setup `UIPasteControl` configuration
            let pcConfig = UIPasteControl.Configuration()
            pcConfig.baseBackgroundColor = UIColor.blue
            pcConfig.displayMode = UIPasteControl.DisplayMode.iconAndLabel

            // Create frame and button
            let frameDimension = CGRect(x: 0, y: 0, width: 80, height: 40)
            let bc = BranchPasteControl(frame: frameDimension, andConfiguration: pcConfig)

            // Add `BranchPasteControl()` button to view
            _view.addSubview(bc)
        } else {
            // Fallback on earlier versions
            let label = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 40))
            label.text = "This feature is only available on iOS 16+"
            _view.addSubview(label)
        }
    }
}