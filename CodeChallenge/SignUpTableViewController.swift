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
        static let headerViewHeight: CGFloat = 60.0
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
    }
}

extension SignUpTableViewController {

    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0,
           let cell = tableView.dequeueReusableHeaderFooterView(withIdentifier: SignUpViewConstants.headerViewCellId)
            as? HeaderViewCell {
            cell.titleLabel.text = LocalizedStrings.profileCreationDescription
            return cell
        }
        return nil
    }

    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        section == 0 ? SignUpViewConstants.headerViewHeight : 0
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        sections.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch sections[indexPath.section].section {
        case .avatar:
            if let cell = tableView.dequeueReusableCell(withIdentifier: SignUpViewConstants.avatarCellId)
                as? AvatarTableViewCell {
                cell.configure(sections[indexPath.section])
                cell.delegate = self
                return cell
            }
        default:
            if let cell = tableView.dequeueReusableCell(withIdentifier: SignUpViewConstants.dataInputCellId)
                as? DataInputTableViewCell {
                cell.configure(sections[indexPath.section])
                return cell
            }
        }
        return UITableViewCell()
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
}

extension SignUpTableViewController: AvatarTableViewCellDelegate {
    func presentImagePicker() {
        self.cameraManager?.presentOptions()
    }
}
