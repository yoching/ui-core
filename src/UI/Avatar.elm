module UI.Avatar exposing (..)

import Html exposing (Html, div)
import Html.Attributes exposing (alt, class, style)
import Maybe.Extra as MaybeE
import UI
import UI.Icon as Icon exposing (Icon)
import Url exposing (Url)


type alias Avatar msg =
    { text : Maybe String
    , url : Maybe Url
    , fallbackIcon : Maybe (Icon msg)
    }


view : Avatar msg -> Html msg
view { url, text, fallbackIcon } =
    case ( url, text ) of
        ( Nothing, Just n ) ->
            div
                [ class "avatar avatar-text"
                ]
                [ Html.text (String.left 1 n) ]

        ( Just a, _ ) ->
            div
                [ class "avatar avatar-image"
                , style "background" ("url(" ++ Url.toString a ++ ")")
                , alt "Avatar"
                ]
                []

        _ ->
            div
                [ class "avatar avatar-blank-icon"
                , alt "Avatar"
                ]
                [ MaybeE.unwrap UI.nothing Icon.view fallbackIcon ]