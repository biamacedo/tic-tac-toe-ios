//
//  ViewController.swift
//  Tic Tac Toe
//
//  Created by BEATRIZ MACEDO on 9/27/15.
//  Copyright © 2015 Beatriz Macedo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // 1 = circles / 2 = crosses
    var activePlayer = 1
    
    var gameActive = true
    
    var gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]

    @IBOutlet weak var button: UIButton!
    
    var winningCombinations = [[0,1,2], [3,4,5], [6,7,8], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]
    
    @IBAction func buttonPressed(sender: AnyObject) {
        
        if gameState[sender.tag] == 0 && gameActive {
            
            var image = UIImage()
            
            gameState[sender.tag] = activePlayer
            
            if activePlayer == 1 {
                
                image = UIImage(named: "circle.png")!
                
                activePlayer = 2
                
            } else {
                image = UIImage(named: "cross.png")!
                
                activePlayer = 1
            }
            
            sender.setImage(image, forState: .Normal)
            
            
            for combination in winningCombinations {
                if gameState[combination[0]] != 0 && gameState[combination[0]] == gameState[combination[1]] && gameState[combination[1]] == gameState[combination[2]] {
                    
                    var labelText = "Noughts has won!"
                    
                    if gameState[combination[0]] == 2 {
                        labelText = "Crosses has won!"
                    }
                    
                    print(labelText)
                    gameOverLabel.text = labelText
                    
                    UIView.animateWithDuration(0.5, animations: { () -> Void in
                        
                        self.gameOverLabel.hidden = false
                        self.playAgainButton.hidden = false
                        
                        self.gameOverLabel.center = CGPointMake(self.gameOverLabel.center.x + 400, self.gameOverLabel.center.y)
                        self.playAgainButton.center = CGPointMake(self.playAgainButton.center.x + 400, self.playAgainButton.center.y)

                    })
                    
                    gameActive = false
                }
            }
            
        }
        
    }
    
    @IBOutlet weak var gameOverLabel: UILabel!
    @IBOutlet weak var playAgainButton: UIButton!
    
    @IBAction func playAgainPressed(sender: AnyObject) {
        
        activePlayer = 1
        
        gameActive = true
        
        gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
        
        var button : UIButton
        
        for var i = 0; i < 9; i++ {
            
            button = view.viewWithTag(i) as! UIButton
            button.setImage(nil, forState: .Normal)
        }
        
        gameOverLabel.hidden = true
        playAgainButton.hidden = true
        
        gameOverLabel.center = CGPointMake(gameOverLabel.center.x - 400, gameOverLabel.center.y)
        playAgainButton.center = CGPointMake(playAgainButton.center.x - 400, playAgainButton.center.y)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        gameOverLabel.hidden = true
        playAgainButton.hidden = true
        
        gameOverLabel.center = CGPointMake(gameOverLabel.center.x - 400, gameOverLabel.center.y)
        playAgainButton.center = CGPointMake(playAgainButton.center.x - 400, playAgainButton.center.y)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

