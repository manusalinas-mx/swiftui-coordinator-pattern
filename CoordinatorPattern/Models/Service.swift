//
//  Service.swift
//  CoordinatorPattern
//
//  Created by Manuel Salinas on 9/19/24.
//

import Foundation

struct Service: Identifiable, Hashable, Equatable {
    let id = UUID()
    let name: String
    let logo: String?
    let favIcon: String?
    let shows: [Show]
}

// MARK: - Mockup
extension Service {
    static let servicesMockup: [Service] = [
        Service(
            name: "Apple TV",
            logo: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSKiydsVKhEM4kadr-wzHD1tl03Lg_V7GfWDw&s",
            favIcon: "https://images.vexels.com/content/129234/preview/apple-logo-icon-bf9728.png",
            shows: [
                Show(
                    name: "Ted Lasso",
                    info: "Contratan a un entrenador estadounidense de fútbol americano bastante peculiar para dirigir a un club de la Primera División de fútbol de Inglaterra. Sin ningún tipo experiencia, debe ingeniarse un plan muy a su estilo para alcanzar el éxito.",
                    picUrl: "https://resizing.flixster.com/t4Cn-OLEM1zy6sUSNxChzYh_CaE=/ems.cHJkLWVtcy1hc3NldHMvdHZzZWFzb24vUlRUVjk1NDk5Ny53ZWJw"
                ),
                Show(
                    name: "Silo",
                    info: "En un futuro tóxico y en ruinas, existe una comunidad en un gigantesco silo subterráneo que se hunde a cientos de pisos de profundidad. Allí, la gente vive en una sociedad llena de normas que creen destinadas a protegerles.",
                    picUrl: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQmlGWbwt7YF5BzpNvcwmZApedaXbzt62CQzoAAtSQsmrWpZslIktD0jVYp8yiPILmnPj4&usqp=CAU"
                )
            ]
        ),

        Service(
            name: "Netflix",
            logo: "https://1000marcas.net/wp-content/uploads/2020/01/Netflix-logo.png",
            favIcon: "https://static.vecteezy.com/system/resources/previews/020/335/987/original/netflix-logo-netflix-icon-free-free-vector.jpg",
            shows: [
                Show(
                    name: "Dark",
                    info: "La desaparición de dos niños muestra los vínculos entre cuatro familias y expone el pasado de una pequeña ciudad.",
                    picUrl: "https://pics.filmaffinity.com/Dark_Serie_de_TV-111203947-large.jpg"
                ),
                Show(
                    name: "The Umbrella Academy",
                    info: "Una familia disfuncional de superhéroes se reúne para resolver el misterio de la muerte de su padre y la amenaza del apocalipsis.",
                    picUrl: "https://spettacolo.periodicodaily.com/wp-content/uploads/2021/02/The-Umbrella-Academy-2019.png"
                ),
                Show(
                    name: "Anne with an E",
                    info: "En la década de 1890, una niña huérfana de 13 años es enviada por error a vivir con hermanos mayores a la Isla del Príncipe Eduardo.",
                    picUrl: "https://at-vie-1-vgn-prod-api-tvmedia.sos-at-vie-1.exoscale-cdn.com/originals/m1xvw8wyow2j9emo983fyymxevdrja.jpg"
                ),
                Show(
                    name: "Stranger Things",
                    info: "Cuando un niño desaparece, sus amigos, la familia y la policía se ven envueltos en una serie de eventos misteriosos al tratar de encontrarlo. Su ausencia coincide con el avistamiento de una criatura terrorífica y la aparición de una extraña niña.",
                    picUrl: "https://es.web.img3.acsta.net/pictures/17/10/23/14/24/5968627.jpg"
                ),
            ]
        ),

        Service(
            name: "Max",
            logo: "https://upload.wikimedia.org/wikipedia/commons/thumb/c/ce/Max_logo.svg/2560px-Max_logo.svg.png",
            favIcon: "https://logodownload.org/wp-content/uploads/2024/03/max-logo-0.png",
            shows: [
                Show(
                    name: "Game of Thrones",
                    info: "El libro mejor vendido de la serie 'A Song of Ice and Fire' escrito por George R.R, es llevado a la pantalla chica cuando HBO decide recrear esta historia épica de fantasía. Es la descripción de dos familias poderosas, reyes y reinas, caballeros y renegados, hombres falsos y honestos, haciendo parte de un juego mortal por el control de los Siete Reinados de Westeros y por sentarse en el trono más alto. Martin es el co productor ejecutivo y uno de los escritores de la serie que fue filmada en el Norte de Irlanda y Malta.",
                    picUrl: "https://m.media-amazon.com/images/M/MV5BN2IzYzBiOTQtNGZmMi00NDI5LTgxMzMtN2EzZjA1NjhlOGMxXkEyXkFqcGdeQXVyNjAwNDUxODI@._V1_.jpg"
                ),
                Show(
                    name: "House of the Dragon",
                    info: "La historia de la familia Targaryen, 200 años antes de los eventos que tuvieron lugar en 'Game of Thrones'.",
                    picUrl: "https://media.gq.com.mx/photos/62b3316855c3e87dbdd42871/master/w_1600%2Cc_limit/house%2520of%2520dragon.jpg"
                ),
            ]
        ),

        Service(
            name: "Prime Video",
            logo: "https://1000marcas.net/wp-content/uploads/2023/01/Amazon-Prime-Video-Logо.png",
            favIcon: "https://image.pngaaa.com/361/480361-middle.png",
            shows: [
                Show(
                    name: "The Boys",
                    info: "Cuando los superhéroes abusan de sus superpoderes en lugar de usarlos para el bien, unos 'muchachos' se embarcan en una búsqueda heroica para exponer sus secretos.",
                    picUrl: "https://www.zerkalospettacolo.com/wp-content/uploads/2024/02/IMG_3198.jpeg"
                )
            ]
        ),
    ]
}
