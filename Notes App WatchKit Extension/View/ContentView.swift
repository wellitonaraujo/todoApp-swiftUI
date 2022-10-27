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
    
    func getDocumentDirectory() -> URL {
        let path =  FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
            return path[0]
    }
    
    func saveNotes() {
        do {
            let data = try JSONEncoder().encode(notes)
            
            let url = getDocumentDirectory().appendingPathComponent("notes")
            
            try data.write(to: url)
            
        } catch {
            print("Salvo")
        }
    }
    
    func deleteNotes(offsets: IndexSet) {
        withAnimation {
            notes.remove(atOffsets: offsets)
            saveNotes()
        }
    }
    
    func load() {
        DispatchQueue.main.async {
            do {
                let url = getDocumentDirectory().appendingPathComponent("notes")
                
                let data = try Data(contentsOf: url)
                
                notes = try JSONDecoder().decode([Note].self, from: data)
                
            } catch {
                
            }
        }
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
                    
                    saveNotes() // sabe the notes
                    
                } label: {
                    Image(systemName: "plus.circle")
                        .font(.system(size: 42, weight: .bold))
                }
                .fixedSize()
                .buttonStyle(PlainButtonStyle())
                .foregroundColor(.accentColor)
                
                //.buttonStyle(BorderedButtonStyle(tint: .accentColor)) - funciona tbm drx :)
                
            }// HSTACK
            
            Spacer()
            
            List {
                ForEach(0..<notes.count, id: \.self) { i in
                    HStack {
                        Capsule()
                            .frame(width: 4)
                            .foregroundColor(.accentColor)
                        Text(notes[i].text)
                            .lineLimit(1)
                            .padding(.leading, 5)
                    } //: HSTACK
                }// LOOP
                .onDelete(perform: deleteNotes)
            } // LIST
        } //: VSTACK
        .navigationTitle("Notes")
        .onAppear(perform: {
            load()
        })
    }
}

// MARK: - PREVIEW

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
