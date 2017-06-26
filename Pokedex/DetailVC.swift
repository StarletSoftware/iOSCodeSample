//
//  DetailVC.swift
//  Pokedex
//
//  Created by Nikita Nikitin on 6/17/17.
//  Copyright © 2017 ninise. All rights reserved.
//

import UIKit

class DetailVC: UIViewController {

    var pokemon : Pokemon!
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var mainImg: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var defenseLabel: UILabel!
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var pokedexIDLabel: UILabel!
    @IBOutlet weak var baseAttackLabel: UILabel!
    @IBOutlet weak var currentEvoImg: UIImageView!
    @IBOutlet weak var nextEvoImg: UIImageView!
    @IBOutlet weak var evoLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = pokemon.name
        pokedexIDLabel.text = "\(pokemon.pokedexID)"
        
        let image = UIImage(named: "\(pokemon.pokedexID)")
        mainImg.image = image
        currentEvoImg.image = image
        
        pokemon.downloadPokemonDetail {
            self.updateUI()
        }
    }
    
    func updateUI() {
        defenseLabel.text = pokemon.defense
        baseAttackLabel.text = pokemon.baseAttack
        weightLabel.text = pokemon.weight
        heightLabel.text = pokemon.height
        typeLabel.text = pokemon.type
        descriptionLabel.text = pokemon.description
        
        if pokemon.nextEvoID == "" {
            evoLabel.text = "No Evolutions"
            nextEvoImg.isHidden = true
        } else {
            nextEvoImg.isHidden = false
            print(pokemon.nextEvoID)
            nextEvoImg.image = UIImage(named: pokemon.nextEvoID)
            let str = "Next Evolution: \(pokemon.nextEvoName) - LVL \(pokemon.nextEvoLevel)"
            evoLabel.text = str
        }
    }

    @IBAction func backBtnPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
}
