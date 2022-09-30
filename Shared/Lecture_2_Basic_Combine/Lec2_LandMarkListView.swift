//
//  Lec2_LandMarkListView.swift
//  learning-swift-ui
//
//  Created by Thang Phung on 26/09/2022.
//

import Foundation
import SwiftUI

struct Lec2_LandMarkListView: View {
    @EnvironmentObject var modelData: ModelData
    @State private var showOnlyFavorite = false
    @State private var filter = FilterCategory.all
    @State private var selectedLandmark: Lec2_LandMark?
    
    enum FilterCategory: String, CaseIterable, Identifiable {
        case all = "All"
        case lakes = "Lakes"
        case rivers = "Rivers"
        case mountains = "Mountains"
        
        var id: FilterCategory { self }
    }
    
    private var filterLandMark: [Lec2_LandMark] {
        modelData.landmakrs.filter({
            (!showOnlyFavorite || $0.isFavorite)
            && (filter == .all || filter.rawValue == $0.category.rawValue)
        })
    }
    
    
    private var navTitle: String {
        let title = filter == .all ? "Landmark" : filter.rawValue
        return showOnlyFavorite ? "Favorite \(title)" : title
    }
    
    private var index: Int? {
        modelData.landmakrs.firstIndex(where: { $0.id == selectedLandmark?.id })
    }
    
    private var listView: some View {
        #if os(watchOS)
        List {
            Toggle(isOn: $showOnlyFavorite) {
                Text("Favorites only")
            }
            
            ForEach(filterLandMark) { landmark in
                NavigationLink {
                    Lec9_LandMarkDetailView(landmark: landmark)
                } label: {
                    Lec2_LandMarkRowView(landmark: landmark)
                }
                .tag(landmark)
            }
        }
        #else
        List(selection: $selectedLandmark) {
            ForEach(filterLandMark) { landmark in
                NavigationLink {
                    #if os(macOS)
                    Lec10_LandMarkDetailView(landmark: landmark)
                    #else
                    Lec2_LandMarkDetailView(landmark: landmark)
                    #endif
                } label: {
                    Lec2_LandMarkRowView(landmark: landmark)
                }
                .tag(landmark)
            }
        }
        #endif
    }
    
    var body: some View {
        NavigationView {
            listView
                .listStyle(.plain)
                #if !os(watchOS)
                .navigationTitle(navTitle)
                .frame(minWidth: 300)
                .toolbar {
                    ToolbarItem {
                        Menu {
                            Picker("Category", selection: $filter) {
                                ForEach(FilterCategory.allCases) { category in
                                    Text(category.rawValue).tag(category)
                                }
                            }
                            .pickerStyle(.inline)
                            
                            Toggle(isOn: $showOnlyFavorite) {
                                Label("Favorites only", systemImage: "star.fill")
                            }
                        } label: {
                            Label("Filter", systemImage: "slider.horizontal.3")
                        }
                    }
                }
                #else
                .navigationTitle("Landmark")
                #endif
            
            #if !os(watchOS)
            Text("Select a Landmark")
            #endif
        }
        #if !os(watchOS)
        .focusedValue(\.selectedLandmark, $modelData.landmakrs[index ?? 0])
        #endif
    }
}

struct Lec2_LandMarkListView_Preview: PreviewProvider {
    static var previews: some View {
        Lec2_LandMarkListView()
            .environmentObject(ModelData())
    }
}
