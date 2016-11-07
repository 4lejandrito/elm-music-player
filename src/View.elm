module View exposing (view)

import Html exposing (Html, div, text, h1, input, ul, li)
import Html.Events exposing (onClick, onInput)
import Html.Attributes exposing (placeholder, value, autofocus)
import Model exposing (Model, Song, Seconds)
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
    if List.isEmpty songs then
        div [] [text "There are no songs to display"]
    else
        ul [] (List.map viewSong songs)

view : Model -> Html Msg
view model =
    case model.error of
        Just error -> text (toString error)
        Nothing ->
            div [] [
                h1 [] [ text "Spotify player" ],
                input [
                    autofocus True,
                    placeholder "Find a song!",
                    value model.searchTerm,
                    onInput Search
                ] [],
                if model.loading then text "Loading" else text "",
                viewSongs model.songs
            ]
