//
//  TestDownloader.swift
//  Earthquakes
//
//  Created by Erik Sebastian de Erice Jerez on 11/8/25.
//

import Foundation

final class TestDownloader: HTTPDataDownloader {
    func httpData(from url: URL) async throws -> Data {
        try await Task.sleep(for: .microseconds(.random(in: 100...500)))
        return testQuakesData
    }
}
