import UIKit

class AddAlertViewController: UIViewController{
    var pickedDate: ((_ date: Date) -> Void)?
    
    @IBOutlet weak var datePicker: UIDatePicker!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func dismissButtonAction(_ sender: UIBarButtonItem) {
        
    }
    @IBAction func saveButtonAction(_ sender: UIBarButtonItem) {
        pickedDate?(datePicker.date)
        self.dismiss(animated: true)
    }
}
