//
//  ContentView.swift
//  2d3d
//
//  Created by Tium Solutions on 8/19/24.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct ContentView: View {
    
    @State private var isGlassBackgroundShown : Bool = true
    
    @Environment(\.openImmersiveSpace) private var openImmersiveSpace // dinosaurPark immersivespace 를 오픈 (button show dinosaur)
    @Environment(\.dismissImmersiveSpace) private var dismissImmersiveSpace // dinosaurPark immersivespace 를 클로즈 (button Ask dinosaur to go back)
    
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .resizable()
                .scaledToFit()
                .foregroundStyle(.teal)
                .frame(width: 300, height: 300) // globe 아이콘의 크기
            Text("Hello Vision OS World")
            
            Toggle("Glass Backgorund toggle made by TG", isOn: $isGlassBackgroundShown)
            
            Button("Show Dinosaur"){
                Task{
                    await self.openImmersiveSpace(id: "dinosaurPark") //MainView 에서 간단히 만들었던 dinosaurPark id 를 가진 immersivespace 를 비동기로 open.
                }
            }
            Button("Ask dinosaur to go back"){
                Task {
                    await self.dismissImmersiveSpace()
                }
            }
            Button("Show greatest Shark"){
                Task{
                    await self.openImmersiveSpace(id : "sharkPark")
                }
            }
            Button("Dismiss Greatest Shark"){
                Task{
                    await self.dismissImmersiveSpace()
                }
            }
        }
        .padding()
        .frame(width: 700)
        .glassBackgroundEffect(displayMode : isGlassBackgroundShown ? .always : .never)
    }
}

#Preview(windowStyle: .automatic) {
    ContentView()
}
