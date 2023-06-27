//
//  Perfil.swift
//  VeterinariaLasCondes
//
//  Created by Angee Mazo on 29/01/23.
//

import SwiftUI

struct Perfil: View {
    private let maxWidth: CGFloat = 300
    private let colorTextoBlue = Color("textoBlue")
    
    @EnvironmentObject private var viewModel: LoginViewModel
    
    func showDataView(title: String, data: String) -> some View {
        VStack(alignment: .leading, spacing: 1) {
            Text(title)
                .foregroundColor(.gray)
            Text(data)
                .frame(maxWidth: maxWidth)
                .padding()
                .border(colorTextoBlue)
        }
    }
    
    var body: some View {
        ScrollView(showsIndicators: false){
            VStack (spacing: 25) {
                
                Text("Información Reserva")
                    .foregroundColor(colorTextoBlue)
                    .font(.title)
                    .padding(.top,30)

                
                
                VStack(alignment: .leading, spacing: 15) {
                    
                    showDataView(title: "Especialidad", data: viewModel.agendas[0].nombreServicio)
                    
                    showDataView(title: "Especialista", data: viewModel.agendas[0].especialista)
                    
                    showDataView(title: "Nombre y Apellido",
                                 data: "\(viewModel.register.first?.nombre ?? "") \(viewModel.register.first?.apellido ?? "")")
                    
                    showDataView(title: "Fecha", data: viewModel.agendas[0].fecha)
                    
                    showDataView(title: "Hora", data: viewModel.agendas[0].hora)
                }
                .padding(.horizontal, 0)
                
                Button {
                    viewModel.closeSession()
                } label: {
                    Text("Cerrar Sesión")
                }
                .padding()
                .background(colorTextoBlue)
                .foregroundColor(.white)
                .cornerRadius(8)

            }
            .padding(.horizontal, 20)
        }
        .background(Color("colorFondo").ignoresSafeArea(.all))
    }
}

struct Perfil_Previews: PreviewProvider {
    static var previews: some View {
        Perfil()
    }
}

