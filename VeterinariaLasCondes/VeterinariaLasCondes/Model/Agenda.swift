//
//  Agenda.swift
//  VeterinariaLasCondes
//
//  Created by Angee Mazo on 27-06-23.
//

import Foundation

// MARK: - Agenda
struct Agenda: Codable {
    let idAgendar: Int
    let nombreServicio, especialista: String
    let idRegistro: Int
    let fecha, hora: String
    let idServicio, idEspecialista: Int

    enum CodingKeys: String, CodingKey {
        case idAgendar = "id_Agendar"
        case nombreServicio = "nombre_Servicio"
        case especialista
        case idRegistro = "id_Registro"
        case fecha, hora
        case idServicio = "id_Servicio"
        case idEspecialista = "id_Especialista"
    }
}
