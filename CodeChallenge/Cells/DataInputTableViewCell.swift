//
//  DataInputTableViewCell.swift
//  CodeChallenge
//
//  Created by MANOJ VERMA on 12/6/21.
//

import UIKit

protocol DataInputTableViewDelegate: class {
    func updateSection(_ dataModel: DataModel)
    func moveToNextResponder(fromTag tag: Int)
    func onSelection(_ dataModel: DataModel)
}

class DataInputTableViewCell: UITableViewCell {

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var textField: UITextField!
    weak var delegate: DataInputTableViewDelegate?
    var dataModel: DataModel?

    override func awakeFromNib() {
        super.awakeFromNib()
        containerView.layer.cornerRadius = 15
        containerView.layer.borderWidth = 1.0
        containerView.layer.borderColor = UIColor.opaqueSeparator.cgColor
        containerView.layer.masksToBounds = true
        textField.delegate = self
        textField.addTarget(self, action: #selector(textFieldValueChanged(_:)), for: .editingChanged)
    }

    /// override prepareForReuse to reset content before reuse
    override func prepareForReuse() {
        super.prepareForReuse()
        textField.text = nil
    }

    /// configure cell from DataModel
    /// - Parameter dataModel: DataModel object to prefill the data
    func configure(_ dataModel: DataModel, tag: Int) {
        self.dataModel = dataModel
        textField.text = dataModel.value
        textField.placeholder = dataModel.section.placeholder
        textField.keyboardType = dataModel.section.keyboardType
        textField.isSecureTextEntry = dataModel.section.isSecureTextEntry
        textField.tag = tag
    }
}

extension DataInputTableViewCell: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        delegate?.moveToNextResponder(fromTag: textField.tag)
        return false
    }

    func textFieldDidBeginEditing(_ textField: UITextField) {
        if let dataModel = dataModel {
            delegate?.onSelection(dataModel)
        }
    }

    @objc func textFieldValueChanged(_ textField: UITextField) {
        dataModel?.value = textField.text ?? ""
        if let dataModel = dataModel {
            delegate?.updateSection(dataModel)
        }
    }
}
