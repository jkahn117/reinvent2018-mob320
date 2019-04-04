//  This file was automatically generated and should not be edited.

import AWSAppSync

public struct ReservationInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  public init(hotelId: GraphQLID, guestId: GraphQLID, startDate: String, endDate: String, rate: Int) {
    graphQLMap = ["hotelId": hotelId, "guestId": guestId, "startDate": startDate, "endDate": endDate, "rate": rate]
  }

  public var hotelId: GraphQLID {
    get {
      return graphQLMap["hotelId"] as! GraphQLID
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "hotelId")
    }
  }

  /// # NOTE: in real implementation, get this from identity context
  public var guestId: GraphQLID {
    get {
      return graphQLMap["guestId"] as! GraphQLID
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "guestId")
    }
  }

  public var startDate: String {
    get {
      return graphQLMap["startDate"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "startDate")
    }
  }

  public var endDate: String {
    get {
      return graphQLMap["endDate"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "endDate")
    }
  }

  public var rate: Int {
    get {
      return graphQLMap["rate"] as! Int
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "rate")
    }
  }
}

public final class CreateReservationMutation: GraphQLMutation {
  public static let operationString =
    "mutation CreateReservation($input: ReservationInput) {\n  createReservation(input: $input) {\n    __typename\n    confirmationNumber\n    hotel {\n      __typename\n      hotelId\n      name\n      location\n      image\n      address {\n        __typename\n        street\n        city\n        state\n        country\n        zip\n      }\n      phoneNumber\n      category\n      amenities\n      rate {\n        __typename\n        hotelId\n        rate\n        currency\n        date\n      }\n    }\n    guestId\n    startDate\n    endDate\n    rate\n  }\n}"

  public var input: ReservationInput?

  public init(input: ReservationInput? = nil) {
    self.input = input
  }

