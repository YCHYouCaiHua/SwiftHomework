//
//  HMPullToRefreshView.swift
//  SwiftHomework-ZWC
//
//  Created by 油菜花 on 2022/2/16.
//

import SwiftUI

struct PullToRefreshView<Header, Content, Footer> {
    private let header: Header
    private let footer: Footer
    @Binding var isHaveMoreData: Bool
    private let content: () -> Content
    
    @Environment(\.headerRefreshData) private var headerRefreshData
    @Environment(\.footerRefreshData) private var footerRefreshData
}

extension PullToRefreshView: View where Header: View, Content: View, Footer: View {
    
    init(header: Header, footer: Footer, isHaveMoreData: Binding<Bool>, @ViewBuilder content: @escaping () -> Content) {
        self.header = header
        self.footer = footer
        self.content = content
        _isHaveMoreData = isHaveMoreData
    }
    
    var body: some View {
        VStack(spacing: 0) {
            header
                .frame(maxWidth: .infinity)
                .anchorPreference(key: HeaderBoundsPreferenceKey.self, value: .bounds, transform: {
                    [.init(bounds: $0)]
                })
            
            content()
                .anchorPreference(key: FooterBoundsPreferenceKey.self, value: .bounds, transform: {
                    [.init(bounds: $0)]
                })
            
            footer
                .frame(maxWidth: .infinity)
                .anchorPreference(key: FooterBoundsPreferenceKey.self, value: .bounds, transform: {
                    [.init(bounds: $0)]
                })
        }
    }
}
