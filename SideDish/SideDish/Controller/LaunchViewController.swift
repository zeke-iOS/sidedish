//
//  LaunchViewController.swift
//  SideDish
//
//  Created by 양준혁 on 2021/04/29.
//

import UIKit

class LaunchViewController: UIViewController {

    var imageView: UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 330, height: 190))
        imageView.image = UIImage(named: "codeSquad")
        imageView.contentMode = .scaleAspectFit

        return imageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(imageView)
        
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        imageView.center = view.center
        DispatchQueue.main.asyncAfter(deadline: .now()+0.7) {
            self.animate()
        }
    }

    private func animate() {
        UIView.animate(withDuration: 1) {
            let size = self.view.frame.size.width * 3
            let diffX = size - self.view.frame.size.width
            let diffY = self.view.frame.size.height - size
            self.imageView.frame = CGRect(
                x: -(diffX/2),
                y: diffY/2,
                width: size,
                height: size)
            
        }
        UIView.animate(withDuration: 2) {
            self.imageView.alpha = 0
        } completion: { done in
            if done {
                self.performSegue(withIdentifier: "login", sender: self)
            }
        }
    }
    
}
