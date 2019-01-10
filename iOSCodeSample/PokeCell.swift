//
//  PokeCell.swift
//  Pokedex
//
//  Created by Nikita Nikitin on 6/14/17.
//  Copyright © 2017 ninise. All rights reserved.
//

import UIKit

class PokeCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView : UIImageView!
    @IBOutlet weak var label : UILabel!
    
    var pokemon : Pokemon!
    
    required init?(coder aDecoder : NSCoder) {
        super.init(coder: aDecoder)
        
        layer.cornerRadius = 5.0
    }
    
    func configureCell(_ pokemon : Pokemon) {
        self.pokemon = pokemon;
        
        label.text = self.pokemon.name.capitalized
        imageView.image = UIImage(named: "\(self.pokemon.pokedexID)")
    }
    
}
