import UIKit

var age : Int = -1
var name : String = ""
var type : String = ""


class AddDogTableViewCell: UITableViewCell, UIPickerViewDelegate, UIPickerViewDataSource, UITextViewDelegate {

    var addDogViewController : AddDogViewController? 
    
    @IBOutlet weak var TextView: UITextView!
    @IBOutlet weak var PickerView: UIPickerView!
    
    func canSubmitt() -> Bool {
        return age != -1 && name != "" && type != ""
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        PickerView.delegate = self
        PickerView.dataSource = self
        TextView.delegate = self
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    // MARK: - Picker View Methods
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 31
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return String(row)
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        age = row
        // reload the second section in table view
        addDogViewController?.TableView.reloadRows(at: [IndexPath(row: 0, section: 1)], with: .automatic)
        if (canSubmitt()) {
            addDogViewController?.DoneButton.isEnabled = true
        }
    }

    // MARK: - Text View Methods
    func textViewDidBeginEditing(_ textView: UITextView) {
        if (textView.textColor == UIColor.gray) {
            textView.text = ""
            textView.textColor = UIColor.black
        }
    }
    
    func textViewDidChange(_ textView: UITextView) {
        if (textView.text != "") {
            if (textView.tag == 0) {
                name = textView.text
            } else {
                type = textView.text
            }
            if (canSubmitt()) {
                addDogViewController?.DoneButton.isEnabled = true
            } else {
                addDogViewController?.DoneButton.isEnabled = false
            }
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if (textView.text == "") {
            if (textView.tag == 0) {
                textView.text = "Name"
            } else {
                textView.text = "Type"
            }
            textView.textColor = UIColor.gray
        }
    }
}

