/**
 * Fake endpoint. For demo sake, we expect a hotel id and date in the event.
 * @param {*} event 
 */

const randomNumber = (from, to) => {
  return Math.random() * (to - from) + from;
}

exports.get = async (event) => {
  let rate = randomNumber(200, 700);

  let result = {
    hotelId: event.pathParameters.hotelId,
    rate: Math.round(rate),
    currency: "USD",
    date: new Date().toISOString().split('T')[0]
  }

  return {
    statusCode: 200,
    body: JSON.stringify(result)
  }
}