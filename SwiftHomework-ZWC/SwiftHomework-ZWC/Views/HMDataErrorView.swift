//
//  HMDataErrorView.swift
//  SwiftHomework-ZWC
//
//  Created by 油菜花 on 2022/2/16.
//

import SwiftUI

struct DataErrorView: View {
    var textMsg: String
    var imageName: String
    var body: some View {
        VStack {
            Text(textMsg)
                .padding(.bottom, 20)
            Image(imageName)
                .resizable()
                .frame(maxWidth: 196,maxHeight: 128)
                .padding()
        }
        
    }
}
