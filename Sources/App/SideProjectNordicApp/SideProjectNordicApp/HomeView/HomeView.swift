//
//  HomeView.swift
//  SideProjectNordicApp
//
//  Created by Pawel Kacela on 23/04/2022.
//

import Foundation
import SwiftUI

struct HomeView: View {
    
    let viewModel: HomeViewModel
    
    var body: some View {
        NavigationView {
            HStack() {
                Text("Hello World!")
            }
            .navigationBarTitle(Text(viewModel.title))
        }
    }
}
