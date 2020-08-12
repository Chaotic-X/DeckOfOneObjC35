//
//  AXLCardViewController.swift
//  DeckOfOneObjC35
//
//  Created by Alex Lundquist on 8/11/20.
//

import UIKit

class AXLCardViewController: UIViewController {

    @IBOutlet weak var cardNameValueLabel: UILabel!
    @IBOutlet weak var cardImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

       
    }
    
    @IBAction func drawCardButtonTapped(_ sender: Any) {
        AXLCardController.sharedInstance().fetchNewCard { (card) in
            DispatchQueue.main.async {
                self.updateViewWIthCard(for: card[0])
                self.cardNameValueLabel.text = " \(card.first?.value ?? "") of \(card.first?.suit ?? "")"
            }
        }
    }
    
    func updateViewWIthCard(for card: AXLCard){
        AXLCardController.sharedInstance().fetchCardImage(card) { (cardImage) in
            DispatchQueue.main.async {
                self.cardImageView.image = cardImage
            }
        }
    }
}

