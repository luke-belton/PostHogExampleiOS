//
//  ContentView.swift
//  PostHogExample
//
//  Created by Luke Belton on 28/08/2025.
//

import SwiftUI
import PostHog

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
        
        // this isn't dynamic when the user gets identified
        Text(PostHogSDK.shared.getDistinctId())
            .font(.title)
        
        Button("Fetch flag") {
            let flag = PostHogSDK.shared.getFeatureFlag("reusability") as? String
            
            // $feature_flag_called events get de-duped - see https://posthog.slack.com/archives/C07PXJDLEH3/p1756455681777279?thread_ts=1756394621.444669&cid=C07PXJDLEH3
            // but this event let's us see the flag value for the press
            PostHogSDK.shared.capture("flag_tracking_event")
            print(flag ?? "no flag value")
        }
        
        Button("Identify") {
            PostHogSDK.shared.identify(UUID().uuidString)
        }
        
        Button("Reset") {
            PostHogSDK.shared.reset()
        }
    }
}

#Preview {
    ContentView()
}
