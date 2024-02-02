// Copyright (c) 2024 David N Main

import Foundation

/// See [0390-noncopyable-structs-and-enums](https://github.com/apple/swift-evolution/blob/main/proposals/0390-noncopyable-structs-and-enums.md)
public struct NonCopyable: ~Copyable {

    deinit {

    }
}
