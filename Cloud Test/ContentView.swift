//
//  ContentView.swift
//  Cloud Test
//
//  Created by Daniel Wetzel on 25.07.23.
//

import SwiftUI

struct ContentView: View {
    @State var sizePlain: Int = 0
    @State var sizeScoped: Int = 0
    @State var statePlain: String = "waiting"
    @State var stateScoped: String = "waiting"
    var body: some View {
        VStack {
            HStack {
                Text("State Plain")
                Text(self.statePlain).accessibilityIdentifier("statePlain")
            }
            HStack {
                Text("State Scoped")
                Text(self.stateScoped).accessibilityIdentifier("stateScoped")
            }
            Button("Click me") {
                let panel = NSOpenPanel()
                panel.allowsMultipleSelection = false
                panel.canChooseDirectories = true
                self.statePlain = "clicked"
                self.stateScoped = "clicked"
                if panel.runModal() == .OK, let url = panel.url {
                    self.statePlain = "selected"
                    self.stateScoped = "selected"
                    let isScoped = url.startAccessingSecurityScopedResource()
                    defer {
                        if isScoped {
                            url.stopAccessingSecurityScopedResource()
                        }
                    }
                    if let bookmarkPlain = try? url.bookmarkData() {
                        self.sizePlain = bookmarkPlain.count
                        self.statePlain = "bookmarked"
                    } else {
                        self.statePlain = "coruuuuuupt"
                    }
                    if let bookmarkScoped = try? url.bookmarkData(options: [.withSecurityScope]) {
                        self.sizeScoped = bookmarkScoped.count
                        self.stateScoped = "bookmarked"
                    } else {
                        self.stateScoped = "coruuuuuupt"
                    }
                }
            }
            HStack {
                Text("Size Plain:")
                Text("\(self.sizePlain)")
            }
            HStack {
                Text("Size Scoped:")
                Text("\(self.sizeScoped)")
            }
        }
        .padding()
        .frame(width: 300, height: 300)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
