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
    
    func saveNotes() {
        dump(notes)
    }
    
    
    // MARK: - BODY
    
    
    var body: some View {
        VStack {
            HStack(alignment: .center, spacing: 6 ) {
                TextField("Add New Note", text: $text)
                
                Button {
                    // ACTION
                    guard text.isEmpty == false else { return }
                    
                    let note = Note(id: UUID(), text: text)
                    
                    notes.append(note)
                    
                    text = ""
                    
                    saveNotes() // sabe the note/s
                    
                } label: {
                    Image(systemName: "plus.circle")
                        .font(.system(size: 42, weight: .semibold))
                }
                .fixedSize()
                .buttonStyle(PlainButtonStyle())
                .foregroundColor(.accentColor)
                
                //.buttonStyle(BorderedButtonStyle(tint: .accentColor)) - funciona tbm drx :)
                
            }// HSTACK
            
            Spacer()
            
            Text("\(notes.count)")
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
