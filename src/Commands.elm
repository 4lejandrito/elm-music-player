module Commands exposing(getSongs)

import Http
import Task
import Messages exposing(Msg(..))
import Decoder exposing (songsDecoder)

getSongs : String -> Cmd Msg
getSongs searchTerm =
  let
    url = "https://api.spotify.com/v1/search?type=track&q=" ++ (Http.uriEncode searchTerm)
  in
    Task.perform SongsFailed SongsReceived (Http.get songsDecoder url)
