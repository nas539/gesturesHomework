//
//  ThisTableViewCell.swift
//  GesturesHomework
//
//  Created by MCS on 4/24/19.
//  Copyright © 2019 MCS. All rights reserved.
//

import UIKit

enum Colors: Int  {
  case red0
  case red1
  case blue0
  case blue1
  case green0
  case green1
}
var numGenerator: () -> CFloat = {CFloat(arc4random_uniform(255)/255)}
class ThisTableViewCell: UITableViewCell {
  @IBOutlet weak var ThisCollectionViewCell: UICollectionView!
  
  var colors = Colors?.self
  
  
  
  
    override func awakeFromNib() {
        super.awakeFromNib()
      ThisCollectionViewCell.dataSource = self as? UICollectionViewDataSource
      ThisCollectionViewCell.delegate = self as? UICollectionViewDelegate
      ThisCollectionViewCell.register(UINib(nibName: "ThisCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "ThisCollectionViewCell")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

  
    }
    
}

extension ThisCollectionViewCell: UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 4
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    
    guard let box = collectionView.dequeueReusableCell(withReuseIdentifier: "ThisCollectioViewCell", for: indexPath) as? ThisCollectionViewCell else {fatalError()}
    if let colors = Colors(rawValue: Int) {
      switch (colors) {
        case .red0:
          box.backgroundColor = UIColor(displayP3Red: 0, green: CGFloat(numGenerator()), blue: CGFloat(numGenerator()), alpha: 1)
        case .red1:
          box.backgroundColor = UIColor(displayP3Red: 1, green: CGFloat(numGenerator()), blue: CGFloat(numGenerator()), alpha: 1)
        case .blue0:
          box.backgroundColor = UIColor(displayP3Red: CGFloat(numGenerator()), green: CGFloat(numGenerator()), blue: 0, alpha: 1)
        case .blue1:
          box.backgroundColor = UIColor(displayP3Red: CGFloat(numGenerator()), green: CGFloat(numGenerator()), blue: 1, alpha: 1)
        case .green0:
          box.backgroundColor = UIColor(displayP3Red: CGFloat(numGenerator()), green: 0, blue: CGFloat(numGenerator()), alpha: 1)
        case .green1:
          box.backgroundColor = UIColor(displayP3Red: CGFloat(numGenerator()), green: 1, blue: CGFloat(numGenerator()), alpha: 1)
        
      }
  }
  return box
  }}

extension ThisCollectionViewCell: UICollectionViewDelegate {
  
}

extension ThisTableViewCell: UICollectionViewDelegateFlowLayout {
  
}
