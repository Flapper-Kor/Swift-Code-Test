import UIKit
import Kingfisher
import Firebase
import FirebaseFirestoreSwift
import FirebaseDatabase

class CardListViewController: UITableViewController{
    var ref: DatabaseReference!  // firebase realtime database
    var db = Firestore.firestore()
    
    var creditCardList: [CreditCard] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nibName = UINib(nibName: "CardListCell", bundle: nil)
        tableView.register(nibName, forCellReuseIdentifier: "CardListCell")
        
        // 실시간 데이터 읽기 - realtime Database
        
//        ref = Database.database().reference()
//
//        ref.observe(.value) { dataSnapshot in
//            guard let value = dataSnapshot.value as? [String:[String:Any]] else {return}
//
//            do{
//                let jsonData = try JSONSerialization.data(withJSONObject: value)
//                let cardData = try JSONDecoder().decode([String:CreditCard].self, from: jsonData)
//                let cardList = Array(cardData.values)
//                self.creditCardList = cardList.sorted { $0.rank < $1.rank }
//
//                DispatchQueue.main.async{
//                    self.tableView.reloadData()
//                }
//            }catch let error{
//                print("ERROR JSON parsing \(error.localizedDescription)")
//            }
//        }
        
        // 실시간 데이터 읽기 - firestore database
        db.collection("creditCardList").addSnapshotListener { snapshot, error in
            guard let documents = snapshot?.documents else {
                print("Error Firestore fetching document: \(String(describing: error))")
                return
            }

            self.creditCardList = documents.compactMap { doc -> CreditCard? in
                do {
                    let jsonData = try JSONSerialization.data(withJSONObject: doc.data(), options: [])
                    let creditCard = try JSONDecoder().decode(CreditCard.self, from: jsonData)
                    return creditCard
                } catch let error {
                    print("Error json parsing \(error)")
                    return nil
                }
            }.sorted { $0.rank < $1.rank }

            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return creditCardList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CardListCell", for: indexPath)
                as? CardListCell else { debugPrint("here"); return UITableViewCell() }
        
        cell.rankLabel.text = "\(creditCardList[indexPath.row].rank)위"
        cell.promotionLabel.text = "\(creditCardList[indexPath.row].promotionDetail.amount)만원 증정"
        cell.cardNameLabel.text = "\(creditCardList[indexPath.row].name)"
        
        let imageURL = URL(string: creditCardList[indexPath.row].cardImageURL)
        cell.CardImageView.kf.setImage(with: imageURL)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        guard let detailViewController = storyboard.instantiateViewController(identifier: "CardDetailViewController") as? CardDetailViewController else { return }
        
        detailViewController.promotionDetail = creditCardList[indexPath.row].promotionDetail
        self.show(detailViewController, sender: nil)
        
//        // 실시간 데이터베이스 쓰기
//        // 데이터베이스의 구조(ID) 값을 확실하게 알고 있을 경우
//        let cardID = creditCardList[indexPath.row].id
////        ref.child("Item\(cardID)/isSelected").setValue(true)
//
//        // 데이터 페이스의 구조(ID) 값을 확실하게 알고 있지 않을 경우
//        ref.queryOrdered(byChild: "id").queryEqual(toValue: cardID).observe(.value) { [weak self] dataSnapshot in
//            guard let self = self,
//                  let value = dataSnapshot.value as? [String:[String:Any]],
//                  let key = value.keys.first else {return}
//            self.ref.child("\(key)/isSelected").setValue(true)
//        }
        
        // firestore 데이터베이스 쓰기
        let cardID = creditCardList[indexPath.row].id
        
        //option1 : updateData 함수는 key 값이 있으면 value 덮어쓰고 없으면 key:value 쌍을 생성
//        self.db.collection("creditCardList").document("card\(cardID)").updateData(["isSelected": true])
        
        //option2
        self.db.collection("creditCardList").whereField("id", isEqualTo: cardID).getDocuments { snapshot, error in
            guard let document = snapshot?.documents.first else {
                print("Error Firestore fetching document: \(String(describing: error))")
                return
            }
            
            document.reference.updateData(["isSelected": true])
        }
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            /*Firebase Realtime Database 삭제
            let cardID = creditCardList[indexPath.row].id
            self.ref.queryOrdered(byChild: "id").queryEqual(toValue: cardID).observe(.value) {[weak self] snapshot in
                guard let self = self,
                      let value = snapshot.value as? [String: [String: Any]],
                      let key = value.keys.first else { return }
                
                self.ref.child(key).removeValue()
            }
            */
            
            /*Firebase Firestore 삭제*/
            let cardID = creditCardList[indexPath.row].id
            
            //option1 (id 알고 있을 경우)
//            self.db.collection("creditCardList").document("card\(cardID)").delete()
            
            //option2
            self.db.collection("creditCardList").whereField("id", isEqualTo: cardID).getDocuments { snapshot, error in
                guard let document = snapshot?.documents.first else {
                    print("Error Firestore fetching document: \(String(describing: error))")
                    return
                }

                document.reference.delete()
            }
        }
    }
}
