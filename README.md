# AWS re:Invent 2018: MOB320
## 0 to 60 with AWS AppSync: Rapid Development Techniques for Mobile APIs

This project accompanies the AWS re:Invent 2018 Chalk Talk session of the same name.

In this project, we "prototype" a mobile API using [AWS AppSync](https://aws.amazon.com/appsync/) to demonstrate the flexibility and benefits of AppSync and GraphQL for rapid development. Our prototype is in support of a new mobile app for ElastiLodge, a chain of boutique hotels. In conjunction with app design, our team will build the associated API across three phases of work:

1. Expose a legacy REST API (represented by API Gateway and Lambda here).
2. Enhance the legacy data to include a new, machine learning-driven pricing API (also represented by API Gateway and Lambda).
3. Implement a prototype of the reservation booking API.

## Requirements

* [AWS CLI installed](https://docs.aws.amazon.com/cli/latest/userguide/installing.html) already configured with at least PowerUser permission.
* [AWS SAM CLI](https://docs.aws.amazon.com/serverless-application-model/latest/developerguide/serverless-sam-cli-install.html).
  * If you run into problems, be sure to check that your Python user directory is included in the `PATH` (see AWS SAM CLI installation guide).
* Select a Region in which AWS AppSync is available (N Virginia, Ohio, Oregon, Ireland, Frankfurt, Singapore, Tokyo, Sydney, Mumbai).

## Setup process

We will use [AWS CloudFormation](https://aws.amazon.com/cloudformation/) to manage the AppSync resources in each phase of deployment (the [Serverless Application Model](https://docs.aws.amazon.com/serverless-application-model/latest/developerguide/what-is-sam.html) simplifies deployment of our REST APIs).

To get started, we need to create an Amazon S3 Bucket to upload our code assets. Select a unique name for your bucket and note it as we will need it again later (we'll refer to it as `MY_BUCKET_NAME`).

```bash
$ aws s3 mb s3://{MY_BUCKET_NAME}
```

## Deployment

Next, we can deploy each phase of the prototype, progressively enhancing the API as our frontend design evolves.

### Phase 1

In phase 1, we will connect AWS AppSync to a mock legacy API that returns a listing of ElastiLodge hotels.

```bash
# first, package for deployment
$ sam package \
    --template-file phase1/template.yaml \
    --s3-bucket {MY_BUCKET_NAME} \
    --output-template-file packaged.yaml

# then, deploy to AWS
$ sam deploy \
    --template-file packaged.yaml \
    --capabilities CAPABILITY_NAMED_IAM \
    --stack-name appsync-elastilodge-sample
```

While deploying, explore the [Phase 1 GraphQL Schema](./phase1/schema.graphql) and associated resolvers (found in [template.yaml](./phase1/template.yaml)).

Once finished, open and login to the AWS Console. Select "AWS AppSync" and then the ElastiLodgeApi project. On the left, select "Queries" to access a GraphQL browser.

To start, we can query for a listing of hotels. Enter the following GraphQL query in the text box on the left and click the orange "Run" button.

```graphql
query ListHotels {
  listHotels {
    name
    location
  }
}
```

This query will return a result, such as:

```json
{
  "data": {
    "listHotels": [
      {
        "name": "ElastiLodge Watsicaport",
        "location": "Watsicaport"
      },
      {
        "name": "ElastiLodge Lake Marth",
        "location": "Lake Marth"
      }
    ]
  }
}
```

Try modifying your query to also include the `phoneNumber` of each hotel.

We can also query for details related to a single hotel:

```graphql
query GetHotel {
  getHotel(hotelId: 2) {
    name
    location
    address {
      city
      country
    }
  }
}
```

This will return a response such as:

```json
{
  "data": {
    "getHotel": {
      "name": "ElastiLodge Lake Marth",
      "location": "Lake Marth",
      "address": {
        "city": "Lake Marth",
        "country": "Monaco"
      }
    }
  }
}
```


### Phase 2

In Phase 2, we will enhance our prototype web API by adding reservations. In a production environment, managing reservations is a far more complex concern that what is required in a prototype. While a production system must check availability, interact with payment gateways, and ensure compliance, a prototype primarily needs to persist data across sessions to give the appearance of a real reservation.

In our ElastiLodge prototype, we will use [Amazon DynamoDB](https://aws.amazon.com/dynamodb/) to persist reservation data. Our API will enable multiple guests to create, delete, and view reservations.

> **NOTE** AWS AppSync makes it easy to add enterprise-class security via [Amazon Cognito](https://aws.amazon.com/cognito/); however, we will limit ourselves to a unique identifier per guest here to the purposes of brevity. While simpler than a full implementation, the approach of tying a unique guest identifier to each reservation is not all that different from a fully-functional model.

Let's deploy Phase 2:

```bash
$ sam package \
    --template-file phase2/template.yaml \
    --s3-bucket {MY_BUCKET_NAME} \
    --output-template-file packaged.yaml

$ sam deploy \
    --template-file packaged.yaml \
    --capabilities CAPABILITY_NAMED_IAM \
    --stack-name appsync-elastilodge-sample
```

Again, explore the [Phase 2 GraphQL Schema](./phase2/schema.graphql) and associated resolvers (found in [template.yaml](./phase2/template.yaml)). Note additions to both files (called out via comment "NEW IN PHASE 2").

When ready, we can create a few reservations via the GraphQL browser in the AWS Console:

```graphql
mutation CreateReservation {
  createReservation(input: {
    hotelId: 3,
    guestId: 1,
    startDate: "2018-12-01",
    endDate: "2018-12-03",
    rate: 100
  }) {
    confirmationNumber
  }
}
```

We can then retrieve those reservations via a GraphQL query:

```graphql
query GuestReservations {
  guestReservations(guestId: 1) {
    confirmationNumber
    startDate
    endDate
    hotel {
      name
      location
    }
  }
}
```

This query results in a response such as:

```json
{
  "data": {
    "guestReservations": [
      {
        "confirmationNumber": "c7f08e28-5ca3-4976-8c96-b851c159d171",
        "startDate": "2018-12-01",
        "endDate": "2018-12-03",
        "hotel": {
          "name": "ElastiLodge Schuppehaven",
          "location": "Schuppehaven"
        }
      }
    ]
  }
}
```

Before moving on, test adding and removing a few reservations. Try specifying a different `guestId` or setting a `startDate` before and after today's date. You might also try modifying the `GuestReservationQueryResolver` to behave differently, perhaps returning all reservations as opposed to only future ones.


### Phase 3

Moving to Phase 3, we will modify our API to include rate data from a second data source. While our project again uses API Gateway and Lambda, in a real-life scenario this may, for example, be another REST endpoint or an endpoint delivered by Amazon SageMaker.

AppSync will pull data from two different data sources and combine to form a single response. No code is required, only a new HTTP Data Source and a resolver for the `rate` field on our `Hotel` type.

```bash
$ sam package \
    --template-file phase3/template.yaml \
    --s3-bucket {MY_BUCKET_NAME} \
    --output-template-file packaged.yaml

$ sam deploy \
    --template-file packaged.yaml \
    --capabilities CAPABILITY_NAMED_IAM \
    --stack-name appsync-elastilodge-sample
```

While deploying, explore the [Phase 3 GraphQL Schema](./phase3/schema.graphql) and associated resolvers (found in [template.yaml](./phase3/template.yaml)). Note additions to both files (called out via comment "NEW IN PHASE 3").

We can now include the `rate` field in our queries, for example:

```graphql
query GetHotel {
  getHotel(hotelId: 2) {
    name
    location
    rate {
      rate
      currency
    }
  }
}
```

This query results in a response such as:

```json
{
  "data": {
    "getHotel": {
      "name": "ElastiLodge Lake Marth",
      "location": "Lake Marth",
      "rate": {
        "rate": 294,
        "currency": "USD"
      }
    }
  }
}
```

## Extra Credit

This project can be extended in a number of different ways to further exercise the flexibility of AWS AppSync for prototyping mobile APIs. A few examples you may consider:

* Adding the current weather in the hotel detail
* Enabling search by hotel attribute (e.g. name, location)
* Search for a hotel by geolocation (consider Elasticsearch)

## Cleanup

To clean-up all resources associated with this project (i.e. delete all resources), enter the following:

``` bash
$ aws cloudformation delete-stack \
	--stack-name appsync-elastilodge-sample

$ aws s3 rm s3://{MY_BUCKET_NAME}
```

## Authors

* **Josh Kahn** - *Initial work*
