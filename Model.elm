module Model exposing (..)

type alias GithubTrending =
  { data : List GithubRepo
  }

type alias GithubRepo =
  { repo : String
  , lang : String
  , author : String
  , repoUrl : String
  , star : Int
  }

-- MODEL
type Model = Trending (List GithubRepo) | Content String
