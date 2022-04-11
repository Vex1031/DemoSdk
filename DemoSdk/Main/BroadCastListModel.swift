//
//  BroadCastList.swift
//  DemoSdk
//
//  Created by vex on 2022/04/11.
//

struct BroadCastListModel: Codable {
    let results: [Result]
    let totalCount, s: Int

    enum CodingKeys: String, CodingKey {
        case results, totalCount
        case s = "_s"
    }
}

struct Result: Codable {
    let campaignKey: String
    let campaignURL: String
    let title, campaignStatus: String
    let rehearsal: Bool
    let previewLiveURL, liveURL: String
    let backgroundURL, unsupportInfoURL: String
    let campaignGoodsList: Array<String>
    let campaignGoodsCount, scheduledAt, userCount, adoreCount: Int
    let startedAt: Int

    enum CodingKeys: String, CodingKey {
        case campaignKey
        case campaignURL = "campaignUrl"
        case title, campaignStatus, rehearsal
        case previewLiveURL = "previewLiveUrl"
        case liveURL = "liveUrl"
        case backgroundURL = "backgroundUrl"
        case unsupportInfoURL = "unsupportInfoUrl"
        case campaignGoodsList, campaignGoodsCount, scheduledAt, userCount, adoreCount, startedAt
    }
}
