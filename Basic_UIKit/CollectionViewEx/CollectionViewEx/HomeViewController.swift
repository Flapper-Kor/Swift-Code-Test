//
//  HomeViewController.swift
//  CollectionViewEx
//
//  Created by Slash on 2023/07/27.
//
import UIKit
import SwiftUI

class HomeViewController: UICollectionViewController {
    var contents: [Content] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 네비게이션 설정
        navigationController?.navigationBar.backgroundColor = .clear
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.hidesBarsOnTap = true
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(imageLiteralResourceName: "netflix_icon"), style: .plain, target: nil, action: nil)
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "person.crop.circle"), style: .plain, target: nil, action: nil)
        
        // Data 설정, 가져오기
        contents = getContents()
        
        // collectionView Item(Cell) 설정
        collectionView.register(ContentCollectionViewCell.self, forCellWithReuseIdentifier: "ContentCollectionViewCell")
        collectionView.register(ContentCollectionViewHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "ContentCollectionViewHeader")
    }
    
    func getContents() -> [Content] {
        guard let path = Bundle.main.path(forResource: "Content", ofType: "plist"),
              let data = FileManager.default.contents(atPath: path),
              let list = try? PropertyListDecoder().decode([Content].self, from: data) else { return [] }
        return list
    }
}

// UICollectionView DataSource, Delegate
extension HomeViewController {
    // 섹션당 보여질 셀의 개수
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        // content plist 중 첫번째 것에 대해서는 섹션을 한개, 나머지에 대해서는 파일의 아이템 개수만큼의 섹션
        switch section {
        case 0:
            return 1
        default:
            return contents[section].contentItem.count
        }
    }
    
    // 컬렉션뷰 셀 설정
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch contents[indexPath.section].sectionType {
        case .basic, .large:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ContentCollectionViewCell", for: indexPath) as? ContentCollectionViewCell else { return UICollectionViewCell() }
            
            cell.imageView.image = contents[indexPath.section].contentItem[indexPath.row].image
            
            return cell
            
        default:
            return UICollectionViewCell()
        }
    }
    
    // 헤더 뷰 설정
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionView.elementKindSectionHeader {
            guard let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "ContentCollectionViewHeader", for: indexPath) as? ContentCollectionViewHeader else { fatalError("Could not dequeue Header") }
            
            headerView.sectionNameLabel.text = contents[indexPath.section].sectionName
            return headerView
        }
        else {
            return UICollectionReusableView()
        }
    }
    
    // 섹션 개수 설정
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return contents.count
    }
    
    // 셀 선택
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let sectionName = contents[indexPath.section].sectionName
        print("TEST \(sectionName) 섹션의 \(indexPath.row + 1)번째 콘텐츠")
    }
}

//SwiftUI를 활용한 미리보기
struct HomeViewController_Previews: PreviewProvider {
    static var previews: some View {
        Container().edgesIgnoringSafeArea(.all)
    }
    
    struct Container: UIViewControllerRepresentable {
        func makeUIViewController(context: Context) -> UIViewController {
            let layout = UICollectionViewFlowLayout()
            let homeViewController = HomeViewController(collectionViewLayout: layout)
            return UINavigationController(rootViewController: homeViewController)
        }
        func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {}
        typealias UIViewControllerType = UIViewController
    }
}
