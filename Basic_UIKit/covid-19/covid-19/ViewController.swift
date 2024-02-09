//
//  ViewController.swift
//  covid-19
//
//  Created by 이희웅 on 2023/06/13.
//
import UIKit
import DGCharts
import Alamofire


class ViewController: UIViewController {

    @IBOutlet var totalCaseLabel: UILabel!
    @IBOutlet var newCaseLabel: UILabel!
    @IBOutlet var pieChartView: PieChartView!
    
    @IBOutlet var labelStackView: UIStackView!
    @IBOutlet var indicatorView: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 인디케이터 view 애니메이션 start
        self.toggleLoadingState(true)
        
        self.fetchCovidOverview(completionHandler: {[weak self] result in
            guard let self = self else { return }
            
            self.toggleLoadingState(false)
            
            switch result {
            case let .success(result):
                configureStackView(koreaCovidOverview: result.korea)
                configureChartView(covidOverviewList: makeCovidOverviewList(cityCovidOverview: result))
                debugPrint("success : \(result)")
            case let .failure(result):
                debugPrint("failure : \(result)")
            }
        })
        // Do any additional setup after loading the view.
    }
    
    
    /**
     
     */
    func toggleLoadingState(_ isLoading: Bool){
        if isLoading == false{
            self.indicatorView.stopAnimating()
            self.indicatorView.isHidden = true
            self.labelStackView.isHidden = false
            self.pieChartView.isHidden = false
        }else{
            self.labelStackView.isHidden = true
            self.pieChartView.isHidden = true
            self.indicatorView.isHidden = false
            self.indicatorView.startAnimating()
        }
    }
    
    func makeCovidOverviewList(
        cityCovidOverview:CityCovidOverview) -> [CovidOverview]{
            return[
                cityCovidOverview.seoul,
                cityCovidOverview.busan,
                cityCovidOverview.daegu,
                cityCovidOverview.gwangju,
                cityCovidOverview.daejeon,
                cityCovidOverview.ulsan,
                cityCovidOverview.sejong,
                cityCovidOverview.gyeonggi,
                cityCovidOverview.chungbuk,
                cityCovidOverview.chungnam,
                cityCovidOverview.jeonbuk,
                cityCovidOverview.jeonnam,
                cityCovidOverview.gyeongbuk,
                cityCovidOverview.gyeongnam,
                cityCovidOverview.jeju
            ]
        }
    
    func configureChartView(covidOverviewList: [CovidOverview]){
        self.pieChartView.delegate = self
        let entries = covidOverviewList.compactMap{[weak self] overview -> PieChartDataEntry? in
            guard let self = self else { return nil }
            return PieChartDataEntry(
                value: self.removeFormatString(string: overview.newCase),
                label: overview.countryName,
                data: overview
            )
        }
        
        let dataSet = PieChartDataSet(
            entries: entries,
            label: "코로나 발생 현황"
        )
        dataSet.sliceSpace = 1
        dataSet.entryLabelColor = .black  // 차트의 각 값에 대한 레이블 컬러
        dataSet.valueTextColor = .black   // 차트 내 텍스트 컬러
        dataSet.xValuePosition = .outsideSlice
        dataSet.valueLinePart1OffsetPercentage = 0.8
        dataSet.valueLinePart1Length = 0.2
        dataSet.valueLinePart2Length = 0.3
        
        dataSet.colors =
        ChartColorTemplates.vordiplom()
        + ChartColorTemplates.joyful()
        + ChartColorTemplates.liberty()
        + ChartColorTemplates.material()
        + ChartColorTemplates.pastel()
        
        self.pieChartView.data = PieChartData(dataSet: dataSet)
        
        // 처음실행할 때 애니메이션을 주고 싶다면 이런식으로
        self.pieChartView.spin(duration: 0.3, fromAngle: self.pieChartView.rotationAngle, toAngle: self.pieChartView.rotationAngle+80)
    }
    
    func removeFormatString(string:String) -> Double{
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        return formatter.number(from: string)?.doubleValue ?? 0
    }
    
    func configureStackView(koreaCovidOverview:CovidOverview){
        self.totalCaseLabel.text = "\(koreaCovidOverview.totalCase)명"
        self.newCaseLabel.text = "\(koreaCovidOverview.newCase)명"
    }
    
    /**
            Result :  enum Result<Success, Failure> where Failure : Error
     */
    func fetchCovidOverview(completionHandler: @escaping (Result<CityCovidOverview, Error>) -> Void){
        let url = "https://api.corona-19.kr/korea/country/new"
        let param = ["serviceKey": "QqRWLlmXEtCikr1ZdOYczy5e6Bwn2SMIF"]
        
        AF.request(url, method: .get, parameters: param)
            .responseData(completionHandler: { response in
                switch response.result{
                case let .success(data):
                    do{
                        let decoder = JSONDecoder()
                        let result = try decoder.decode(CityCovidOverview.self, from: data)
                        completionHandler(.success(result))
                    } catch{
                        completionHandler(.failure(error))
                    }
                    
                case let .failure(error):
                    completionHandler(.failure(error))
                }
        }) // 클로저 종료
    }
}

extension ViewController : ChartViewDelegate {
    func  chartValueSelected(_ chartView: ChartViewBase, entry: ChartDataEntry, highlight: Highlight) {
        
        // 스토리 보드 내 있는 콤포넌트 인스턴스 변수를 가져오는 법
        // Identifier 선언을 통해 지정한 string 을 통해 가져올 수 있다.
        
        guard let covidDetailViewController = self.storyboard?.instantiateViewController(identifier: "Covid19DetailViewController") as? Covid19DetailViewController else {return}
        guard let covidOverview = entry.data as? CovidOverview else {return}
        
        covidDetailViewController.covidOverview = covidOverview
        self.navigationController?.pushViewController(covidDetailViewController, animated: true)
        
        
        
    }
}
