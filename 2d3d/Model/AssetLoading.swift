//
//  AssetLoading.swift
//  2d3d
//
//  Created by Tium Solutions on 8/20/24.
// reality composer pro 프로젝트에서 파일과 노드를 로드.

#if os(visionOS) //컴파일러에 대한 조건부 검사. 이 코드는 비전os 플랫폼이 맞다면 적용되는 코드이다.

import Foundation
import RealityKit
import RealityKitContent


@MainActor
func loadFromRealityComposerProject(named entityName : String, fromSceneNamed sceneName : String) async -> Entity? {
    var entity : Entity? = nil
    do{
        let scene = try await Entity(named : sceneName, 
                                     in : realityKitContentBundle)
        entity = scene.findEntity(named : entityName)
    }catch {
        print("Error loading assets named \(entityName) from file \(sceneName)")
    }
    return entity
}

#endif
