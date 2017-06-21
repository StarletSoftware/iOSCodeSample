//
//  Constants.swift
//  Pokedex
//
//  Created by Nikita Nikitin on 6/21/17.
//  Copyright © 2017 ninise. All rights reserved.
//

import Foundation


let URL_BASE = "http://pokeapi.co/api/v1/"
let URL_POKEMON = "pokemon/"

func getPokemonURL(_ id : Int) -> String {
        return "\(URL_BASE)pokemon/\(id)/"
}


typealias DownloadComplete = () -> ()
