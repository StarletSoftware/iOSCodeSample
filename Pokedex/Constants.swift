//
//  Constants.swift
//  Pokedex
//
//  Created by Nikita Nikitin on 6/21/17.
//  Copyright © 2017 ninise. All rights reserved.
//

import Foundation

let MAIN_URL = "http://pokeapi.co"
let URL_BASE = "\(MAIN_URL)/api/v1/"
let URL_POKEMON = "pokemon/"

func getPokemonURL(_ id : Int) -> String {
        return "\(URL_BASE)pokemon/\(id)/"
}

func getUrl() -> String {
    return MAIN_URL
}


typealias DownloadComplete = () -> ()
