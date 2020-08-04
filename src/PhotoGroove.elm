module PhotoGroove exposing (main)

import Browser
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick)

view model =
    div [ class "container"] [
        h1 [] [ text "Photo Groove"]
        , p [] [text "Hello Guys this is my first ELM app"]
        , ul [ class "server_list"] (List.map ( buildServer model.selectedServer ) model.servers )
    ]

initialModel =
    {
        servers = [
            {id = 27, location = "Germany"}
            , {id = 17, location = "Finland"}
            , {id = 82, location = "Russia"}
            , {id = 7, location = "Japan"}
            , {id = 12, location = "England"}
        ]
       , selectedServer = 7
    }

buildServer default server =
        li [ classList [("default", default == server.id)]
            , onClick { description = "SelectedServer", data = server.id }
            ]
            [ text "Id : ", text (String.fromInt server.id)
            , span [] [text " -----> Location: ", text server.location
            ]
        ]

update msg model =
    if msg.description == "SelectedServer" then
        { model | selectedServer = msg.data}
    else
        model


main =
    Browser.sandbox
    {
        init = initialModel
        , view = view
        , update = update
    }