

import UIKit
import Intents
import IntentsUI

public class DonateViewController: UIViewController {
    public var intent: INIntent?
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        addSiriButton(to: view)
    }
    
    private func addSiriButton(to view: UIView) {
        #if !targetEnvironment(macCatalyst)
        let button = INUIAddVoiceShortcutButton(style: .automaticOutline)
        button.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(button)
        view.centerYAnchor.constraint(equalTo: button.centerYAnchor).isActive = true
        view.leadingAnchor.constraint(equalTo: button.leadingAnchor).isActive = true
        view.trailingAnchor.constraint(equalTo: button.trailingAnchor).isActive = true
        setupShortcut(to: button)
        button.addTarget(self, action: #selector(addToSiri(_:)), for: .touchUpInside)
        #endif
    }
    
    private func setupShortcut(to button: INUIAddVoiceShortcutButton?) {
        if let intent = intent {
            button?.shortcut = INShortcut(intent: intent)
            button?.delegate = self
        }
    }
    
    @objc
    func addToSiri(_ sender: Any) {
        if let shortcut = INShortcut(intent: MoneyTransferIntent()) {
            let viewController = INUIAddVoiceShortcutViewController(shortcut: shortcut)
            viewController.modalPresentationStyle = UIModalPresentationStyle.formSheet
            viewController.delegate = self // Object conforming to `INUIAddVoiceShortcutViewControllerDelegate`.
            present(viewController, animated: true, completion: nil)
        }
    }
}

extension DonateViewController: INUIAddVoiceShortcutViewControllerDelegate {
    public func addVoiceShortcutViewController(_ controller: INUIAddVoiceShortcutViewController, didFinishWith voiceShortcut: INVoiceShortcut?, error: Error?) {
        controller.dismiss(animated: true, completion: nil)
    }
    
    public func addVoiceShortcutViewControllerDidCancel(_ controller: INUIAddVoiceShortcutViewController) {
        controller.dismiss(animated: true, completion: nil)
    }
}

extension DonateViewController: INUIAddVoiceShortcutButtonDelegate {
    public func present(_ addVoiceShortcutViewController: INUIAddVoiceShortcutViewController, for addVoiceShortcutButton: INUIAddVoiceShortcutButton) {
        addVoiceShortcutViewController.delegate = self
        addVoiceShortcutViewController.modalPresentationStyle = .formSheet
        present(addVoiceShortcutViewController, animated: true, completion: nil)
    }
    
    public func present(_ editVoiceShortcutViewController: INUIEditVoiceShortcutViewController, for addVoiceShortcutButton: INUIAddVoiceShortcutButton) {
        editVoiceShortcutViewController.delegate = self
        editVoiceShortcutViewController.modalPresentationStyle = .formSheet
        present(editVoiceShortcutViewController, animated: true, completion: nil)
    }
}

extension DonateViewController: INUIEditVoiceShortcutViewControllerDelegate {
    public func editVoiceShortcutViewController(_ controller: INUIEditVoiceShortcutViewController, didUpdate voiceShortcut: INVoiceShortcut?, error: Error?) {
        controller.dismiss(animated: true, completion: nil)
    }
    
    public func editVoiceShortcutViewController(_ controller: INUIEditVoiceShortcutViewController, didDeleteVoiceShortcutWithIdentifier deletedVoiceShortcutIdentifier: UUID) {
        controller.dismiss(animated: true, completion: nil)
    }
    
    public func editVoiceShortcutViewControllerDidCancel(_ controller: INUIEditVoiceShortcutViewController) {
        controller.dismiss(animated: true, completion: nil)
    }
}
