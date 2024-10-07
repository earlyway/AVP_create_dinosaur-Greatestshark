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
    
    @State private var isDinosaurSpaceOpen = false
    @State private var isSharkSpaceOpen = false
    
    
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
//                Task{
//                    await self.openImmersiveSpace(id: "dinosaurPark") //MainView 에서 간단히 만들었던 dinosaurPark id 를 가진 immersivespace 를 비동기로 open.
//                }
                Task {
                        do {
                            try await self.openImmersiveSpace(id: "dinosaurPark")
                            isDinosaurSpaceOpen = true
                        } catch {
                            print("dinosaurPark 몰입형 공간 열기에 실패했습니다: \(error.localizedDescription)")
                        }
                    }
            }
            Button("Ask dinosaur to go back"){
//                Task {
//                    await self.dismissImmersiveSpace()
//                }
                Task {
                        do {
                            try await self.dismissImmersiveSpace()
                            isDinosaurSpaceOpen = false
                        } catch {
                            print("dinosaurPark 몰입형 공간 닫기에 실패했습니다: \(error.localizedDescription)")
                        }
                    }
            }
            Button("Show greatest Shark"){
//                Task{
//                    await self.openImmersiveSpace(id : "GSharkPark")
//                }
                Task {
                        do {
                            try await self.openImmersiveSpace(id: "GSharkPark")
                            isSharkSpaceOpen = true
                        } catch {
                            print("GSharkPark 몰입형 공간 열기에 실패했습니다: \(error.localizedDescription)")
                        }
                    }
            }
            Button("Dismiss Greatest Shark"){
//                Task{
//                    await self.dismissImmersiveSpace()
//                }
                Task {
                        do {
                            try await self.dismissImmersiveSpace()
                            isSharkSpaceOpen = false
                        } catch {
                            print("GSharkPark 몰입형 공간 닫기에 실패했습니다: \(error.localizedDescription)")
                        }
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
