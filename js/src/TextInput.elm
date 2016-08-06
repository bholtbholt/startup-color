module TextInput exposing (view)
import Html exposing (section, label, input, text)
import Html.Attributes exposing (class, type', value)
import Html.Events exposing (onInput)

view sectionClass inputLabel inputValue action =
  section [ class sectionClass ]
    [ label [ class "block h2" ] [ text inputLabel ]
    , input [ type' "text", value inputValue, onInput action ] []
  ]
