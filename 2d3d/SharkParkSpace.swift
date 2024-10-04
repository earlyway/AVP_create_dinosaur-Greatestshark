//
//  SharkParkSpace.swift
//  2d3d
//
//  Created by Tium Solutions on 10/4/24.
//
//Magicat yutube 17:01

#if os(visionOS)
import SwiftUI
import RealityKit

struct SharkParkSpace: View {
    
    @State private var loadedShark : Entity? = nil
    
    var body: some View {
        
        RealityView { content in
            
            loadedShark = await loadFromRealityComposerProject(named: "GreatWhiteShark_Animated", fromSceneNamed: "GreatWhiteShark_Animated.usdz")
            
        }
        
    }
}

#Preview {
    SharkParkSpace()
}


#endif

