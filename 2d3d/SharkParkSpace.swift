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
                        loadedShark?.scale = .init(x: 0.3, y: 0.3, z: 0.3)
                        loadedShark?.position = .init(x: 0, y: 0, z: -7)
            
            //add to rotate
            let rotationAngle = simd_quatf(angle: 0.872, axis: SIMD3(x: 0, y: 1, z: 0))
            // y(upward axis)축을 기준으로 0.45라디안 = 약 25.8도 회전 시켰음
            // realityKit 에서는 angle 이 아닌 simd_quadf 이라는 쿼터니언을 이용해 회전시켜야 함.
            //라디안 = 도 × π / 180
            loadedShark?.orientation = rotationAngle
            
            
            if let secondAnimation = loadedShark?.availableAnimations.first{
                loadedShark?.playAnimation(secondAnimation.repeat(), transitionDuration: 0, startsPaused: false)
            }
            
            guard let loadedShark else {
                return
            }
            content.add(loadedShark)
        }
    }
}


#Preview {
    SharkParkSpace()
}

#endif

