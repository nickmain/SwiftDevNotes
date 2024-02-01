// Copyright (c) 2024 David N Main

import SwiftUI

/// [DynamicProperty protocol](https://developer.apple.com/documentation/swiftui/dynamicproperty)
/// conformance by a view member type is recognized by
/// SwiftUI and causes it to call the ``update()`` method before each view render.
///
/// The struct that conforms to DynamicProperty can have "@State" and "@Environment/Object"
/// members internally in order to interact with the context of the SwiftUI view it is
/// embedded within. Environment properties are only valid within the ``update()`` method call
/// and will likely be missing or crashing when accessed otherwise.
///
/// It can be useful to create a property wrapper that conforms to DynamicProperty.
///
/// Note that `DynamicProperty` only seems to work on structs and not objects.
///
public struct DynamicPropertyExample: DynamicProperty {

    /// Updates the underlying value of the stored value.
    ///
    /// SwiftUI calls this function before rendering a view's
    /// body to ensure the view has the most recent
    /// value.
    public mutating func update() {


    }
}
