//
//  DataJSONParse.swift
//  FetchRewards1
//
//  Created by Amit Pandey on 4/14/21.
//

import Foundation

class EventData: Codable {
    let events: [Event]
    init(events: [Event]) {
        self.events = events
    }
}


class Event: Codable {
    let venue: VenueInfo
    let performers: [Performers]
    let datetime_utc: String
    init(performers: [Performers], venue: VenueInfo, datetime_utc: String){
        self.performers = performers
        self.venue = venue
        self.datetime_utc = datetime_utc
    }
}

class Performers: Codable
{
    let name: String
    let image: String
    init(name: String, image: String)
    {
        self.name = name
        self.image = image
    }
}

class VenueInfo: Codable{
    let display_location: String
    init(display_location: String)
    {
        self.display_location = display_location
    }
}
