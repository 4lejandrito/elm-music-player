import Html.App as App
import Model exposing (Model, Songs(..))
import View exposing(view)
import Messages exposing(Msg)
import Update exposing (update)

init : (Model, Cmd Msg)
init = ({
    searchTerm = "",
    songs = Present [],
    selectedSong = Nothing}, Cmd.none)

main : Program Never
main = App.program {
    init = init,
    view = view,
    update = update,
    subscriptions = \model -> Sub.none}
