//
//  SelectFirstViewController.swift
//  Tamagotchi
//
//  Created by 김윤우 on 6/7/24.
//

import UIKit

class SelectFirstViewController: UIViewController {
    
    static let identifier = "SelectFirstViewController"
    
    let tamagotchiList:[Tamagotchi] = Tamagotchi.list
    
    var collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpUI()
        setUPCollectionView()
        
    }
    
    func setUPCollectionView() {
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: CollectionViewCell.identifier)
        
        view.addSubview(collectionView)
        
        collectionView.snp.makeConstraints {
            $0.edges.equalToSuperview()
            
        }
        
    }
    
    func setUpUI() {
        
        view.backgroundColor = UIColor(red: 245/255, green: 252/255, blue: 252/255, alpha: 1)
        navigationItem.title = "다마고치 선택하기"
        
    }
}

extension SelectFirstViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return tamagotchiList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell.identifier, for: indexPath) as! CollectionViewCell
        
        let data =  tamagotchiList[indexPath.row]
        cell.setupCell(name: data.name, imageName: data.image)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let data =  tamagotchiList[indexPath.row]
        let alertVc = AlertViewController(data:data)
        
        present(alertVc, animated: true)
    }
}
extension SelectFirstViewController: UICollectionViewDelegateFlowLayout {
    
    // 한 cell당 크기
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: UIScreen.main.bounds.width / 3 - 10 , height: 140)
    }
    
    // cell 위 아래 간격
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 2
    }
}
