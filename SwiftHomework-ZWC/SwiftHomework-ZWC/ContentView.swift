//
//  ContentView.swift
//  SwiftHomework-ZWC
//
//  Created by 油菜花 on 2022/2/16.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var appStore: HMAppstore
    @State private var headerRefreshing: Bool = false
    @State private var footerRefreshing: Bool = false
    
    var body: some View {
        NavigationView {
            applicationListView
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

// MARK: - UI widgets
extension ContentView {
    
    var applicationListView: some View {
        ScrollView {
            PullToRefreshView(header: RefreshHeaderView(), footer: RefreshFooterView(isHaveMorData: $appStore.isHaveMoreData), isHaveMoreData: $appStore.isHaveMoreData) {
                VStack(spacing: 15) {
                    ForEach(appStore.applicationList) { app in
                        CellContentView(app: $appStore.applicationList[appStore.getApplicationIndex(app: app)])
                            .listRowSeparator(.hidden)
                            .padding([.leading, .trailing])
                    }
                }
            }
        }
        .navigationTitle("App")
        .background(Color(red: 244/255, green: 243/255, blue: 247/255))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(appStore: HMAppstore())
            .previewInterfaceOrientation(.portrait)
    }
}
