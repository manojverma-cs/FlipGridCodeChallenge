//
//  SignUpTableViewController.swift
//  CodeChallenge
//
//  Created by MANOJ VERMA on 12/6/21.
//

import UIKit

class SignUpTableViewController: UITableViewController {

    var sections: [DataModel] = [DataModel(section: .avatar, value: ""),
                                 DataModel(section: .firstName, value: ""),
                                 DataModel(section: .email, value: ""),
                                 DataModel(section: .password, value: ""),
                                 DataModel(section: .website, value: "")]

    var cameraManager: CameraManager?

    struct SignUpViewConstants {
        static let avatarCellId = "AvatarTableViewCell"
        static let dataInputCellId = "DataInputTableViewCell"
        static let headerViewCellId = "HeaderViewCell"
        static let footerViewCellId = "FooterViewCell"
        static let headerViewHeight: CGFloat = 60.0
        static let footerViewHeight: CGFloat = 100.0
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = LocalizedStrings.profileCreationTitle
        setupTableView()
        cameraManager = CameraManager(withPresenter: self)
        cameraManager?.delegate = self
    }

    /// setup TableView and register required cells
    func setupTableView() {
        tableView.tableFooterView = UIView()
        tableView.register(UINib(nibName: SignUpViewConstants.headerViewCellId,
                                 bundle: nil),
                           forHeaderFooterViewReuseIdentifier: SignUpViewConstants.headerViewCellId)
        tableView.register(UINib(nibName: SignUpViewConstants.footerViewCellId,
                                 bundle: nil),
                           forHeaderFooterViewReuseIdentifier: SignUpViewConstants.footerViewCellId)
    }
}

extension SignUpTableViewController: AvatarTableViewCellDelegate {
    func presentImagePicker() {
        self.cameraManager?.presentOptions()
    }
}

extension SignUpTableViewController: FooterViewDelegate {
    func submitButtonAction() {
        for dataModel in sections {
            if dataModel.section.isMandatory && dataModel.value.isEmpty {
                UIAlertController.present(withTitle: LocalizedStrings.errorTitle,
                                          withMessage: dataModel.section.emptyMessage,
                                          fromPresenter: self)
                return
            }
        }
    }
}

extension SignUpTableViewController: DataInputTableViewDelegate {
    func updateSection(_ dataModel: DataModel) {
        if let index = sections.firstIndex(where: { $0.section == dataModel.section }) {
            sections[index].value = dataModel.value
        }
    }

    func moveToNextResponder(fromTag tag: Int) {
        if let cell = tableView.cellForRow(at: IndexPath(row: 0, section: tag + 1)) as? DataInputTableViewCell {
            cell.textField.becomeFirstResponder()
        } else {
            view.endEditing(true)
        }
    }
}
