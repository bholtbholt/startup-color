module TextInput exposing (view)
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)

view sectionId inputLabel inputValue action =
  section [ id sectionId ]
    [ label [ class "block h2" ] [ text inputLabel ]
    , input [ type' "text", value inputValue, onInput action ] []
  ]
