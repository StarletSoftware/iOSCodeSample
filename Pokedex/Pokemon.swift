//
//  Pokemon.swift
//  Pokedex
//
//  Created by Nikita Nikitin on 6/14/17.
//  Copyright © 2017 ninise. All rights reserved.
//

import Foundation
import Alamofire

class Pokemon {
    
    private var _name : String!
    private var _pokedexID : Int!
    private var _description : String!
    private var _type : String!
    private var _defense : String!
    private var _height : String!
    private var _weight : String!
    private var _baseAttack : String!
    private var _evoNext : String!
    private var _pokemonURL : String!
    
    var name : String {
        return _name;
    }
    
    var pokedexID : Int {
        return _pokedexID
    }
    
    var description : String {
        if _description == nil {
            _description = ""
        }
        
        return _description
    }

    
    var type : String {
        if _type == nil {
            _type = ""
        }
        
        return _type
    }
    
    
    var defense : String {
        if _defense == nil {
            _defense = ""
        }
        
        return _defense
    }

    
    var height : String {
        if _height == nil {
            _height = ""
        }
        
        return _height
    }
    
    
    var weight : String {
        if _weight == nil {
            _weight = ""
        }
        
        return _weight
    }
    
    
    var baseAttack : String {
        if _baseAttack == nil {
            _baseAttack = ""
        }
        
        return _baseAttack
    }
    

    var evoNext : String {
        if _evoNext == nil {
            _evoNext = ""
        }
        
        return _evoNext
    }
    
    init(name : String, pokedexID : Int) {
        
        self._name = name;
        self._pokedexID = pokedexID;
        self._pokemonURL = getPokemonURL(pokedexID)
    }
    
    func downloadPokemonDetail(completed : @escaping DownloadComplete) {
        
        Alamofire.request(_pokemonURL).responseJSON { response in
            
            if let dict = response.result.value as? Dictionary<String, AnyObject> {
            
                if let weight = dict["weight"] as? String {
                    self._weight = weight
                }
                
                if let height = dict["height"] as? String {
                    self._height = height
                }
                
                if let attack = dict ["attack"] as? Int {
                    self._baseAttack = "\(attack)"
                }
                
                if let defense = dict ["defense"] as? Int {
                    self._defense = "\(defense)"
                }
                
                print(self._baseAttack)
                print(self._defense)
            }
            
            
            completed()
        }
    }
}