  public var variables: GraphQLMap? {
    return ["input": input]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("createReservation", arguments: ["input": GraphQLVariable("input")], type: .object(CreateReservation.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(createReservation: CreateReservation? = nil) {
      self.init(snapshot: ["__typename": "Mutation", "createReservation": createReservation.flatMap { $0.snapshot }])
    }

    public var createReservation: CreateReservation? {
      get {
        return (snapshot["createReservation"] as? Snapshot).flatMap { CreateReservation(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "createReservation")
      }
    }

    public struct CreateReservation: GraphQLSelectionSet {
      public static let possibleTypes = ["Reservation"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("confirmationNumber", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("hotel", type: .nonNull(.object(Hotel.selections))),
        GraphQLField("guestId", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("startDate", type: .nonNull(.scalar(String.self))),
        GraphQLField("endDate", type: .nonNull(.scalar(String.self))),
        GraphQLField("rate", type: .nonNull(.scalar(Int.self))),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(confirmationNumber: GraphQLID, hotel: Hotel, guestId: GraphQLID, startDate: String, endDate: String, rate: Int) {
        self.init(snapshot: ["__typename": "Reservation", "confirmationNumber": confirmationNumber, "hotel": hotel.snapshot, "guestId": guestId, "startDate": startDate, "endDate": endDate, "rate": rate])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var confirmationNumber: GraphQLID {
        get {
          return snapshot["confirmationNumber"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "confirmationNumber")
        }
      }

      public var hotel: Hotel {
        get {
          return Hotel(snapshot: snapshot["hotel"]! as! Snapshot)
        }
        set {
          snapshot.updateValue(newValue.snapshot, forKey: "hotel")
        }
      }

      public var guestId: GraphQLID {
        get {
          return snapshot["guestId"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "guestId")
        }
      }

      public var startDate: String {
        get {
          return snapshot["startDate"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "startDate")
        }
      }

      public var endDate: String {
        get {
          return snapshot["endDate"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "endDate")
        }
      }

      public var rate: Int {
        get {
          return snapshot["rate"]! as! Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "rate")
        }
      }

      public struct Hotel: GraphQLSelectionSet {
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
          GraphQLField("rate", type: .object(Rate.selections)),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(hotelId: GraphQLID, name: String, location: String, image: String? = nil, address: Address, phoneNumber: String, category: Int, amenities: [String?]? = nil, rate: Rate? = nil) {
          self.init(snapshot: ["__typename": "Hotel", "hotelId": hotelId, "name": name, "location": location, "image": image, "address": address.snapshot, "phoneNumber": phoneNumber, "category": category, "amenities": amenities, "rate": rate.flatMap { $0.snapshot }])
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

        public var rate: Rate? {
          get {
            return (snapshot["rate"] as? Snapshot).flatMap { Rate(snapshot: $0) }
          }
          set {
            snapshot.updateValue(newValue?.snapshot, forKey: "rate")
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

        public struct Rate: GraphQLSelectionSet {
          public static let possibleTypes = ["Rate"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("hotelId", type: .nonNull(.scalar(GraphQLID.self))),
            GraphQLField("rate", type: .nonNull(.scalar(Int.self))),
            GraphQLField("currency", type: .nonNull(.scalar(String.self))),
            GraphQLField("date", type: .scalar(String.self)),
          ]

          public var snapshot: Snapshot

          public init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          public init(hotelId: GraphQLID, rate: Int, currency: String, date: String? = nil) {
            self.init(snapshot: ["__typename": "Rate", "hotelId": hotelId, "rate": rate, "currency": currency, "date": date])
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

          public var rate: Int {
            get {
              return snapshot["rate"]! as! Int
            }
            set {
              snapshot.updateValue(newValue, forKey: "rate")
            }
          }

          public var currency: String {
            get {
              return snapshot["currency"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "currency")
            }
          }

          public var date: String? {
            get {
              return snapshot["date"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "date")
            }
          }
        }
      }
    }
  }
}

public final class DeleteReservationMutation: GraphQLMutation {
  public static let operationString =
    "mutation DeleteReservation($confNum: ID!) {\n  deleteReservation(confNum: $confNum) {\n    __typename\n    confirmationNumber\n    hotel {\n      __typename\n      hotelId\n      name\n      location\n      image\n      address {\n        __typename\n        street\n        city\n        state\n        country\n        zip\n      }\n      phoneNumber\n      category\n      amenities\n      rate {\n        __typename\n        hotelId\n        rate\n        currency\n        date\n      }\n    }\n    guestId\n    startDate\n    endDate\n    rate\n  }\n}"

  public var confNum: GraphQLID

  public init(confNum: GraphQLID) {
    self.confNum = confNum
  }

  public var variables: GraphQLMap? {
    return ["confNum": confNum]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("deleteReservation", arguments: ["confNum": GraphQLVariable("confNum")], type: .object(DeleteReservation.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(deleteReservation: DeleteReservation? = nil) {
      self.init(snapshot: ["__typename": "Mutation", "deleteReservation": deleteReservation.flatMap { $0.snapshot }])
    }

    public var deleteReservation: DeleteReservation? {
      get {
        return (snapshot["deleteReservation"] as? Snapshot).flatMap { DeleteReservation(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "deleteReservation")
      }
    }

    public struct DeleteReservation: GraphQLSelectionSet {
      public static let possibleTypes = ["Reservation"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("confirmationNumber", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("hotel", type: .nonNull(.object(Hotel.selections))),
        GraphQLField("guestId", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("startDate", type: .nonNull(.scalar(String.self))),
        GraphQLField("endDate", type: .nonNull(.scalar(String.self))),
        GraphQLField("rate", type: .nonNull(.scalar(Int.self))),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(confirmationNumber: GraphQLID, hotel: Hotel, guestId: GraphQLID, startDate: String, endDate: String, rate: Int) {
        self.init(snapshot: ["__typename": "Reservation", "confirmationNumber": confirmationNumber, "hotel": hotel.snapshot, "guestId": guestId, "startDate": startDate, "endDate": endDate, "rate": rate])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var confirmationNumber: GraphQLID {
        get {
          return snapshot["confirmationNumber"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "confirmationNumber")
        }
      }

      public var hotel: Hotel {
        get {
          return Hotel(snapshot: snapshot["hotel"]! as! Snapshot)
        }
        set {
          snapshot.updateValue(newValue.snapshot, forKey: "hotel")
        }
      }

      public var guestId: GraphQLID {
        get {
          return snapshot["guestId"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "guestId")
        }
      }

      public var startDate: String {
        get {
          return snapshot["startDate"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "startDate")
        }
      }

      public var endDate: String {
        get {
          return snapshot["endDate"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "endDate")
        }
      }

      public var rate: Int {
        get {
          return snapshot["rate"]! as! Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "rate")
        }
      }

      public struct Hotel: GraphQLSelectionSet {
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
          GraphQLField("rate", type: .object(Rate.selections)),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(hotelId: GraphQLID, name: String, location: String, image: String? = nil, address: Address, phoneNumber: String, category: Int, amenities: [String?]? = nil, rate: Rate? = nil) {
          self.init(snapshot: ["__typename": "Hotel", "hotelId": hotelId, "name": name, "location": location, "image": image, "address": address.snapshot, "phoneNumber": phoneNumber, "category": category, "amenities": amenities, "rate": rate.flatMap { $0.snapshot }])
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

        public var rate: Rate? {
          get {
            return (snapshot["rate"] as? Snapshot).flatMap { Rate(snapshot: $0) }
          }
          set {
            snapshot.updateValue(newValue?.snapshot, forKey: "rate")
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

        public struct Rate: GraphQLSelectionSet {
          public static let possibleTypes = ["Rate"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("hotelId", type: .nonNull(.scalar(GraphQLID.self))),
            GraphQLField("rate", type: .nonNull(.scalar(Int.self))),
            GraphQLField("currency", type: .nonNull(.scalar(String.self))),
            GraphQLField("date", type: .scalar(String.self)),
          ]

          public var snapshot: Snapshot

          public init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          public init(hotelId: GraphQLID, rate: Int, currency: String, date: String? = nil) {
            self.init(snapshot: ["__typename": "Rate", "hotelId": hotelId, "rate": rate, "currency": currency, "date": date])
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

          public var rate: Int {
            get {
              return snapshot["rate"]! as! Int
            }
            set {
              snapshot.updateValue(newValue, forKey: "rate")
            }
          }

          public var currency: String {
            get {
              return snapshot["currency"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "currency")
            }
          }

          public var date: String? {
            get {
              return snapshot["date"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "date")
            }
          }
        }
      }
    }
  }
}

public final class ListHotelsQuery: GraphQLQuery {
  public static let operationString =
    "query ListHotels($offset: Int, $limit: Int) {\n  listHotels(offset: $offset, limit: $limit) {\n    __typename\n    hotelId\n    name\n    location\n    image\n    address {\n      __typename\n      street\n      city\n      state\n      country\n      zip\n    }\n    phoneNumber\n    category\n    amenities\n    rate {\n      __typename\n      hotelId\n      rate\n      currency\n      date\n    }\n  }\n}"

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
        GraphQLField("rate", type: .object(Rate.selections)),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(hotelId: GraphQLID, name: String, location: String, image: String? = nil, address: Address, phoneNumber: String, category: Int, amenities: [String?]? = nil, rate: Rate? = nil) {
        self.init(snapshot: ["__typename": "Hotel", "hotelId": hotelId, "name": name, "location": location, "image": image, "address": address.snapshot, "phoneNumber": phoneNumber, "category": category, "amenities": amenities, "rate": rate.flatMap { $0.snapshot }])
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

      public var rate: Rate? {
        get {
          return (snapshot["rate"] as? Snapshot).flatMap { Rate(snapshot: $0) }
        }
        set {
          snapshot.updateValue(newValue?.snapshot, forKey: "rate")
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

      public struct Rate: GraphQLSelectionSet {
        public static let possibleTypes = ["Rate"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("hotelId", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("rate", type: .nonNull(.scalar(Int.self))),
          GraphQLField("currency", type: .nonNull(.scalar(String.self))),
          GraphQLField("date", type: .scalar(String.self)),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(hotelId: GraphQLID, rate: Int, currency: String, date: String? = nil) {
          self.init(snapshot: ["__typename": "Rate", "hotelId": hotelId, "rate": rate, "currency": currency, "date": date])
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

        public var rate: Int {
          get {
            return snapshot["rate"]! as! Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "rate")
          }
        }

        public var currency: String {
          get {
            return snapshot["currency"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "currency")
          }
        }

        public var date: String? {
          get {
            return snapshot["date"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "date")
          }
        }
      }
    }
  }
}

public final class GetHotelQuery: GraphQLQuery {
  public static let operationString =
    "query GetHotel($hotelId: ID!) {\n  getHotel(hotelId: $hotelId) {\n    __typename\n    hotelId\n    name\n    location\n    image\n    address {\n      __typename\n      street\n      city\n      state\n      country\n      zip\n    }\n    phoneNumber\n    category\n    amenities\n    rate {\n      __typename\n      hotelId\n      rate\n      currency\n      date\n    }\n  }\n}"

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
        GraphQLField("rate", type: .object(Rate.selections)),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(hotelId: GraphQLID, name: String, location: String, image: String? = nil, address: Address, phoneNumber: String, category: Int, amenities: [String?]? = nil, rate: Rate? = nil) {
        self.init(snapshot: ["__typename": "Hotel", "hotelId": hotelId, "name": name, "location": location, "image": image, "address": address.snapshot, "phoneNumber": phoneNumber, "category": category, "amenities": amenities, "rate": rate.flatMap { $0.snapshot }])
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

      public var rate: Rate? {
        get {
          return (snapshot["rate"] as? Snapshot).flatMap { Rate(snapshot: $0) }
        }
        set {
          snapshot.updateValue(newValue?.snapshot, forKey: "rate")
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

      public struct Rate: GraphQLSelectionSet {
        public static let possibleTypes = ["Rate"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("hotelId", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("rate", type: .nonNull(.scalar(Int.self))),
          GraphQLField("currency", type: .nonNull(.scalar(String.self))),
          GraphQLField("date", type: .scalar(String.self)),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(hotelId: GraphQLID, rate: Int, currency: String, date: String? = nil) {
          self.init(snapshot: ["__typename": "Rate", "hotelId": hotelId, "rate": rate, "currency": currency, "date": date])
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

        public var rate: Int {
          get {
            return snapshot["rate"]! as! Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "rate")
          }
        }

        public var currency: String {
          get {
            return snapshot["currency"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "currency")
          }
        }

        public var date: String? {
          get {
            return snapshot["date"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "date")
          }
        }
      }
    }
  }
}

public final class GuestReservationsQuery: GraphQLQuery {
  public static let operationString =
    "query GuestReservations($guestId: ID!) {\n  guestReservations(guestId: $guestId) {\n    __typename\n    confirmationNumber\n    hotel {\n      __typename\n      hotelId\n      name\n      location\n      image\n      address {\n        __typename\n        street\n        city\n        state\n        country\n        zip\n      }\n      phoneNumber\n      category\n      amenities\n      rate {\n        __typename\n        hotelId\n        rate\n        currency\n        date\n      }\n    }\n    guestId\n    startDate\n    endDate\n    rate\n  }\n}"

  public var guestId: GraphQLID

  public init(guestId: GraphQLID) {
    self.guestId = guestId
  }

  public var variables: GraphQLMap? {
    return ["guestId": guestId]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("guestReservations", arguments: ["guestId": GraphQLVariable("guestId")], type: .list(.object(GuestReservation.selections))),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(guestReservations: [GuestReservation?]? = nil) {
      self.init(snapshot: ["__typename": "Query", "guestReservations": guestReservations.flatMap { $0.map { $0.flatMap { $0.snapshot } } }])
    }

    public var guestReservations: [GuestReservation?]? {
      get {
        return (snapshot["guestReservations"] as? [Snapshot?]).flatMap { $0.map { $0.flatMap { GuestReservation(snapshot: $0) } } }
      }
      set {
        snapshot.updateValue(newValue.flatMap { $0.map { $0.flatMap { $0.snapshot } } }, forKey: "guestReservations")
      }
    }

    public struct GuestReservation: GraphQLSelectionSet {
      public static let possibleTypes = ["Reservation"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("confirmationNumber", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("hotel", type: .nonNull(.object(Hotel.selections))),
        GraphQLField("guestId", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("startDate", type: .nonNull(.scalar(String.self))),
        GraphQLField("endDate", type: .nonNull(.scalar(String.self))),
        GraphQLField("rate", type: .nonNull(.scalar(Int.self))),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(confirmationNumber: GraphQLID, hotel: Hotel, guestId: GraphQLID, startDate: String, endDate: String, rate: Int) {
        self.init(snapshot: ["__typename": "Reservation", "confirmationNumber": confirmationNumber, "hotel": hotel.snapshot, "guestId": guestId, "startDate": startDate, "endDate": endDate, "rate": rate])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var confirmationNumber: GraphQLID {
        get {
          return snapshot["confirmationNumber"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "confirmationNumber")
        }
      }

      public var hotel: Hotel {
        get {
          return Hotel(snapshot: snapshot["hotel"]! as! Snapshot)
        }
        set {
          snapshot.updateValue(newValue.snapshot, forKey: "hotel")
        }
      }

      public var guestId: GraphQLID {
        get {
          return snapshot["guestId"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "guestId")
        }
      }

      public var startDate: String {
        get {
          return snapshot["startDate"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "startDate")
        }
      }

      public var endDate: String {
        get {
          return snapshot["endDate"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "endDate")
        }
      }

      public var rate: Int {
        get {
          return snapshot["rate"]! as! Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "rate")
        }
      }

      public struct Hotel: GraphQLSelectionSet {
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
          GraphQLField("rate", type: .object(Rate.selections)),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(hotelId: GraphQLID, name: String, location: String, image: String? = nil, address: Address, phoneNumber: String, category: Int, amenities: [String?]? = nil, rate: Rate? = nil) {
          self.init(snapshot: ["__typename": "Hotel", "hotelId": hotelId, "name": name, "location": location, "image": image, "address": address.snapshot, "phoneNumber": phoneNumber, "category": category, "amenities": amenities, "rate": rate.flatMap { $0.snapshot }])
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

        public var rate: Rate? {
          get {
            return (snapshot["rate"] as? Snapshot).flatMap { Rate(snapshot: $0) }
          }
          set {
            snapshot.updateValue(newValue?.snapshot, forKey: "rate")
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

        public struct Rate: GraphQLSelectionSet {
          public static let possibleTypes = ["Rate"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("hotelId", type: .nonNull(.scalar(GraphQLID.self))),
            GraphQLField("rate", type: .nonNull(.scalar(Int.self))),
            GraphQLField("currency", type: .nonNull(.scalar(String.self))),
            GraphQLField("date", type: .scalar(String.self)),
          ]

          public var snapshot: Snapshot

          public init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          public init(hotelId: GraphQLID, rate: Int, currency: String, date: String? = nil) {
            self.init(snapshot: ["__typename": "Rate", "hotelId": hotelId, "rate": rate, "currency": currency, "date": date])
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

          public var rate: Int {
            get {
              return snapshot["rate"]! as! Int
            }
            set {
              snapshot.updateValue(newValue, forKey: "rate")
            }
          }

          public var currency: String {
            get {
              return snapshot["currency"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "currency")
            }
          }

          public var date: String? {
            get {
              return snapshot["date"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "date")
            }
          }
        }
      }
    }
  }
}

public final class CreateReservationEventSubscription: GraphQLSubscription {
  public static let operationString =
    "subscription CreateReservationEvent($guestId: ID) {\n  createReservationEvent(guestId: $guestId) {\n    __typename\n    confirmationNumber\n    hotel {\n      __typename\n      hotelId\n      name\n      location\n      image\n      address {\n        __typename\n        street\n        city\n        state\n        country\n        zip\n      }\n      phoneNumber\n      category\n      amenities\n      rate {\n        __typename\n        hotelId\n        rate\n        currency\n        date\n      }\n    }\n    guestId\n    startDate\n    endDate\n    rate\n  }\n}"

  public var guestId: GraphQLID?

  public init(guestId: GraphQLID? = nil) {
    self.guestId = guestId
  }

  public var variables: GraphQLMap? {
    return ["guestId": guestId]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Subscription"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("createReservationEvent", arguments: ["guestId": GraphQLVariable("guestId")], type: .object(CreateReservationEvent.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(createReservationEvent: CreateReservationEvent? = nil) {
      self.init(snapshot: ["__typename": "Subscription", "createReservationEvent": createReservationEvent.flatMap { $0.snapshot }])
    }

    public var createReservationEvent: CreateReservationEvent? {
      get {
        return (snapshot["createReservationEvent"] as? Snapshot).flatMap { CreateReservationEvent(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "createReservationEvent")
      }
    }

    public struct CreateReservationEvent: GraphQLSelectionSet {
      public static let possibleTypes = ["Reservation"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("confirmationNumber", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("hotel", type: .nonNull(.object(Hotel.selections))),
        GraphQLField("guestId", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("startDate", type: .nonNull(.scalar(String.self))),
        GraphQLField("endDate", type: .nonNull(.scalar(String.self))),
        GraphQLField("rate", type: .nonNull(.scalar(Int.self))),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(confirmationNumber: GraphQLID, hotel: Hotel, guestId: GraphQLID, startDate: String, endDate: String, rate: Int) {
        self.init(snapshot: ["__typename": "Reservation", "confirmationNumber": confirmationNumber, "hotel": hotel.snapshot, "guestId": guestId, "startDate": startDate, "endDate": endDate, "rate": rate])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var confirmationNumber: GraphQLID {
        get {
          return snapshot["confirmationNumber"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "confirmationNumber")
        }
      }

      public var hotel: Hotel {
        get {
          return Hotel(snapshot: snapshot["hotel"]! as! Snapshot)
        }
        set {
          snapshot.updateValue(newValue.snapshot, forKey: "hotel")
        }
      }

      public var guestId: GraphQLID {
        get {
          return snapshot["guestId"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "guestId")
        }
      }

      public var startDate: String {
        get {
          return snapshot["startDate"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "startDate")
        }
      }

      public var endDate: String {
        get {
          return snapshot["endDate"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "endDate")
        }
      }

      public var rate: Int {
        get {
          return snapshot["rate"]! as! Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "rate")
        }
      }

      public struct Hotel: GraphQLSelectionSet {
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
          GraphQLField("rate", type: .object(Rate.selections)),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(hotelId: GraphQLID, name: String, location: String, image: String? = nil, address: Address, phoneNumber: String, category: Int, amenities: [String?]? = nil, rate: Rate? = nil) {
          self.init(snapshot: ["__typename": "Hotel", "hotelId": hotelId, "name": name, "location": location, "image": image, "address": address.snapshot, "phoneNumber": phoneNumber, "category": category, "amenities": amenities, "rate": rate.flatMap { $0.snapshot }])
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

        public var rate: Rate? {
          get {
            return (snapshot["rate"] as? Snapshot).flatMap { Rate(snapshot: $0) }
          }
          set {
            snapshot.updateValue(newValue?.snapshot, forKey: "rate")
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

        public struct Rate: GraphQLSelectionSet {
          public static let possibleTypes = ["Rate"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("hotelId", type: .nonNull(.scalar(GraphQLID.self))),
            GraphQLField("rate", type: .nonNull(.scalar(Int.self))),
            GraphQLField("currency", type: .nonNull(.scalar(String.self))),
            GraphQLField("date", type: .scalar(String.self)),
          ]

          public var snapshot: Snapshot

          public init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          public init(hotelId: GraphQLID, rate: Int, currency: String, date: String? = nil) {
            self.init(snapshot: ["__typename": "Rate", "hotelId": hotelId, "rate": rate, "currency": currency, "date": date])
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

          public var rate: Int {
            get {
              return snapshot["rate"]! as! Int
            }
            set {
              snapshot.updateValue(newValue, forKey: "rate")
            }
          }

          public var currency: String {
            get {
              return snapshot["currency"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "currency")
            }
          }

          public var date: String? {
            get {
              return snapshot["date"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "date")
            }
          }
        }
      }
    }
  }
}

public final class DeleteReservationEventSubscription: GraphQLSubscription {
  public static let operationString =
    "subscription DeleteReservationEvent($guestId: ID) {\n  deleteReservationEvent(guestId: $guestId) {\n    __typename\n    confirmationNumber\n    hotel {\n      __typename\n      hotelId\n      name\n      location\n      image\n      address {\n        __typename\n        street\n        city\n        state\n        country\n        zip\n      }\n      phoneNumber\n      category\n      amenities\n      rate {\n        __typename\n        hotelId\n        rate\n        currency\n        date\n      }\n    }\n    guestId\n    startDate\n    endDate\n    rate\n  }\n}"

  public var guestId: GraphQLID?

  public init(guestId: GraphQLID? = nil) {
    self.guestId = guestId
  }

  public var variables: GraphQLMap? {
    return ["guestId": guestId]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Subscription"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("deleteReservationEvent", arguments: ["guestId": GraphQLVariable("guestId")], type: .object(DeleteReservationEvent.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(deleteReservationEvent: DeleteReservationEvent? = nil) {
      self.init(snapshot: ["__typename": "Subscription", "deleteReservationEvent": deleteReservationEvent.flatMap { $0.snapshot }])
    }

    public var deleteReservationEvent: DeleteReservationEvent? {
      get {
        return (snapshot["deleteReservationEvent"] as? Snapshot).flatMap { DeleteReservationEvent(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "deleteReservationEvent")
      }
    }

    public struct DeleteReservationEvent: GraphQLSelectionSet {
      public static let possibleTypes = ["Reservation"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("confirmationNumber", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("hotel", type: .nonNull(.object(Hotel.selections))),
        GraphQLField("guestId", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("startDate", type: .nonNull(.scalar(String.self))),
        GraphQLField("endDate", type: .nonNull(.scalar(String.self))),
        GraphQLField("rate", type: .nonNull(.scalar(Int.self))),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(confirmationNumber: GraphQLID, hotel: Hotel, guestId: GraphQLID, startDate: String, endDate: String, rate: Int) {
        self.init(snapshot: ["__typename": "Reservation", "confirmationNumber": confirmationNumber, "hotel": hotel.snapshot, "guestId": guestId, "startDate": startDate, "endDate": endDate, "rate": rate])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var confirmationNumber: GraphQLID {
        get {
          return snapshot["confirmationNumber"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "confirmationNumber")
        }
      }

      public var hotel: Hotel {
        get {
          return Hotel(snapshot: snapshot["hotel"]! as! Snapshot)
        }
        set {
          snapshot.updateValue(newValue.snapshot, forKey: "hotel")
        }
      }

      public var guestId: GraphQLID {
        get {
          return snapshot["guestId"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "guestId")
        }
      }

      public var startDate: String {
        get {
          return snapshot["startDate"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "startDate")
        }
      }

      public var endDate: String {
        get {
          return snapshot["endDate"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "endDate")
        }
      }

      public var rate: Int {
        get {
          return snapshot["rate"]! as! Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "rate")
        }
      }

      public struct Hotel: GraphQLSelectionSet {
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
          GraphQLField("rate", type: .object(Rate.selections)),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(hotelId: GraphQLID, name: String, location: String, image: String? = nil, address: Address, phoneNumber: String, category: Int, amenities: [String?]? = nil, rate: Rate? = nil) {
          self.init(snapshot: ["__typename": "Hotel", "hotelId": hotelId, "name": name, "location": location, "image": image, "address": address.snapshot, "phoneNumber": phoneNumber, "category": category, "amenities": amenities, "rate": rate.flatMap { $0.snapshot }])
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

        public var rate: Rate? {
          get {
            return (snapshot["rate"] as? Snapshot).flatMap { Rate(snapshot: $0) }
          }
          set {
            snapshot.updateValue(newValue?.snapshot, forKey: "rate")
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

        public struct Rate: GraphQLSelectionSet {
          public static let possibleTypes = ["Rate"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("hotelId", type: .nonNull(.scalar(GraphQLID.self))),
            GraphQLField("rate", type: .nonNull(.scalar(Int.self))),
            GraphQLField("currency", type: .nonNull(.scalar(String.self))),
            GraphQLField("date", type: .scalar(String.self)),
          ]

          public var snapshot: Snapshot

          public init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          public init(hotelId: GraphQLID, rate: Int, currency: String, date: String? = nil) {
            self.init(snapshot: ["__typename": "Rate", "hotelId": hotelId, "rate": rate, "currency": currency, "date": date])
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

          public var rate: Int {
            get {
              return snapshot["rate"]! as! Int
            }
            set {
              snapshot.updateValue(newValue, forKey: "rate")
            }
          }

          public var currency: String {
            get {
              return snapshot["currency"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "currency")
            }
          }

          public var date: String? {
            get {
              return snapshot["date"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "date")
            }
          }
        }
      }
    }
  }
}