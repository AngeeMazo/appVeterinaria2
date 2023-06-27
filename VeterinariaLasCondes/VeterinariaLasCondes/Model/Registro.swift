//
//  Registro.swift
//  VeterinariaLasCondes
//
//  Created by Angee Mazo on 12/06/23.
//
import Foundation

// MARK: - Registro
struct Registro: Codable {
    let idRegistro: Int
    let email, nombre, apellido, contrasena: String
    let telefono, nombreMascota, tipoMascota, fechaNacimiento: String
    let raza, administrador: String

    enum CodingKeys: String, CodingKey {
        case idRegistro = "id_Registro"
        case email, nombre, apellido, contrasena, telefono
        case nombreMascota = "nombre_mascota"
        case tipoMascota = "tipo_mascota"
        case fechaNacimiento = "fecha_nacimiento"
        case raza, administrador
    }
}
