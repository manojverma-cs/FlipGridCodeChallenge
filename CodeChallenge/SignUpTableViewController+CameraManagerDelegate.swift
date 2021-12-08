//
//  SignUpTableViewController+CameraManagerDelegate.swift
//  CodeChallenge
//
//  Created by MANOJ VERMA on 12/8/21.
//

import UIKit

extension SignUpTableViewController: CameraManagerDelegate {
    func useImage(_ image: UIImage) {
        if let index = sections.firstIndex(where: { $0.section == .avatar }) {
            do {
                try image.pngData()?.write(to: URL(fileURLWithPath: FileManager.avatarImagePath()),
                                           options: Data.WritingOptions.atomic)
                sections[index].value = FileManager.avatarImagePath()
                DispatchQueue.main.async { [weak self] in
                    self?.tableView.reloadData()
                }
            } catch {
                debugPrint(error.localizedDescription)
                DispatchQueue.main.async { [weak self] in
                    guard let `self` = self else { return }
                    UIAlertController.present(withTitle: LocalizedStrings.errorTitle,
                                              withMessage: LocalizedStrings.unknownErrorMessage,
                                              fromPresenter: self)
                }
            }
        }
    }
}
