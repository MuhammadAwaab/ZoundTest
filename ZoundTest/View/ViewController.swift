//
//  ViewController.swift
//  ZoundTest
//
//  Created by Muhammad Awaab on 14/08/2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var mainTableView: UITableView!

    var viewModel: MainViewModelProtocol = MainViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        bindWithViewModel()

    }

    func bindWithViewModel() {
        mainTableView.register(UINib(nibName: viewModel.getTableCellIdentifier(), bundle: nil), forCellReuseIdentifier: viewModel.getTableCellIdentifier())
       
        self.viewModel.updateView = {[weak self] in
            DispatchQueue.main.async {
                self?.mainTableView.reloadData()
            }
        }
        self.viewModel.fetchParsedDataForDisplay()
    }

}

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

