//
//  ContentView.swift
//  Cloud Test
//
//  Created by Daniel Wetzel on 25.07.23.
//

import SwiftUI

struct ContentView: View {
    @State var size: Int = 0
    @State var state: String = "waiting"
    var body: some View {
        VStack {
            Text("State: \(self.state)")
            Button("Click me") {
                let panel = NSOpenPanel()
                panel.allowsMultipleSelection = false
                panel.canChooseDirectories = true
                self.state = "clicked"
                if panel.runModal() == .OK, let url = panel.url {
                    self.state = "selected"
                    if let bookmark = try? url.bookmarkData(options: [.withSecurityScope, .securityScopeAllowOnlyReadAccess]) {
                        print("\(bookmark.count)")
                        self.size = bookmark.count
                        self.state = "bookmarked"
                    } else {
                        self.state = "kapuuuuut"
                    }
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
