module Model exposing (Model, Song, Seconds)

import Http

type alias Seconds = Int

type alias Song = {
    name : String,
    duration: Seconds
}

type alias Model = {
    searchTerm : String,
    loading: Bool,
    songs : List Song,
    error : Maybe Http.Error
}
