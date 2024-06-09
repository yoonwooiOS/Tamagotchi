//
//  MainViewController.swift
//  Tamagotchi
//
//  Created by 김윤우 on 6/9/24.
//

import UIKit
import SnapKit

class MainViewController: UIViewController {

    let bubbleImage = UIImageView()
    let imageLabel = UILabel()
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    let statusLabel = UILabel()
    let riceTextField = UITextField()
    let waterTextField = UITextField()
    let riceButton = UIButton()
    let waterButton = UIButton()
    
    let cvInset = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpHrierachy()
        setUpLayout()
        setUpCollectionView()
        setUpUI()
        
        print("main")
//        print(Tamagotchi.savedImage)
//        print(Tamagotchi.savedName)
        
    }
    
    func setUpHrierachy() {
        
        view.addSubview(bubbleImage)
        bubbleImage.addSubview(imageLabel)
        view.addSubview(collectionView)
        view.addSubview(statusLabel)
        view.addSubview(riceTextField)
        view.addSubview(waterTextField)
        view.addSubview(riceButton)
        view.addSubview(waterButton)
        
    }
    
    func setUpLayout() {
        bubbleImage.snp.makeConstraints {
            
            $0.top.equalTo(view.safeAreaLayoutGuide).inset(48)
            $0.leading.trailing.equalTo(view.safeAreaLayoutGuide).inset(40)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(120)
            $0.height.equalTo(200)
        }
        
        imageLabel.snp.makeConstraints {
            
            $0.top.equalTo(bubbleImage.snp.top).offset(28)
            $0.horizontalEdges.equalTo(bubbleImage).inset(20)
            $0.centerX.equalTo(bubbleImage)
            $0.bottom.equalTo(bubbleImage.snp.bottom).inset(40)
        }
        collectionView.snp.makeConstraints {
            
            $0.top.equalTo(imageLabel.snp.bottom).offset(16)
            $0.centerX.equalToSuperview()
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.size.equalTo(400)
        }
        
    }
    
    
    func setUpUI() {
        
        navigationItem.title = "방실방실 다마고치"
        view.backgroundColor = .white
        bubbleImage.image = UIImage(named: "bubble")
        imageLabel.text = "복습 안하셨다구요? 지금 잠이 오세요? 대장님?"
        imageLabel.numberOfLines = 0
        imageLabel.textAlignment = .center
        imageLabel.backgroundColor = .cyan
        collectionView.backgroundColor = .brown
        
    }
    
    func setUpCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
//        collectionView.contentInset = cvInset
        collectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: CollectionViewCell.identifier)
        
    }
    
}

extension MainViewController: UICollectionViewDelegate, UICollectionViewDataSource {
   
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 1
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell.identifier, for: indexPath) as! CollectionViewCell
        
        guard let image = Tamagotchi.savedImage, let name = Tamagotchi.savedName else { return cell }
        
        cell.characterImageView.image = UIImage(named: image)
        cell.nameLabel.text = name
        
        return cell
    }
    
    
}

extension MainViewController:  UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: collectionView.bounds.width, height:  collectionView.bounds.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        return cvInset
    }
}
