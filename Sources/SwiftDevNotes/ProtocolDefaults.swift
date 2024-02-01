// Copyright (c) 2024 David N Main

import Foundation

/// Optional methods in protocols can be simulated by providing an unconstrained default
/// implementation in an extension.
///
/// Example:
/// ```swift
/// public extension ProtocolWithOptionalMethods {
///     func doSomething() {}
/// }
/// ```
public protocol ProtocolWithOptionalMethods {
    func doSomething()
}

public extension ProtocolWithOptionalMethods {
    /// Default implementation
    func doSomething() {}
}

struct DoSomethingStruct: ProtocolWithOptionalMethods {

}
