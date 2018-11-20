//  This file was automatically generated and should not be edited.

import AWSAppSync

public final class ListHotelsQuery: GraphQLQuery {
  public static let operationString =
    "query ListHotels($offset: Int, $limit: Int) {\n  listHotels(offset: $offset, limit: $limit) {\n    __typename\n    hotelId\n    name\n    location\n    image\n    address {\n      __typename\n      street\n      city\n      state\n      country\n      zip\n    }\n    phoneNumber\n    category\n    amenities\n  }\n}"

  public var offset: Int?
  public var limit: Int?

  public init(offset: Int? = nil, limit: Int? = nil) {
    self.offset = offset
    self.limit = limit
  }

  public var variables: GraphQLMap? {
    return ["offset": offset, "limit": limit]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("listHotels", arguments: ["offset": GraphQLVariable("offset"), "limit": GraphQLVariable("limit")], type: .list(.object(ListHotel.selections))),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(listHotels: [ListHotel?]? = nil) {
      self.init(snapshot: ["__typename": "Query", "listHotels": listHotels.flatMap { $0.map { $0.flatMap { $0.snapshot } } }])
    }

    public var listHotels: [ListHotel?]? {
      get {
        return (snapshot["listHotels"] as? [Snapshot?]).flatMap { $0.map { $0.flatMap { ListHotel(snapshot: $0) } } }
      }
      set {
        snapshot.updateValue(newValue.flatMap { $0.map { $0.flatMap { $0.snapshot } } }, forKey: "listHotels")
      }
    }

    public struct ListHotel: GraphQLSelectionSet {
      public static let possibleTypes = ["Hotel"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("hotelId", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("name", type: .nonNull(.scalar(String.self))),
        GraphQLField("location", type: .nonNull(.scalar(String.self))),
        GraphQLField("image", type: .scalar(String.self)),
        GraphQLField("address", type: .nonNull(.object(Address.selections))),
        GraphQLField("phoneNumber", type: .nonNull(.scalar(String.self))),
        GraphQLField("category", type: .nonNull(.scalar(Int.self))),
        GraphQLField("amenities", type: .list(.scalar(String.self))),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(hotelId: GraphQLID, name: String, location: String, image: String? = nil, address: Address, phoneNumber: String, category: Int, amenities: [String?]? = nil) {
        self.init(snapshot: ["__typename": "Hotel", "hotelId": hotelId, "name": name, "location": location, "image": image, "address": address.snapshot, "phoneNumber": phoneNumber, "category": category, "amenities": amenities])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var hotelId: GraphQLID {
        get {
          return snapshot["hotelId"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "hotelId")
        }
      }

      public var name: String {
        get {
          return snapshot["name"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "name")
        }
      }

      public var location: String {
        get {
          return snapshot["location"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "location")
        }
      }

      public var image: String? {
        get {
          return snapshot["image"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "image")
        }
      }

      public var address: Address {
        get {
          return Address(snapshot: snapshot["address"]! as! Snapshot)
        }
        set {
          snapshot.updateValue(newValue.snapshot, forKey: "address")
        }
      }

      public var phoneNumber: String {
        get {
          return snapshot["phoneNumber"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "phoneNumber")
        }
      }

      public var category: Int {
        get {
          return snapshot["category"]! as! Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "category")
        }
      }

      public var amenities: [String?]? {
        get {
          return snapshot["amenities"] as? [String?]
        }
        set {
          snapshot.updateValue(newValue, forKey: "amenities")
        }
      }

      public struct Address: GraphQLSelectionSet {
        public static let possibleTypes = ["Address"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("street", type: .nonNull(.scalar(String.self))),
          GraphQLField("city", type: .nonNull(.scalar(String.self))),
          GraphQLField("state", type: .scalar(String.self)),
          GraphQLField("country", type: .nonNull(.scalar(String.self))),
          GraphQLField("zip", type: .nonNull(.scalar(String.self))),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(street: String, city: String, state: String? = nil, country: String, zip: String) {
          self.init(snapshot: ["__typename": "Address", "street": street, "city": city, "state": state, "country": country, "zip": zip])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        public var street: String {
          get {
            return snapshot["street"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "street")
          }
        }

        public var city: String {
          get {
            return snapshot["city"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "city")
          }
        }

        public var state: String? {
          get {
            return snapshot["state"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "state")
          }
        }

        public var country: String {
          get {
            return snapshot["country"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "country")
          }
        }

        public var zip: String {
          get {
            return snapshot["zip"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "zip")
          }
        }
      }
    }
  }
}

public final class GetHotelQuery: GraphQLQuery {
  public static let operationString =
    "query GetHotel($hotelId: ID!) {\n  getHotel(hotelId: $hotelId) {\n    __typename\n    hotelId\n    name\n    location\n    image\n    address {\n      __typename\n      street\n      city\n      state\n      country\n      zip\n    }\n    phoneNumber\n    category\n    amenities\n  }\n}"

  public var hotelId: GraphQLID

  public init(hotelId: GraphQLID) {
    self.hotelId = hotelId
  }

  public var variables: GraphQLMap? {
    return ["hotelId": hotelId]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("getHotel", arguments: ["hotelId": GraphQLVariable("hotelId")], type: .object(GetHotel.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(getHotel: GetHotel? = nil) {
      self.init(snapshot: ["__typename": "Query", "getHotel": getHotel.flatMap { $0.snapshot }])
    }

    public var getHotel: GetHotel? {
      get {
        return (snapshot["getHotel"] as? Snapshot).flatMap { GetHotel(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "getHotel")
      }
    }

    public struct GetHotel: GraphQLSelectionSet {
      public static let possibleTypes = ["Hotel"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("hotelId", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("name", type: .nonNull(.scalar(String.self))),
        GraphQLField("location", type: .nonNull(.scalar(String.self))),
        GraphQLField("image", type: .scalar(String.self)),
        GraphQLField("address", type: .nonNull(.object(Address.selections))),
        GraphQLField("phoneNumber", type: .nonNull(.scalar(String.self))),
        GraphQLField("category", type: .nonNull(.scalar(Int.self))),
        GraphQLField("amenities", type: .list(.scalar(String.self))),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(hotelId: GraphQLID, name: String, location: String, image: String? = nil, address: Address, phoneNumber: String, category: Int, amenities: [String?]? = nil) {
        self.init(snapshot: ["__typename": "Hotel", "hotelId": hotelId, "name": name, "location": location, "image": image, "address": address.snapshot, "phoneNumber": phoneNumber, "category": category, "amenities": amenities])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var hotelId: GraphQLID {
        get {
          return snapshot["hotelId"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "hotelId")
        }
      }

      public var name: String {
        get {
          return snapshot["name"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "name")
        }
      }

      public var location: String {
        get {
          return snapshot["location"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "location")
        }
      }

      public var image: String? {
        get {
          return snapshot["image"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "image")
        }
      }

      public var address: Address {
        get {
          return Address(snapshot: snapshot["address"]! as! Snapshot)
        }
        set {
          snapshot.updateValue(newValue.snapshot, forKey: "address")
        }
      }

      public var phoneNumber: String {
        get {
          return snapshot["phoneNumber"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "phoneNumber")
        }
      }

      public var category: Int {
        get {
          return snapshot["category"]! as! Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "category")
        }
      }

      public var amenities: [String?]? {
        get {
          return snapshot["amenities"] as? [String?]
        }
        set {
          snapshot.updateValue(newValue, forKey: "amenities")
        }
      }

      public struct Address: GraphQLSelectionSet {
        public static let possibleTypes = ["Address"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("street", type: .nonNull(.scalar(String.self))),
          GraphQLField("city", type: .nonNull(.scalar(String.self))),
          GraphQLField("state", type: .scalar(String.self)),
          GraphQLField("country", type: .nonNull(.scalar(String.self))),
          GraphQLField("zip", type: .nonNull(.scalar(String.self))),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(street: String, city: String, state: String? = nil, country: String, zip: String) {
          self.init(snapshot: ["__typename": "Address", "street": street, "city": city, "state": state, "country": country, "zip": zip])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        public var street: String {
          get {
            return snapshot["street"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "street")
          }
        }

        public var city: String {
          get {
            return snapshot["city"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "city")
          }
        }

        public var state: String? {
          get {
            return snapshot["state"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "state")
          }
        }

        public var country: String {
          get {
            return snapshot["country"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "country")
          }
        }

        public var zip: String {
          get {
            return snapshot["zip"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "zip")
          }
        }
      }
    }
  }
}