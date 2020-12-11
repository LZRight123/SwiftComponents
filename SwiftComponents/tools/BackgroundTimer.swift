//
//  Fileb.swift
//  SwiftComponentsDemo
//
//  Created by liangze on 2020/7/31.
//  Copyright © 2020 liangze. All rights reserved.
//

import Foundation


open class BackgroundTimer {

    private var task: (()->())?

    private var _timer: DispatchSourceTimer?

    private let _lock = NSLock()

    private enum State {
        case suspended
        case resumed
    }

    private var state: State = .suspended

    public init(deadline: DispatchTime = .now(), repeating: DispatchTimeInterval = .never,
                leeway: DispatchTimeInterval = .milliseconds(100), queue: DispatchQueue = .main, task: (()->())?) {
        self.task = task
        _timer = DispatchSource.makeTimerSource()
        _timer?.schedule(deadline: deadline,
                        repeating: repeating,
                        leeway: leeway)
        _timer?.setEventHandler(handler: {
            queue.async {
                task?()
            }
        })
    }

    open func resume() {
        guard state != .resumed else { return }
        _lock.lock()
        defer {
            _lock.unlock()
        }
        guard state != .resumed else { return }
        state = .resumed
        _timer?.resume()
    }

    open func suspend() {
        guard state != .suspended else { return }
        _lock.lock()
        defer {
            _lock.unlock()
        }
        guard state != .suspended else { return }
        state = .suspended
        _timer?.suspend()
    }
    
    open func cancel() {
        if state == .suspended {
            _timer?.resume()
        }
        _timer?.cancel()
    }

    deinit {
        _timer?.setEventHandler {}
        task = nil
        if state == .suspended {
            _timer?.resume()
        }
        
        print("deinit timer source")
    }
}
