//
//  ContentView.swift
//  Cloud Test
//
//  Created by Daniel Wetzel on 25.07.23.
//

import SwiftUI

struct ContentView: View {
    @State var size: Int = 0
    var body: some View {
        VStack {
            Button("Click me") {
                let panel = NSOpenPanel()
                panel.allowsMultipleSelection = false
                panel.canChooseDirectories = true
                if panel.runModal() == .OK, let url = panel.url {
                    let bookmark = try! url.bookmarkData(options: [.withSecurityScope, .securityScopeAllowOnlyReadAccess])
                    print("\(bookmark.count)")
                    self.size = bookmark.count
                }
            }
            Text("\(self.size)")
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
