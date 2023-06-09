// Generated using SwiftGen, by O.Halligon — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable all

internal enum L10n {

  internal enum Authorization {
    /// Login
    internal static let toLogin = L10n.tr("Localizable", "Authorization.toLogin")
  }

  internal enum Task {

    internal enum Priority {
      /// High
      internal static let high = L10n.tr("Localizable", "Task.Priority.high")
      /// Low
      internal static let low = L10n.tr("Localizable", "Task.Priority.low")
      /// Medium
      internal static let medium = L10n.tr("Localizable", "Task.Priority.medium")
    }

    internal enum State {
      /// All
      internal static let all = L10n.tr("Localizable", "Task.State.all")
      /// Completed
      internal static let completed = L10n.tr("Localizable", "Task.State.completed")
      /// Uncompleted
      internal static let uncompleted = L10n.tr("Localizable", "Task.State.uncompleted")
    }
  }
}

extension L10n {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg...) -> String {
    let format = NSLocalizedString(key, tableName: table, bundle: Bundle(for: BundleToken.self), comment: "")
    return String(format: format, locale: Locale.current, arguments: args)
  }
}

private final class BundleToken {}
// swiftlint:enable all