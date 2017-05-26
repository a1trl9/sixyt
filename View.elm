module View exposing (..)

import Html exposing (Html, div, span, h1, h2, a, text)
import Html.Attributes exposing (..)
import Model exposing (Model, Model(..))
import Update exposing (Msg)

-- VIEW
header : Model -> Html Msg
header model =
  case model of
    Trending info ->
      div []
        (List.map (\l ->
          div [] [
            a [ href l.repoUrl ] [ text l.repo ]
            , div [] [ text l.author ]
            , div [] [
              span [] [ text l.lang ]
              , span [] [ text (toString l.star) ]
              ]
            ]) info)
    Content str ->
      div [class "header-container"]
        [ h1 [ class "header" ] [ text "2017_NOTES" ]
        , h2 [ class "sub-header" ] [ text "ABOUT NOTHING" ]
        , div [] []
        ]
