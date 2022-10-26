//
//  Note.swift
//  Notes App WatchKit Extension
//
//  Created by Welliton da Conceicao de Araujo on 26/10/22.
//

import Foundation

struct Note: Identifiable, Codable {
    let id: UUID
    let text: String
}
