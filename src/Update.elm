module Update exposing(update)

import Http
import Task
import String
import Model exposing (Model, Song, Seconds)
import Messages exposing(Msg(..))
import Decoder exposing (songsDecoder)

update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
    case msg of

        Search text -> ({
            model |
            searchTerm = text,
            songs = [],
            loading = not (String.isEmpty text)
        }, if String.isEmpty text then Cmd.none else getSongs text)

        SongsFailed error -> ({
            model | error = Just error, loading = False
        }, Cmd.none)

        SongsReceived songs -> ({
            model | songs = songs, loading = False
        }, Cmd.none)

getSongs : String -> Cmd Msg
getSongs searchTerm =
  let
    url = "https://api.spotify.com/v1/search?type=track&q=" ++ (Http.uriEncode searchTerm)
  in
    Task.perform SongsFailed SongsReceived (Http.get songsDecoder url)
