//
//  settingsView.swift
//  Odessey-of-Life
//
//  Created by Roshan Ekka on 29/03/24.
//

import SwiftUI

struct settingsView: View {
    @State private var darkTheme: Bool = false
    @State private var theme: String = "Light Mode"
    
    @State private var pickTheme = 0
    @State private var iCloudSync: Bool = true
    
    var body: some View {
        
        VStack{
            HStack{
                Text("User's Account : ")
            }
#if os(macOS)
            Form{
                Picker("Appearance:", selection: $pickTheme) {
                    Text("Light Mode").tag(0)
                    Text("DarkMode").tag(1)
                }
                Section(){
                    Toggle("iCloud Sync", isOn: $iCloudSync)
                }
            }
            .padding()
            
#else
            Form{
                Toggle("Appearance : \(theme)", isOn: $darkTheme)
                    .toggleStyle(SwitchToggleStyle(tint: .green))
                Toggle("iCloud Sync", isOn: $iCloudSync)
                
                Section(){
                    Toggle("iCloud Sync", isOn: $iCloudSync)
                }
                
            }
            .onChange(of: darkTheme) { newValue in
                theme = newValue ? "Dark Mode" : "Light Mode"
            }
            
#endif
        }
        .padding(.top, 50)
        .padding(.bottom, 20)
    }
    private func updateTheme(isDark: Bool) {
            theme = isDark ? "Dark Mode" : "Light Mode"
        }
}

#Preview {
    settingsView()
}
