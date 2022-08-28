//
//  CountryCell.swift
//  ListDetailSample
//
//  Created by A H on 2022-08-28.
//

import UIKit
import Combine

final class CountryCell: UITableViewCell {
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var flagView: UIImageView!

    private var presentationModel: CountryPresentationModel?
    private var downloader: DownloadManagerServicing!
    private var cancellable = Set<AnyCancellable>()

    override func prepareForReuse() {
        super.prepareForReuse()

        if let url = presentationModel?.imageUrl {
            downloader.cancelRequest(of: URL(string: url)!)
        }
    }

    func setup(with model: CountryPresentationModel, downloadManager: DownloadManagerServicing) {
        presentationModel = model
        downloader = downloadManager
        titleLabel.text = model.name

        if let url = model.imageUrl {
            downloadManager.download(from: URL(string: url)!)
                .receive(on: DispatchQueue.main)
                .sink(receiveCompletion: { (completion) in
                    switch completion {
                    case .finished:
                        break
                    case .failure(_):
                        self.flagView.image = UIImage(named: "unknown")
                    }
                }, receiveValue: { [weak self] (data) in
                    guard let `self` = self else {
                        return
                    }
                    if let data = data {
                        self.flagView.image = UIImage(data: data)
                    }
                }).store(in: &cancellable)
        }
    }
}
