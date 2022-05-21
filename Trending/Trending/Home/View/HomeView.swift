//
//  HomeView.swift
//  Trending
//
//  Created by Anton on 25/02/2022.
//

import SwiftUI

struct HomeView: View {
    
    @Environment(\.colorScheme) private var colorScheme: ColorScheme
    @State private var isDarkModeOn = false
        
    init() {
        UINavigationBar.appearance().barTintColor = UIColor(named: "BackgroundColorList")
        UINavigationBar.appearance().backgroundColor = UIColor(named: "BackgroundColorList")
        UITableView.appearance().backgroundColor = UIColor(named: "BackgroundColorList")
    }

    @ObservedObject var viewModel = HomeViewModel()

    var body: some View {
        NavigationView {
            VStack(){
                NavigationLink(destination: MovieView()) {
                    Text("🎬Movies🎬")
                        .padding(50)
                        .font(.largeTitle)
                }

                NavigationLink(destination: TvView()) {
                    Text("📺TV Shows📺")
                        .font(.largeTitle)
                }
                
                Color.BackgroundColorList.edgesIgnoringSafeArea(.all)
                VStack() {
                    Text("Switch theme").foregroundColor(Color.TextColorSecondary).padding(10)
                    ToggleThemeView
                }
                .background(Color.BackgroundColorList)
                .navigationBarTitle("Trending now")
                .foregroundColor(Color.TextColorPrimary)
                .padding(50)


            }
            .background(Color.BackgroundColorList)
//            .navigationViewStyle(StackNavigationViewStyle())
            .onAppear(perform: {
                setAppTheme()
            })
        }
    }
    
    func setAppTheme(){
        //MARK: use saved device theme from toggle
//        isDarkModeOn = UserDefaultsUtils.shared.getDarkMode()
        //MARK: or use device theme

         if (colorScheme == .dark)
         {
             isDarkModeOn = true
         }
         else{
             isDarkModeOn = false
         }
        
        changeDarkMode(state: isDarkModeOn)
    }
    
    func changeDarkMode(state: Bool){
        (UIApplication.shared.connectedScenes.first as? UIWindowScene)?.windows.first!.overrideUserInterfaceStyle = state ? .dark : .light
        UserDefaultsUtils.shared.setDarkMode(enable: state)
    }
    
    var ToggleThemeView: some View {
        Toggle("Dark Mode", isOn: $isDarkModeOn).onChange(of: isDarkModeOn) { (state)  in
            changeDarkMode(state: state)
        }.labelsHidden()
    }
}
