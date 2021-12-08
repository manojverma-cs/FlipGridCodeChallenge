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
}
