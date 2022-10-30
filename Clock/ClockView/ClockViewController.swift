//
//  ClockViewController.swift
//  Clock
//
//  Created by Robert Huber on 10/30/22.
//

import UIKit
import Combine

class ClockViewController: UIViewController {

    @IBOutlet weak var closureTimeLabel: UILabel!
    @IBOutlet weak var observableTimeLabel: UILabel!
    @IBOutlet weak var combineTimeLabel: UILabel!
    var cancellables: Set<AnyCancellable> = []
    
    var viewModel = ClockViewModel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setBindings()
        startTimer()
    }
    
    func setBindings() {
        viewModel.didChangeTime = { [unowned self] viewModel in
            self.closureTimeLabel.text = viewModel.closureTime
        }
        viewModel.observableTime.bind { [unowned self] time in
            self.observableTimeLabel.text = time
        }
        viewModel.$combineTime
            .compactMap { String($0) }
            .assign(to: \.text, on: combineTimeLabel)
            .store(in: &cancellables)
    }
    
    func startTimer() {
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            self.viewModel.checkTime()
        }
    }
}
