module Messages exposing (..)

import Http
import Model exposing (Song, Error)

type Msg
    = Search String
    | SongsFailed Error
    | SongsReceived (List Song)
    | PlaySong Song
