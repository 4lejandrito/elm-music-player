module View exposing (view)

import Html exposing (Html, div, text, h1, input, ul, li)
import Html.Events exposing (onInput)
import Html.Attributes exposing (placeholder, value, autofocus)
import Model exposing (Model, Songs(..))
import Messages exposing (Msg(..))

viewTime seconds =
    let
        minutes = seconds // 60
        remainingSeconds = seconds % 60
    in
        (toString minutes) ++ "' " ++ (toString remainingSeconds) ++ "''"

viewSong song =
    li [] [
        text (song.name ++ " (" ++ (viewTime song.duration) ++ ")")
    ]

viewSongs songs =
    case songs of
        Loading -> text "Loading"
        Failed error -> text (toString error)
        Present [] -> div [] [text "There are no songs to display"]
        Present songs -> ul [] (List.map viewSong songs)

view : Model -> Html Msg
view model =
    div [] [
        h1 [] [ text "Spotify player" ],
        input [
            autofocus True,
            placeholder "Find a song!",
            value model.searchTerm,
            onInput Search
        ] [],
        viewSongs model.songs
    ]
