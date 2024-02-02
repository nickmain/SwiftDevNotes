// Copyright (c) 2024 David N Main

import Foundation

/// Set an actor to use a particular dispatch queue 
///
/// Limitations:
///  * The only way to use this is via a DispatchSerialQueue
///  * Dispatch queues cannot be tied to a particular thread (except main)
public actor CustomExecutorActor {

    public let queue: DispatchSerialQueue

    public nonisolated var unownedExecutor: UnownedSerialExecutor { queue.asUnownedSerialExecutor() }

    public init(queue: DispatchSerialQueue) {
        self.queue = queue
    }

    
}
