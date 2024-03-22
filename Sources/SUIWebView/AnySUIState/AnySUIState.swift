//
//  AnySUIState.swift
//  
//
//  Created by Guillaume Coquard on 22/03/24.
//

import Foundation

final class AnySUIState: NSObject, Identifiable, SUICoordinatorObject {

    public typealias ID = IdentifiableUIView.ID
    public typealias Root = IdentifiableUIView
    public typealias BridgedRoot = SUIBridgedViewRoot<Root>

    static fileprivate private(set) var states: [ID: any SUIStateObject] = [:]

    internal var id: UUID = .init(uuid: (0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0))
    internal var root: BridgedRoot = .init(.constant(.init()))

    @discardableResult
    static public func insert(_ state: any SUIStateObject) -> Bool {
        Self.states.updateValue(state, forKey: state.id as! AnySUIState.ID) != nil
    }

    @discardableResult
    static public func remove(_ id: ID) -> Bool {
        Self.states.removeValue(forKey: id) != nil
    }

    static public func get(for id: ID) -> (any SUIStateObject)? {
        Self.states[id]
    }
}
