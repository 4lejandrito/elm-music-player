module View exposing (view)

import Html exposing (Html, div, text, h1, input, ul, li, audio, a)
import Html.Events exposing (onInput, onClick)
import Html.Attributes exposing (placeholder, value, autofocus, src, autoplay, href)
import Model exposing (Model, Songs(..))
import Messages exposing (Msg(..))

viewDuration seconds =
    let
        minutes = seconds // 60
        remainingSeconds = seconds % 60
    in
        (toString minutes) ++ "' " ++ (toString remainingSeconds) ++ "''"

viewSong song =
    li [onClick (PlaySong song)] [
        a [ href "#" ] [
            text (song.name ++ " (" ++ (viewDuration song.duration) ++ ")")
        ]
    ]

viewSongs songs =
    case songs of
        Loading -> text "Loading"
        Failed error -> text (toString error)
        Present [] -> div [] [text "There are no songs to display"]
        Present songs -> ul [] (List.map viewSong songs)

viewPlayer song =
    case song of
        Nothing -> text ""
        Just song -> audio [
            src song.url,
            autoplay True
        ] [
            text "Your browser does not support the audio element."
        ]

view : Model -> Html Msg
view model =
    div [] [
        h1 [] [ text "Spotify player" ],
        viewPlayer model.selectedSong,
        input [
            autofocus True,
            placeholder "Find a song!",
            value model.searchTerm,
            onInput Search
        ] [],
        viewSongs model.songs
    ]
