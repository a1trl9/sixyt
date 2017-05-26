import Html exposing (Html)
import Model exposing (Model, Model(..))
import Subscription exposing (subscriptions)
import Update exposing (Msg, update, getRepoInfo)
import View exposing (header)

main =
  Html.program
    { init = init "init"
    , update = update
    , view = header
    , subscriptions = subscriptions
    }

-- INIT
init : String -> (Model, Cmd Msg)
init str = 
  (Content str, getRepoInfo)
