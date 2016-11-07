module Model exposing (..)

import Http

type alias Seconds = Int

type alias Error = Http.Error

type alias Song = {
    name : String,
    duration: Seconds,
    url: String
}

type Songs = Loading | Failed Error | Present (List Song)

type alias Model = {
    searchTerm : String,
    songs : Songs,
    selectedSong : Maybe Song
}
