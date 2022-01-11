//
//  ViewController.swift
//  GoogleSearch
//
//  Created by Алексей on 03.12.2021.
//

import UIKit

final class ViewController: UIViewController {
    @IBOutlet private weak var progressView: UIProgressView!
    @IBOutlet private weak var inputTextField: UITextField!
    @IBOutlet private weak var googleSearchButton: UIButton!
    @IBOutlet private weak var mainTableView: UITableView!
    
    private var networking = SearchRequests()
    private var dataSource: [Items] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        inputTextField.becomeFirstResponder()
    }
    
    private func setupUI() {
        toolBar()
        buttonBorderColor()
        setupTable()
        
        inputTextField.delegate = self
    }
    
    private func setupTable() {
        mainTableView.rowHeight = 120
        mainTableView.register(UINib(nibName: OneTableViewCell.description(), bundle: nil),
                               forCellReuseIdentifier: OneTableViewCell.description())
    }
    
    private func buttonBorderColor() {
        googleSearchButton.layer.borderColor = UIColor.black.cgColor
        googleSearchButton.layer.borderWidth = 0.8
        googleSearchButton.layer.cornerRadius = 5
    }
    
    private func toolBar() {
        let toolBar = UIToolbar(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 50))
        let flexibleSpase = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
        let doneButton = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(didTapDone))
        toolBar.items = [flexibleSpase, doneButton]
        toolBar.sizeToFit()
        inputTextField.inputAccessoryView = toolBar
    }
}

//MARK: Actions
private extension ViewController {
    @objc func didTapDone() {
        searchAction()
    }
    
    @IBAction func googleSearchButtonAction(_ sender: Any) {
        searchAction()
    }
}

//MARK: - API Methods
private extension ViewController {
    func searchAction() {
        guard let text = inputTextField.text, !text.isEmpty else { return }
        inputTextField.resignFirstResponder()
        
        dataSource = []
        mainTableView.reloadData()
        progressView.progress = 0
        googleSearchButton.setTitle("Stop", for: .normal)
        
        DispatchQueue.global(qos: .utility).async { [weak self] in
            self?.networking.searchRequestWith(search: text, completion: { [weak self] response, error in
                self?.googleSearchButton.setTitle("Google Search", for: .normal)
                if let error = error {
                    let alert = UIAlertController(title: error, message: nil, preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
                    self?.present(alert, animated: true, completion: nil)
                } else {
                    if let googlesearch = response?.items {
                        self?.dataSource = googlesearch
                        self?.mainTableView.reloadData()
                    }
                }
            }, progress: { [weak self] progress in
                self?.progressView.progress = progress
            })
        }
    }
}

//MARK: - UITextFieldDelegate
extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        searchAction()
        return false
    }
}

//MARK: - UITableViewDelegate, UITableViewDataSource
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
        
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = mainTableView.dequeueReusableCell(withIdentifier: OneTableViewCell.description(), for: indexPath) as! OneTableViewCell
        let modelsArray = dataSource.compactMap({TableViewCellModel(link: $0.link, title: $0.title, src: $0.pagemap?.cse_thumbnail?.first?.src)})
        cell.setupWithModel(model: modelsArray[indexPath.row])
        return cell
    } 
}

