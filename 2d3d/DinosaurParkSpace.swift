//
//  DinosaurParkSpace.swift
//  2d3d
//
//  Created by Tium Solutions on 8/20/24.
//
#if os(visionOS)

import SwiftUI
import RealityKit

struct DinosaurParkSpace: View {
    
    @State private var loadedDinosaur : Entity? = nil
    
    var body: some View {
        
        RealityView{ content in
            
            loadedDinosaur = await loadFromRealityComposerProject(named: "trex", fromSceneNamed: "trexGLB.usdz")
            loadedDinosaur?.scale = .init(x: 1, y: 1, z: 1)
            loadedDinosaur?.position = .init(x: 0, y: 0, z: -4) //사용자의 앞쪽 포지션 z 음수!!
            
            //todo collision
            //todo allow user to tap on it
            //todo add lighting
            
            //apply animation
            if let firstAnimation = loadedDinosaur?.availableAnimations.first{
                loadedDinosaur?.playAnimation(firstAnimation.repeat(), transitionDuration: 0, startsPaused: false)
            }
            
            
            //객체가 있는지 확인하기 위해 gaurd문
            guard let loadedDinosaur else {
                return
            }
            
            content.add(loadedDinosaur)
        }
    }
}

#Preview(windowStyle : .automatic) {
    DinosaurParkSpace()
}


#endif
