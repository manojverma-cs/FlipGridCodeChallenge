//
//  CameraManager.swift
//  CodeChallenge
//
//  Created by MANOJ VERMA on 12/8/21.
//

import UIKit
import AVFoundation
import Photos

protocol CameraManagerDelegate: class {
    func useImage(_ image: UIImage)
}

class CameraManager: NSObject {

    let presenter: UIViewController
    weak var delegate: CameraManagerDelegate?

    init(withPresenter presenter: UIViewController) {
        self.presenter = presenter
    }

    /// Defines if camera permission is undetermined
    /// - Returns: true if the permission is undetermined
    private func isPhotoLibraryPermissionUndetermined() -> Bool {
        PHPhotoLibrary.authorizationStatus() == .notDetermined
    }

    /// Camera Permission Granted Check
    /// - Returns: true if the  permission is granted
    private func isPhotoLibraryPermissionGranted() -> Bool {
        PHPhotoLibrary.authorizationStatus() == .authorized
    }

    /// Camera Permission Denied Check
    /// - Returns: true if the  permission is denied
    private func isPhotoLibraryPermissionDenied() -> Bool {
        PHPhotoLibrary.authorizationStatus() == .denied
    }

    /// Defines if camera permission is undetermined
    /// - Returns: true if the permission is undetermined
    private func isCameraPermissionUndetermined() -> Bool {
        AVCaptureDevice.authorizationStatus(for: AVMediaType.video) == .notDetermined
    }

    /// Camera Permission Granted Check
    /// - Returns: true if the  permission is granted
    private func isCameraPermissionGranted() -> Bool {
        AVCaptureDevice.authorizationStatus(for: AVMediaType.video) == .authorized
    }

    /// Camera Permission Denied Check
    /// - Returns: true if the  permission is Denied
    private func isCameraPermissionDenied() -> Bool {
        AVCaptureDevice.authorizationStatus(for: AVMediaType.video) == .denied
    }

    /// Camera Permission Ask
    /// - Parameter completionHandler: Completion notify for camera "notDetermined"
    /// - Returns: notDetermined, authorizedWhenInUse
    private func requestCameraAuthorization(completionHandler: ((_ success: Bool) -> Void)? = nil) {
        if isCameraPermissionUndetermined() {
            AVCaptureDevice.requestAccess(for: AVMediaType.video) { granted in
                completionHandler?(granted)
            }
        } else if isCameraPermissionGranted() {
            completionHandler?(true)
        } else if isCameraPermissionDenied() {
            presentCameraAlertForSettings()
        }
    }

    /// Camera Permission Ask
    /// - Parameter completionHandler: Completion notify for camera "notDetermined"
    /// - Returns: notDetermined, authorizedWhenInUse
    private func requestPhotoLibraryAuthorization(completionHandler: ((_ success: Bool) -> Void)? = nil) {
        if isPhotoLibraryPermissionUndetermined() {
            PHPhotoLibrary.requestAuthorization { status in
                if #available(iOS 14, *) {
                    completionHandler?(status == .authorized || status == .limited)
                } else {
                    completionHandler?(status == .authorized)
                }
            }
        } else if isPhotoLibraryPermissionGranted() {
            completionHandler?(true)
        } else if isPhotoLibraryPermissionDenied() {
            presentGalleryAlertForSettings()
        }
    }

    /// present alert for settings
    private func presentCameraAlertForSettings() {
        let alertController = UIAlertController(title: nil,
                                                message: LocalizedStrings.cameraPermissionMessage,
                                                preferredStyle: .alert)
        let settingsAction = UIAlertAction(title: LocalizedStrings.settingsTitle,
                                           style: .default) { _ in
            let settingsUrl = URL(string: UIApplication.openSettingsURLString)
            if let url = settingsUrl {
                UIApplication.shared.open(url,
                                          options: [:],
                                          completionHandler: nil)
            }
        }
        let cancelAction = UIAlertAction(title: LocalizedStrings.cancelTitle,
                                         style: .cancel,
                                         handler: nil)
        alertController.addAction(cancelAction)
        alertController.addAction(settingsAction)
        presenter.present(alertController,
                          animated: true,
                          completion: nil)
    }

    /// present alert for settings
    private func presentGalleryAlertForSettings() {
        let alertController = UIAlertController(title: nil,
                                                message: LocalizedStrings.galleryPermissionMessage,
                                                preferredStyle: .alert)
        let settingsAction = UIAlertAction(title: LocalizedStrings.settingsTitle,
                                           style: .default) { _ in
            let settingsUrl = URL(string: UIApplication.openSettingsURLString)
            if let url = settingsUrl {
                UIApplication.shared.open(url,
                                          options: [:],
                                          completionHandler: nil)
            }
        }
        let cancelAction = UIAlertAction(title: LocalizedStrings.cancelTitle,
                                         style: .cancel,
                                         handler: nil)
        alertController.addAction(cancelAction)
        alertController.addAction(settingsAction)
        presenter.present(alertController,
                          animated: true,
                          completion: nil)
    }

    /// present UIImagePickerController with SourceType
    /// - Parameter sourceType: UIImagePickerController.SourceType
    private func presentImagePickerController(withSourceType sourceType: UIImagePickerController.SourceType) {
        if UIImagePickerController.isSourceTypeAvailable(sourceType) {
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = sourceType
            imagePicker.mediaTypes = UIImagePickerController.availableMediaTypes(for: sourceType) ??
                ["public.image"]
            presenter.present(imagePicker, animated: true, completion: nil)
        }
    }

    /// present options for image pickers
    func presentOptions() {
        let alertController = UIAlertController(title: nil,
                                                message: nil,
                                                preferredStyle: .actionSheet)
        let cameraAction = UIAlertAction(title: LocalizedStrings.cameraTitle,
                                         style: .default) { _ in
            self.requestCameraAuthorization { granted in
                DispatchQueue.main.async {
                    guard granted else {
                        self.presentCameraAlertForSettings()
                        return
                    }
                    self.presentImagePickerController(withSourceType: .camera)
                }
            }
        }
        let galleryAction = UIAlertAction(title: LocalizedStrings.galleryTitle,
                                          style: .default) { _ in
            self.requestPhotoLibraryAuthorization { granted in
                DispatchQueue.main.async {
                    guard granted else {
                        self.presentGalleryAlertForSettings()
                        return
                    }
                    self.presentImagePickerController(withSourceType: .photoLibrary)
                }
            }
        }
        let cancelAction = UIAlertAction(title: LocalizedStrings.cancelTitle,
                                         style: .cancel,
                                         handler: nil)
        alertController.addAction(cancelAction)
        alertController.addAction(cameraAction)
        alertController.addAction(galleryAction)
        presenter.present(alertController,
                          animated: true,
                          completion: nil)
    }
}

extension CameraManager: UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController,
                               didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
        if let image = info[.editedImage] as? UIImage {
            delegate?.useImage(image)
            picker.dismiss(animated: true, completion: nil)
        } else if let image = info[.originalImage] as? UIImage {
            delegate?.useImage(image)
            picker.dismiss(animated: true, completion: nil)
        } else {
            picker.dismiss(animated: true) {
                UIAlertController.present(withTitle: LocalizedStrings.errorTitle,
                                          withMessage: LocalizedStrings.unknownimageMessage,
                                          fromPresenter: self.presenter)
            }
        }
    }

    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
}
