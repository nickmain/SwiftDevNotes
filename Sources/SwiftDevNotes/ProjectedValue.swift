// Copyright (c) 2024 David N Main

import Foundation
import Combine

/// A property value can use a projected value to make an ancillary value available.
///
/// See ``projectedValue``.
@propertyWrapper
public struct PropertyWrapperProjectedValue {
    
    public var wrappedValue: String

    public init(wrappedValue: String) {
        self.wrappedValue = wrappedValue
    }

    private let publisher = PassthroughSubject<String, Never>()

    /// The projected value is available using the dollar-prefix notation
    public var projectedValue: AnyPublisher<String, Never> {
        return publisher.eraseToAnyPublisher()
    }
}
