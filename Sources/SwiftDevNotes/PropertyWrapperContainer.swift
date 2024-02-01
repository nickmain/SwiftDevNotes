// Copyright (c) 2024 David N Main

import Foundation

public protocol WrapperContainer: AnyObject {
    var values: [ContainerAwarePropertyWrapper: String] { get set }
}

/// Using a static subscript all access of the wrapper value can be intercepted
/// and both the container and the wrapper are available via arguments.
///
/// ```swift
/// public static subscript(
///     _enclosingInstance instance: WrapperContainer,
///     wrapped wrappedKeyPath: ReferenceWritableKeyPath<WrapperContainer, String>,
///     storage storageKeyPath: ReferenceWritableKeyPath<WrapperContainer, Self>
/// ) -> String {
///     get {
///         let propertyWrapper = instance[keyPath: storageKeyPath]
///         ...
///     }
///     set {
///         let propertyWrapper = instance[keyPath: storageKeyPath]
///         ...
///     }
/// }
/// ```
@propertyWrapper
public struct ContainerAwarePropertyWrapper: Hashable {

    @available(*, unavailable)
    public var wrappedValue: String {
        get { fatalError("This wrapper only works on instance properties of classes") }
        set { fatalError("This wrapper only works on instance properties of classes") }
    }

    public init(wrappedValue: String) {
        // nothing
    }

    public static subscript(
        _enclosingInstance instance: WrapperContainer,
        wrapped wrappedKeyPath: ReferenceWritableKeyPath<WrapperContainer, String>,
        storage storageKeyPath: ReferenceWritableKeyPath<WrapperContainer, Self>
    ) -> String {
        get {
            let propertyWrapper = instance[keyPath: storageKeyPath]

            return instance.values[propertyWrapper] ?? ""
        }
        set {
            let propertyWrapper = instance[keyPath: storageKeyPath]
            instance.values[propertyWrapper] = newValue
        }
    }
}
