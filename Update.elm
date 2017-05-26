module Update exposing (..)

import Http
import Json.Decode exposing (Decoder, list, string, int)
import Json.Decode.Pipeline exposing (required, decode)
import Model exposing (Model, GithubTrending, GithubRepo, Model(..))

-- UPDATE
type Msg = Content String | LatestInfo (Result Http.Error GithubTrending)

update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
  case msg of
    LatestInfo (Ok info) ->
      (Trending info.data, Cmd.none)
    LatestInfo (Err _) ->
      (model, Cmd.none)
    Content str ->
      (model, Cmd.none)

-- HTTP REQUEST
getRepoInfo : Cmd Msg
getRepoInfo =
  let url =
    "http://127.0.0.1:8080/test/index.json"
  in Http.send LatestInfo (Http.get url decodeTrendingInfo)

-- JSON DECODE
decodeTrendingInfo : Decoder GithubTrending
decodeTrendingInfo =
  decode GithubTrending
    |> required "data" decodeReposInfo

decodeReposInfo : Decoder (List GithubRepo)
decodeReposInfo =
  list decodeRepoInfo

decodeRepoInfo : Decoder GithubRepo
decodeRepoInfo =
  decode GithubRepo
    |> required "repo" string
    |> required "lang" string
    |> required "author" string
    |> required "repoUrl" string
    |> required "star" int
