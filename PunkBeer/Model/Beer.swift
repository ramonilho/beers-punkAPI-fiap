//
//  Beer.swift
//  PunkBeer
//
//  Created by Ramon Honorio on 30/11/17.
//  Copyright © 2017 Ramonilho. All rights reserved.
//

import UIKit

class Beer {
    // identifier
    var id: Int
    
    // nome da breja
    var name: String
    
    // slogan
    var tagline: String
    
    // descricao
    var description: String
    
    // imagem
    var imageURL: String
    
    // teor alcoolico
    var abv: Float
    
    // escala de amargor
    var ibu: Float
    
    init(id: Int, name: String, tagline: String, description: String, imageURL: String, abv: Float, ibu: Float) {
        
        self.id = id
        self.name = name
        self.tagline = tagline
        self.description = description
        self.imageURL = imageURL
        self.abv = abv
        self.ibu = ibu
        
    }
}
