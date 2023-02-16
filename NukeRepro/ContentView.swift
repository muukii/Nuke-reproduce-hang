//
//  ContentView.swift
//  NukeRepro
//
//  Created by Muukii on 2023/02/16.
//

import Nuke
import SwiftUI

struct ContentView: View {
  var body: some View {
    VStack {
      Button("Load") {
        
        let r = Resource()
                
        let task = Task {
          
          let response = try await ImagePipeline.shared.image(for: URL(string: "https://images.unsplash.com/photo-1675097659737-2575571c507c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2940&q=80")!,delegate:nil)
          
          print(response)

          withExtendedLifetime(r) {}
        }
        
        task.cancel()
        
      }
    }
    .padding()
  }
}

final class Resource {
  
  init() {
    print("Init", self)
  }
  
  deinit {
    print("Deinit", self)
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
