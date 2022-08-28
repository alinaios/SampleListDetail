//
//  BaseViewController.swift
//  ListDetailSample
//
//  Created by A H on 2022-08-28.
//

import UIKit
import Combine

open class BaseViewController<T: ViewModel>: UIViewController, ViewModelled {
    open var viewModel: T?
    lazy open var errorHandler = ErrorHandler()
    var cancellable = Set<AnyCancellable>()

    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    public override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }

    override open func viewDidLoad() {
        super.viewDidLoad()

        if let viewModel = viewModel {
            bindViewModel(viewModel)
            bindError(viewModel)
        }
    }

    // VM Binding
    open func bindViewModel(_ viewModel: T) {}

    open func bindError(_ viewModel: T) {
        viewModel.$errorPublisher.sink { [weak self] error  in
            guard let error = error else {
                return
            }
            self?.handleError(error)
        }.store(in: &cancellable)
    }

    open func handleError(_ error: Error) {
        DispatchQueue.main.asyncAfter(deadline: .now()) { [weak self] in
            guard let errorMessage = self?.errorHandler.handleError(error) else {
                return
            }
            self?.present(errorMessage, animated: true, completion: nil)
        }
    }
}
