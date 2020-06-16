# Sweater Weather
An api that provides user registration, forecast and road trip data.
### Installation
- Clone/Download
- Run `bundle install`
- In the root directory, create file `.env`, the application uses the following enviromental variables:
  - GOOGLE_KEY
  - OPEN_WEATHER_KEY
- `rails s`

The api should now be available on your local machine
### Available Endpoints
#### Forecast
- Available at:
  - `/api/v1/forecast`
- Type of request: `GET`
- Required parameters:
  - `location`
- Response example:
```
{
    "included": {
        "location": {
            "city": "Timbuktu",
            "state": "Tombouctou Region",
            "county": "Tombouctou",
            "country": "Mali",
            "lat": 16.7665887,
            "long": -3.0025615,
            "place_id": "ChIJM4e8fJfOFw4RxrdYibwBb1Q"
        }
    },
    "data": {
        "current": {
            "time": "7:52 AM, June10",
            "sunrise": "11:38 PM",
            "sunset": "12:44 PM",
            "temp": 42.2,
            "temp_high": null,
            "temp_low": null,
            "feels_like": 41.1,
            "pressure": 1007,
            "humidity": 13,
            "dew_point": 8.07,
            "clouds": 0,
            "uv_index": 12.37,
            "visibility": null,
            "wind_speed": 0.91,
            "wind_deg": 163,
            "description": "clear sky",
            "icon": "http://openweathermap.org/img/wn/01d.png"
        },
        "hourly": [
            {
                "time": "7 AM",
                "temp": 42.2,
                "feels_like": 41.1,
                "pressure": 1007,
                "humidity": 13,
                "description": "clear sky",
                "icon": "http://openweathermap.org/img/wn/01d.png"
            },
            ... next 12 hours of forecast
        ],
        "daily": [
            {
                "day": "Wednesday",
                "sunrise": "11:38 PM",
                "sunset": "12:44 PM",
                "temp": 42.2,
                "temp_high": 42.73,
                "temp_low": 36.45,
                "feels_like": 40.83,
                "pressure": 1007,
                "humidity": 13,
                "dew_point": 8.07,
                "clouds": 0,
                "wind_speed": 1.3,
                "wind_deg": 103,
                "icon": "http://openweathermap.org/img/wn/01d.png"
            },
            ... Next 7 days of forecast
        ]
    }
}
```
#### Registration
- Available at: `/api/v1/users`
- Type of request: `POST`
- Required parameters:
- `email`
- `password`
- `password_confirmation`
- Response example:
```
{
    "data": {
        "id": "3",
        "type": "user",
        "attributes": {
            "email": "example1@example.com",
            "api_key": "eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjozLCJleHAiOjE1OTE4MDA5ODR9.TVJhJVdFuWBDUGwt6gmv_Eik4fhrHn5iVc8xbZxjjAI"
        }
    }
}
```
#### Login
- Available at: `/api/v1/sessions`
- Type of request: `POST`
- Required parameters:
- `email`
- `password`
- Response example:
```
{
    "data": {
        "id": "2",
        "type": "user",
        "attributes": {
            "email": "example@example.com",
            "api_key": "eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoyLCJleHAiOjE1OTE4MDEwNDN9.CHq9sAJ-IX0n7hYdJYYcxp1m1w2koo3rzs3hOLtIoCQ"
        }
    }
}
```
#### Road Trip
- Available at: `/api/v1/road_trip`
- Type of request: `POST`
- Required parameters:
- `origin`
- `destination`
- api_key
- Response example:
```
{
    "data": {
        "id": "3",
        "type": "trip",
        "attributes": {
            "origin": "Denver, CO, USA",
            "destination": "Albuquerque, NM, USA",
            "travel_time": "6 hours 37 mins",
            "arrival_forecast": "clear sky"
        }
    }
}
```
## CI using Travis
