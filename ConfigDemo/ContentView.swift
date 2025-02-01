//
//  ContentView.swift
//  ConfigDemo
//
//  Created by Abhinay Maurya on 01/02/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("Config File Demo")
                .font(Font.system(size: 33, weight: .bold))
                .foregroundColor(.white)
            
            Text(getBaseUrl() ?? "")
                .multilineTextAlignment(.center)
                .font(.title2)
                .foregroundColor(.white)
                .padding(.top, 20)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.accentColor)
        
    }
    
    private func getBaseUrl() -> String? {
        var configFileName = ""
        if let buildConfig = Bundle.main.object(forInfoDictionaryKey: "BuildConfiguration") as? String {
            configFileName = buildConfig
        }
        
        //Change the Build Configuration from the Edit Schema section to test other env
        guard let baseUrlString = Bundle.main.object(forInfoDictionaryKey: "BaseURL") as? String else {
            
            return nil
        }
         
        return "\(configFileName) environment --> \(baseUrlString)"
    }
}

#Preview {
    ContentView()
}
