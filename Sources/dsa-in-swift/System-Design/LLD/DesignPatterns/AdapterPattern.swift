//
//  AdapterPattern.swift
//  dsa-in-swift
//
//  Created by Dhawal Mahajan on 04/06/26.
//

import Foundation

// MARK: - Target Protocol

protocol Reports {
    func getJsonData(_ data: String) -> String
}

// MARK: - Adaptee

final class XmlDataProvider {

    // Expected format: "Alice:42"
    func getXmlData(_ data: String) -> String {
        let parts = data.split(separator: ":")

        let name = parts.count > 0 ? String(parts[0]) : ""
        let id = parts.count > 1 ? String(parts[1]) : ""

        return """
        <user>
            <name>\(name)</name>
            <id>\(id)</id>
        </user>
        """
    }
}

// MARK: - Adapter

final class XmlDataProviderAdapter: Reports {

    private let xmlProvider: XmlDataProvider

    init(provider: XmlDataProvider) {
        self.xmlProvider = provider
    }

    func getJsonData(_ data: String) -> String {

        // 1. Get XML from adaptee
        let xml = xmlProvider.getXmlData(data)

        // 2. Extract name
        let nameStartTag = "<name>"
        let nameEndTag = "</name>"

        let nameStart = xml.range(of: nameStartTag)?.upperBound
        let nameEnd = xml.range(of: nameEndTag)?.lowerBound

        let name = (nameStart != nil && nameEnd != nil)
            ? String(xml[nameStart!..<nameEnd!])
            : ""

        // 3. Extract id
        let idStartTag = "<id>"
        let idEndTag = "</id>"

        let idStart = xml.range(of: idStartTag)?.upperBound
        let idEnd = xml.range(of: idEndTag)?.lowerBound

        let id = (idStart != nil && idEnd != nil)
            ? String(xml[idStart!..<idEnd!])
            : ""

        // 4. Build JSON
        return """
        {"name":"\(name)", "id":\(id)}
        """
    }
}

// MARK: - Client

final class Client {

    func getReport(report: Reports, rawData: String) {
        print("Processed JSON: \(report.getJsonData(rawData))")
    }
}

// MARK: - Main
func adapterPatternDemo() {
    let xmlProvider = XmlDataProvider()

    let adapter: Reports = XmlDataProviderAdapter(
        provider: xmlProvider
    )

    let rawData = "Alice:42"

    let client = Client()
    client.getReport(
        report: adapter,
        rawData: rawData
    )

}
