// Copyright (c) 2024 David N Main

import Foundation

/// Allow "where" clauses to specify that a type is Optional.
///
/// `Optional` cannot be directly used as a where-constraint but it can
/// be achieved by conforming it to `IsOptional`.
///
/// This protocol also allows "casting" the wrapped value to an optional
/// type so that it can be unwrapped.
///
/// ```swift
/// public protocol IsOptional: ExpressibleByNilLiteral {
///     associatedtype Wrapped
///
///     // Get the value as an optional type
///     var asOptional: Wrapped? { get }
/// }
///
/// extension Optional: IsOptional {
///     public var asOptional: Wrapped? { self }
/// }
///
/// protocol Foo {
///     associatedtype Bar
///
///     var value: Bar { get }
///     var message: String { get }
/// }
///
/// extension Foo {
///     var message: String { "NOT OPTIONAL \(value)" }
/// }
///
/// extension Foo where Bar: IsOptional {
///     var message: String {
///         // need to cast value to optional type
///         if let value = value.asOptional {
///             "IS OPTIONAL \(value)"
///         } else {
///             "IS OPTIONAL nil"
///         }
///     }
/// }
/// ```
public protocol IsOptional: ExpressibleByNilLiteral {
    associatedtype Wrapped

    /// Get the value as an optional type
    var asOptional: Wrapped? { get }
}

extension Optional: IsOptional {
    /// Get the value as an optional type
    public var asOptional: Wrapped? { self }
}

protocol Foo {
    associatedtype Bar

    var value: Bar { get }
    var message: String { get }
}

extension Foo {
    var message: String { "NOT OPTIONAL \(value)" }
}

extension Foo where Bar: IsOptional {
    var message: String {
        // need to cast value to optional type
        if let value = value.asOptional {
            "IS OPTIONAL \(value)"
        } else {
            "IS OPTIONAL nil"
        }
    }
}

