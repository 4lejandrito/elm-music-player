module Update exposing(update)

import String
import Model exposing (Model, Songs(..), Song)
import Messages exposing(Msg(..))
import Commands exposing (getSongs)

update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
    case msg of

        Search text -> ({
            model |
            searchTerm = text,
            songs = if String.isEmpty text then Present [] else Loading
        }, if String.isEmpty text then Cmd.none else getSongs text)

        SongsReceived songs -> ({
            model | songs = Present songs
        }, Cmd.none)

        SongsFailed error -> ({
            model | songs = Failed error
        }, Cmd.none)

        PlaySong song -> ({
            model | selectedSong = Just song
        }, Cmd.none)
