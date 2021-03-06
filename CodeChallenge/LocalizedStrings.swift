//
//  LocalizedStrings.swift
//  CodeChallenge
//
//  Created by MANOJ VERMA on 12/7/21.
//

import Foundation

class LocalizedStrings {
    /// Bundle object of current module
    private static let bundle = Bundle(for: LocalizedStrings.self)

    static let avatarTitle = NSLocalizedString("avatar.title",
                                               bundle: bundle,
                                               value: "",
                                               comment: "")
    static let firstNameTitle = NSLocalizedString("firstName.title",
                                                  bundle: bundle,
                                                  value: "",
                                                  comment: "")
    static let emailAddressTitle = NSLocalizedString("emailAddress.title",
                                                     bundle: bundle,
                                                     value: "",
                                                     comment: "")
    static let passwordTitle = NSLocalizedString("password.title",
                                                 bundle: bundle,
                                                 value: "",
                                                 comment: "")
    static let websiteTitle = NSLocalizedString("website.title",
                                                bundle: bundle,
                                                value: "",
                                                comment: "")
    static let profileCreationTitle = NSLocalizedString("profileCreation.title",
                                                        bundle: bundle,
                                                        value: "",
                                                        comment: "")
    static let profileCreationDescription = NSLocalizedString("profileCreation.description",
                                                              bundle: bundle,
                                                              value: "",
                                                              comment: "")
    static let cameraPermissionMessage = NSLocalizedString("cameraPermission.message",
                                                           bundle: bundle,
                                                           value: "",
                                                           comment: "")
    static let galleryPermissionMessage = NSLocalizedString("galleryPermission.message",
                                                            bundle: bundle,
                                                            value: "",
                                                            comment: "")
    static let settingsTitle = NSLocalizedString("settings.title",
                                                 bundle: bundle,
                                                 value: "",
                                                 comment: "")
    static let cancelTitle = NSLocalizedString("cancel.title",
                                               bundle: bundle,
                                               value: "",
                                               comment: "")
    static let cameraTitle = NSLocalizedString("camera.title",
                                               bundle: bundle,
                                               value: "",
                                               comment: "")
    static let galleryTitle = NSLocalizedString("gallery.title",
                                                bundle: bundle,
                                                value: "",
                                                comment: "")
    static let errorTitle = NSLocalizedString("error.title",
                                              bundle: bundle,
                                              value: "",
                                              comment: "")
    static let unknownimageMessage = NSLocalizedString("unknownimage.message",
                                                       bundle: bundle,
                                                       value: "",
                                                       comment: "")
    static let unknownErrorMessage = NSLocalizedString("unknownerror.message",
                                                       bundle: bundle,
                                                       value: "",
                                                       comment: "")
    static let emptyAvatarMessage = NSLocalizedString("empty.avatar.message",
                                                      bundle: bundle,
                                                      value: "",
                                                      comment: "")
    static let emptyFirstNameMessage = NSLocalizedString("empty.firstname.message",
                                                         bundle: bundle,
                                                         value: "",
                                                         comment: "")
    static let emptyEmailAddressMessage = NSLocalizedString("empty.emailaddress.message",
                                                            bundle: bundle,
                                                            value: "",
                                                            comment: "")
    static let emptyPasswordMessage = NSLocalizedString("empty.password.message",
                                                        bundle: bundle,
                                                        value: "",
                                                        comment: "")
    static let emptyWebsiteMessage = NSLocalizedString("empty.website.message",
                                                       bundle: bundle,
                                                       value: "",
                                                       comment: "")
    static let protfolioSubmittedMessage = NSLocalizedString("protfoliosubmitted.message",
                                                             bundle: bundle,
                                                             value: "",
                                                             comment: "")
    static let invalidEmailMessage = NSLocalizedString("invalid.email.message",
                                                       bundle: bundle,
                                                       value: "",
                                                       comment: "")
    static let invalidWebsiteMessage = NSLocalizedString("invalid.website.message",
                                                         bundle: bundle,
                                                         value: "",
                                                         comment: "")
    static let submitTitle = NSLocalizedString("submit.title",
                                               bundle: bundle,
                                               value: "",
                                               comment: "")
    static let signinTitle = NSLocalizedString("signin.title",
                                               bundle: bundle,
                                               value: "",
                                               comment: "")
    static func protfolioSubmittedTitle(_ title: String) -> String {
        let protfolioSubmittedMessage = NSLocalizedString("protfoliosubmitted.title",
                                                          bundle: bundle,
                                                          value: "",
                                                          comment: "")
        return String.localizedStringWithFormat(protfolioSubmittedMessage, title)
    }
}
