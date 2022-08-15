//
//  ViewController.swift
//  ZoundTest
//
//  Created by Muhammad Awaab on 14/08/2022.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var mainTableView: UITableView!
    @IBOutlet weak var currencySegmentedControl: UISegmentedControl!
    
   private var viewModel: MainViewModelProtocol = MainViewModel()
    
    // MARK: - View Life cycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        bindWithViewModel()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    // MARK: - ViewModel Bindings
    func bindWithViewModel() {
        mainTableView.register(UINib(nibName: viewModel.getTableCellIdentifier(), bundle: nil), forCellReuseIdentifier: viewModel.getTableCellIdentifier())
        
        self.viewModel.updateView = {[weak self] in
            DispatchQueue.main.async {
                self?.mainTableView.reloadData()
            }
        }
        self.viewModel.fetchParsedDataForDisplay()
    }
    @IBAction func currencySegmentValueChanged(_ sender: Any) {
        if currencySegmentedControl.selectedSegmentIndex == 0 {
            SharedManager.shared.isShowingUSD = true
        } else {
            SharedManager.shared.isShowingUSD = false
        }
        self.mainTableView.reloadData()
    }
    
}

// MARK: - TableView methods

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRowsToDisplay()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: viewModel.getTableCellIdentifier(), for: indexPath) as! ItemCell
        cell.cellViewModel = viewModel.getCellViewModel(at: indexPath)
        return cell
    }
    
}

