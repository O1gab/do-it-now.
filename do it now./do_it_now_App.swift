//
//  do_it_now_App.swift
//  do it now.
//
//

import SwiftUI

@main
struct DoItNowApp: App {
    
    @StateObject var listViewModel: ListViewModel = ListViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
               ListView()
            }
            .environmentObject(listViewModel)
        }
    }
}
