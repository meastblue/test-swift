//
//  ContributorService.swift
//  DevHub
//
//  Created by Massinissa Amalou on 02/12/2023.
//

import Foundation

struct Contributor: Codable {
    let login: String
    let id: Int
    let nodeId: String
    let avatarUrl: String
    let gravatarId: String?
    let url: String
    let htmlUrl: String
    let followersUrl: String
    let followingUrl: String
    let gistsUrl: String
    let starredUrl: String
    let subscriptionsUrl: String
    let organizationsUrl: String
    let reposUrl: String
    let eventsUrl: String
    let receivedEventsUrl: String
    let type: String
    let siteAdmin: Bool
    let contributions: Int

    enum CodingKeys: String, CodingKey {
        case login, id, nodeId = "node_id", avatarUrl = "avatar_url", gravatarId = "gravatar_id", url, htmlUrl = "html_url", followersUrl = "followers_url", followingUrl = "following_url", gistsUrl = "gists_url", starredUrl = "starred_url", subscriptionsUrl = "subscriptions_url", organizationsUrl = "organizations_url", reposUrl = "repos_url", eventsUrl = "events_url", receivedEventsUrl = "received_events_url", type, siteAdmin = "site_admin", contributions
    }
}

 
class ContributorService {
    static func fetchData(completion: @escaping ([Contributor]?, Error?) -> Void) {
        guard let url = URL(string: "https://api.github.com/repos/apple/swift/contributors") else {
                    completion(nil, NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "URL invalid"]))
                    return
                }

                URLSession.shared.dataTask(with: url) { data, response, error in
                    if let error = error {
                        completion(nil, error)
                        return
                    }

                    guard let data = data else {
                        completion(nil, NSError(domain: "", code: -2, userInfo: [NSLocalizedDescriptionKey: "Data not found"]))
                        return
                    }

                    do {
                        let items = try JSONDecoder().decode([Contributor].self, from: data)
                        completion(items, nil)
                    } catch {
                        completion(nil, error)
                    }
                }.resume()
    }
    
}
