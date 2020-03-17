/*
See LICENSE folder for this sample’s licensing information.

Abstract:
A view controller for editing saved text. Allows cancellation and saving with standard bar button items, as well as with the pull to dismiss gesture.
*/

import UIKit

protocol EditViewControllerDelegate: class {
    
    func editViewControllerDidCancel(_ editViewController: EditViewController)
    func editViewControllerDidFinish(_ editViewController: EditViewController)
}

class EditViewController: UIViewController, UIAdaptivePresentationControllerDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    weak var delegate: EditViewControllerDelegate?
    @IBOutlet weak var cancelButton: UIBarButtonItem!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    @IBAction func cancel(_ sender: Any) {
        delegate?.editViewControllerDidCancel(self)
    }
    @IBAction func save(_ sender: Any) {
        delegate?.editViewControllerDidFinish(self)
    }
    
    override func viewDidLoad() {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.dataSource = self
    }
}

extension EditViewController {

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("debug0000 : touchesBegan")
        for touch in touches {
            touch.view?.restorationIdentifier
            disableDismissalRecognizers(fetchedIdentifier: touch.view?.restorationIdentifier)
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("debug0000 : touchesEnded")
        enableDismissalRecognizers()
    }

}

private extension EditViewController {

    func disableDismissalRecognizers(fetchedIdentifier: String?) {

        if let identifier = fetchedIdentifier, identifier == "blueBackView" {
        navigationController?.presentationController?.presentedView?.gestureRecognizers?.forEach {
                $0.isEnabled = false
            }
        }
    }
    
    func enableDismissalRecognizers() {
        navigationController?.presentationController?.presentedView?.gestureRecognizers?.forEach {
            $0.isEnabled = true
        }
    }
}

extension EditViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")!
        cell.textLabel?.text = "\(indexPath.row)"
        return cell
    }
}
