

const hotels = require('./hotels');

const buildResponse = (response) => {
  return {
    statusCode: 200,
    body: JSON.stringify(response)
  }
}

const buildError = (response) => {
  return {
    statusCode: 400,
    body: JSON.stringify(response)
  }
}

/**
 * 
 */
exports.get = async (event) => {
  if (!event.pathParameters || !event.pathParameters.hotelId) {
    return buildError({ error: 'Missing hotel id' });
  }

  let hotel = hotels.find(o => {
    return String(o._id) === event.pathParameters.hotelId;
  });

  return hotel ? buildResponse( { hotel: hotel }) : buildError({ error: 'Hotel not found' });
};

/**
 * 
 */
exports.list = async (event) => {
  let { limit, offset } = Object.assign({ limit: 10, offset: 0 }, event.queryStringParameters);
  let result = hotels.slice(offset, offset + limit);

  return buildResponse({ hotels: result, count: result.length });
};
