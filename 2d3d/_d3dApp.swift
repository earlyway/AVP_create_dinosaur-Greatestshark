//
//  _d3dApp.swift
//  2d3d
//
//  Created by Tium Solutions on 8/19/24.
//

import SwiftUI

@main
struct _d3dApp: App {
    var body: some Scene {
        
        WindowGroup {
            ContentView()
        }
        .windowStyle(.plain)
        
        ImmersiveSpace(id: "dinosaurPark"){ // immersive space 를 간단히 dinosaurPark 라고 부르자.
            DinosaurParkSpace() // 몰입형 공간에 해당 ContentView.swift를 추가.
        }
        ImmersiveSpace(id: "GSharkPark"){
            SharkParkSpace()
        }
    }
}



