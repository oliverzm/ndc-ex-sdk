defmodule FlightPriceTest do
  require Logger
  use ExUnit.Case
  require HTTPotion
  doctest NDCEx

  @flight_price_query [
        Query: [
          OriginDestination: [
            Flight: [
              Departure: [
                AirportCode: "ARN",
                Date: "2015-12-25",
                Time: "13:20"
              ],
              Arrival: [
                AirportCode: "FRA",
                Date: "2015-12-25",
                Time: "15:30"
              ],
              MarketingCarrier: [
                AirlineID: "9A",
                Name: "Athena Air",
                FlightNumber: "3803"
              ],
              OperatingCarrier: [
                AirlineID: "9A",
                Name: "Athena Air",
                FlightNumber: "3803"
              ],
              Equipment: [
                AircraftCode: "E95",
                Name: "E95 - EMBRAER 195 JET"
              ]
            ]
          ]
        ],
        DataLists: [
          OriginDestinationList: [
            OriginDestination: [
                DepartureCode: "ARN",
                ArrivalCode: "RIX"
            ]
          ]
        ],
        Metadata: [
          Other: [
            OtherMetadata: [
              CurrencyMetadatas: [
                CurrencyMetadata: [
                  _MetadataKey: "EUR",
                  Decimals: "2" 
                ]
              ]
            ]
          ]
        ]
      ]

  test "Call FlightPrice Request" do
    {status, _body} = NDCEx.request(:FlightPrice, @flight_price_query)
    IO.inspect _body
    assert status == :ok
  end
end
