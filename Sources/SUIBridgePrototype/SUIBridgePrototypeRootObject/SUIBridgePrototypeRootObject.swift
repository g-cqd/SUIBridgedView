//
//  File.swift
//  
//
//  Created by Guillaume Coquard on 22/03/24.
//

import SwiftUI

public protocol SUIBridgePrototypeRootObject: UIViewRepresentable, Identifiable
    where Root : UIView,
          UIViewType == Root,
          Coordinator == SUICoordinator<UIViewType>,
          ID == Root.ID
{

    associatedtype Root

    typealias StateType = SUIState<Root>

    var uiView: UIViewType { get }
    var state: Binding<StateType> { get }
    var unwrapped: StateType { get }

}
