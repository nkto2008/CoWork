//
//  signUp.swift
//  CoWorkApp
//
//  Created by Alexandre Marcos on 22/08/2022.
//

import SwiftUI

struct userRent: View {
    let sites = ["Apple.com", "HackingWithSwift.com", "Swift.org"]

    var body: some View {
        NavigationView {
            List(sites, id: \.self) { site in
                NavigationLink(site) {
                    SourceViewer(site: site)
                }
            }
            .navigationTitle("Co Work")
        }
    }
}

struct SourceViewer: View {
    let site: String
    @State private var sourceCode = "Loading…"

    var body: some View {
        ScrollView {
            Text(sourceCode)
                .font(.system(.body, design: .monospaced))
        }
        .task {
            guard let url = URL(string: "https://\(site)") else {
                return
            }

            do {
                let (data, _) = try await URLSession.shared.data(from: url)
                sourceCode = String(decoding: data, as: UTF8.self).trimmingCharacters(in: .whitespacesAndNewlines)
            } catch {
                sourceCode = "Failed to fetch site."
            }
        }
    }
}
