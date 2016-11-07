module Decoder exposing(songsDecoder)

import Json.Decode as Json exposing ((:=), andThen, succeed)
import Model exposing (Song, Seconds)

songsDecoder : Json.Decoder (List Song)
songsDecoder = "tracks" := ("items" := Json.list songDecoder)

songDecoder : Json.Decoder Song
songDecoder =
    Json.object2 Song
        ("name" := Json.string)
        ("duration_ms" := durationDecoder)

durationDecoder : Json.Decoder Seconds
durationDecoder = Json.int `andThen` \val -> succeed (val // 1000)
