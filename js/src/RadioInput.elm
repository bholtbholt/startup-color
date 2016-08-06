module RadioInput exposing (view)
import Html exposing (label, input, text)
import Html.Attributes exposing (type', name)
import Html.Events exposing (onClick)

view inputLabel inputName inputValue action =
  label []
    [ input [ type' "radio", name inputName, onClick (action inputValue) ] []
    , text inputLabel
    ]
