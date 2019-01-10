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
    private var _evoNextName : String!
    private var _evoNextID : String!
    private var _evoNextLevel : String!
    private var _pokemonURL : String!
    
    var nextEvoName : String {
        if _evoNextName == nil {
            _evoNextName = ""
        }
        
        return _evoNextName
    }
    
    var nextEvoID : String {
        if _evoNextID == nil {
            _evoNextID = ""
        }
        
        return _evoNextID
    }
    
    var nextEvoLevel : String {
        if _evoNextLevel == nil {
            _evoNextLevel = ""
        }
        
        return _evoNextLevel
    }
    
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
                
                
                if let types = dict["types"] as? [Dictionary<String, String>], types.count > 0 {
                    if let name = types[0]["name"] {
                        self._type = name.capitalized
                    }
                    
                    if types.count > 1 {
                        for x in 1...types.count - 1 {
                            if let name = types[x]["name"] {
                                self._type! += "/\(name.capitalized)"
                            }
                        }
                    }
                    
                } else {
                    self._type = ""
                }
                
                if let descArr = dict["descriptions"] as? [Dictionary<String, String>] , descArr.count > 0 {
                    
                    if let url = descArr[0]["resource_uri"] {
                        Alamofire.request(getUrl() + url).responseJSON { response in
                            if let descDict = response.result.value as? Dictionary<String, AnyObject> {
                            
                                if let description = descDict["description"] as? String {
                                    let newDescription = description.replacingOccurrences(of: "POKMON", with: "Pokemon")
                                    self._description = newDescription
                                }
                                
                            }
                            completed()
                        }
                    }
                } else {
                    self._description = ""
                }
                
                if let evoDict = dict["evolutions"] as? [Dictionary<String, AnyObject>], evoDict.count > 0 {
                    if let nextEvo = evoDict[0]["to"] as? String {
                        if nextEvo.range(of: "mega") == nil {
                            self._evoNextName = nextEvo
                            
                            if let uri = evoDict[0]["resource_uri"] as? String {
                                let newUri = uri.replacingOccurrences(of: "/api/v1/pokemon/", with: "")
                                let nextEvoID = newUri.replacingOccurrences(of: "/", with: "")
                                self._evoNextID = nextEvoID
                                
                                if let lvlExists = evoDict[0]["level"] {
                                    if let lvl = lvlExists as? Int {
                                        self._evoNextLevel = "\(lvl)"
                                    }
                                }
                                
                            }
                        }
                    }
                } else {
                    
                }
            
            
            }
            
            
            completed()
        }
    }
}
