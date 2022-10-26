//
//  ContentView.swift
//  Notes App WatchKit Extension
//
//  Created by Welliton da Conceicao de Araujo on 26/10/22.
//

import SwiftUI

struct ContentView: View {
    // MARK: - PROPERTY
    @State private var notes: [Note] = [Note]()
    @State private var text: String = ""
    
    // MARK: - FUNCTION
    
    
    // MARK: - BODY
    
    
    var body: some View {
        VStack {
            HStack(alignment: .center, spacing: 6 ) {
                TextField("Add New Note", text: $text)
                
                Button {
                    // ACTION
                } label: {
                    Image(systemName: "plus")
                }
                .fixedSize()
                .buttonStyle(BorderedButtonStyle(tint: .accentColor))
            }// HSTACK
        } //: VSTACK
        .navigationTitle("Notes")
    }
}

// MARK: - PREVIEW

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
