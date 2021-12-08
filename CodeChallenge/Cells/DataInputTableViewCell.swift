//
//  DataInputTableViewCell.swift
//  CodeChallenge
//
//  Created by MANOJ VERMA on 12/6/21.
//

import UIKit

class DataInputTableViewCell: UITableViewCell {

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var textField: UITextField!

    override func awakeFromNib() {
        super.awakeFromNib()
        containerView.layer.cornerRadius = 15
        containerView.layer.borderWidth = 1.0
        containerView.layer.borderColor = UIColor.opaqueSeparator.cgColor
        containerView.layer.masksToBounds = true
        textField.delegate = self
    }

    /// override prepareForReuse to reset content before reuse
    override func prepareForReuse() {
        super.prepareForReuse()
        textField.text = nil
    }

    /// configure cell from DataModel
    /// - Parameter dataModel: DataModel object to prefill the data
    func configure(_ dataModel: DataModel) {
        textField.placeholder = dataModel.section.placeholder
    }
}

extension DataInputTableViewCell: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.resignFirstResponder()
    }
}
