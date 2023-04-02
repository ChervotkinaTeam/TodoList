// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return prefer_self_in_static_references

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
internal enum L10n {
  internal enum Authorization {
    /// Localizable.strings
    ///   TodoList
    /// 
    ///   Created by Елена Червоткина on 01.04.2023.
    internal static let toLogin = L10n.tr("Localizable", "Authorization.toLogin", fallback: "Login")
  }
  internal enum Task {
    internal enum Priority {
      /// High
      internal static let high = L10n.tr("Localizable", "Task.Priority.high", fallback: "High")
      /// Low
      internal static let low = L10n.tr("Localizable", "Task.Priority.low", fallback: "Low")
      /// Medium
      internal static let medium = L10n.tr("Localizable", "Task.Priority.medium", fallback: "Medium")
    }
    internal enum State {
      /// All
      internal static let all = L10n.tr("Localizable", "Task.State.all", fallback: "All")
      /// Completed
      internal static let completed = L10n.tr("Localizable", "Task.State.completed", fallback: "Completed")
      /// Uncompleted
      internal static let uncompleted = L10n.tr("Localizable", "Task.State.uncompleted", fallback: "Uncompleted")
    }
  }
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name vertical_whitespace_opening_braces

// MARK: - Implementation Details

extension L10n {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg..., fallback value: String) -> String {
    let format = BundleToken.bundle.localizedString(forKey: key, value: value, table: table)
    return String(format: format, locale: Locale.current, arguments: args)
  }
}

// swiftlint:disable convenience_type
private final class BundleToken {
  static let bundle: Bundle = {
    #if SWIFT_PACKAGE
    return Bundle.module
    #else
    return Bundle(for: BundleToken.self)
    #endif
  }()
}
// swiftlint:enable convenience_type
