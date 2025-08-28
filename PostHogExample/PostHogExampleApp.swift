//
//  PostHogExampleApp.swift
//  PostHogExample
//
//  Created by Luke Belton on 28/08/2025.
//

import SwiftUI
import PostHog

@main
struct PostHogExampleApp: App {
    
    init() {
            
        let POSTHOG_API_KEY = "<YOUR_API_KEY>"
        // usually 'https://us.i.posthog.com' or 'https://eu.i.posthog.com'
        let POSTHOG_HOST = "https://us.i.posthog.com"
        
        
        let config = PostHogConfig(apiKey: POSTHOG_API_KEY, host: POSTHOG_HOST)
        config.personProfiles = .always
        PostHogSDK.shared.setup(config)
        
        PostHogSDK.shared.debug()
        
            
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
