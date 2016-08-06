module CheckboxInput exposing (view)
import Html exposing (label, input, text)
import Html.Attributes exposing (type', checked)
import Html.Events exposing (onCheck)

view key data action =
  label []
    [ input [ type' "checkbox", checked data.checked, onCheck (action key) ] []
    , text data.name
    ]
