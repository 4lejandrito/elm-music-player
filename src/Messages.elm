module Messages exposing (..)

import Http
import Model exposing (Song)

type Msg = Search String
         | SongsFailed Http.Error
         | SongsReceived (List Song)
