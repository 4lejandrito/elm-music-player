import Html.App as App
import Model exposing (Model)
import View exposing(view)
import Messages exposing(Msg)
import Update exposing (update)

init : (Model, Cmd Msg)
init = ({
    searchTerm = "",
    songs = [],
    error = Nothing,
    loading = False}, Cmd.none)

main = App.program {
    init = init,
    view = view,
    update = update,
    subscriptions = \model -> Sub.none}
