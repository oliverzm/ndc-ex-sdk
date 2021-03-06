defmodule NDCEx.Message.FlightPriceRQ do
  import XmlBuilder
  # this is just example of 'params' variable. defined for testing purpose
  @query_params [
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

  def yield(params), do: build(params)

  defp build(params) do
		[
			element(:Query, params[:Query]),
			element(:DataLists, params[:DataLists]),
			element(:Metadata, meta_data(params[:Metadata][:Other][:OtherMetadata][:CurrencyMetadatas]))
		]
  end

	defp meta_data(params) do
		[
			element(:Other, [
				element(:OtherMetadata, [
					element(:CurrencyMetadatas, [
						element(:CurrencyMetadata, %{MetadataKey: params[:CurrencyMetadata][:_MetadataKey]}, [
							element(:Decimals, params[:CurrencyMetadata][:Decimals])
						])
					])
				])
			])
		]
	end
end
