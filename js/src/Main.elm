import Html exposing (..)
import Html.App exposing (beginnerProgram)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Dict
import TextInput
import RadioInput
--import CheckboxInput

(=>) : a -> b -> ( a, b )
(=>) a b = ( a, b )

main =
  beginnerProgram { model = model, view = view, update = update }

-- MODEL

type alias Model =
  { name : String
  , location : String
  , revolutionary : Revolutionary
  , market : String
  , description : Description
  , position : Position
  , color : String
  , disruptedFields : {}
  , officePerks : {}
  }

model =
  { name = ""
  , location = ""
  , revolutionary = Yes
  , market = ""
  , description = Airbnb
  , position = ThoughtLeader
  , color = ""
  , disruptedFields =
      Dict.fromList
        [ "Automotive" =>
            { name = "Automotive"
            , checked = False
            }
        , "Alcohol" =>
            { name = "Alcohol"
            , checked = False
            }
        , "Banking" =>
            { name = "Banking"
            , checked = False
            }
        , "Construction" =>
            { name = "Construction"
            , checked = False
            }
        , "Education" =>
            { name = "Education"
            , checked = False
            }
        , "Energy" =>
            { name = "Energy"
            , checked = False
            }
        , "Fashion" =>
            { name = "Fashion"
            , checked = False
            }
        , "Film & Television" =>
            { name = "Film & Television"
            , checked = False
            }
        , "Food" =>
            { name = "Food"
            , checked = False
            }
        , "Health" =>
            { name = "Health"
            , checked = False
            }
        , "Insurance" =>
            { name = "Insurance"
            , checked = False
            }
        , "News" =>
            { name = "News"
            , checked = False
            }
        , "Legal" =>
            { name = "Legal"
            , checked = False
            }
        , "Medical" =>
            { name = "Medical"
            , checked = False
            }
        , "Music" =>
            { name = "Music"
            , checked = False
            }
        , "Real Estate" =>
            { name = "Real Estate"
            , checked = False
            }
        , "Retail" =>
            { name = "Retail"
            , checked = False
            }
        , "Service" =>
            { name = "Service"
            , checked = False
            }
        , "Sports" =>
            { name = "Sports"
            , checked = False
            }
        , "Technology" =>
            { name = "Technology"
            , checked = False
            }
        , "Telecommunications" =>
            { name = "Telecommunications"
            , checked = False
            }
        , "Travel & Tourism" =>
            { name = "Travel & Tourism"
            , checked = False
            }
        , "Utilities" =>
            { name = "Utilities"
            , checked = False
            }
        , "Video Games" =>
            { name = "Video Games"
            , checked = False
            }
        ]
  , officePerks =
      Dict.fromList
        [ "Exposed Brick" =>
            { name = "Exposed Brick"
            , checked = False
            }
        , "White-board Walls" =>
            { name = "White-board Walls"
            , checked = False
            }
        , "Roll-up Garage Door" =>
            { name = "Roll-up Garage Door"
            , checked = False
            }
        , "Beer Taps" =>
            { name = "Beer Taps"
            , checked = False
            }
        , "Stand-up Desks" =>
            { name = "Stand-up Desks"
            , checked = False
            }
        , "Ping Pong Tables" =>
            { name = "Ping Pong Tables"
            , checked = False
            }
        , "XBox One Console" =>
            { name = "XBox One Console"
            , checked = False
            }
        , "Playstation 4 Console" =>
            { name = "Playstation 4 Console"
            , checked = False
            }
        , "Foosball" =>
            { name = "Foosball"
            , checked = False
            }
        , "Exposed Pipes & Ceilings" =>
            { name = "Exposed Pipes & Ceilings"
            , checked = False
            }
        , "Stocked Fridge" =>
            { name = "Stocked Fridge"
            , checked = False
            }
        , "Dashboards" =>
            { name = "Dashboards"
            , checked = False
            }
        , "Bean Bag Chairs" =>
            { name = "Bean Bag Chairs"
            , checked = False
            }
        , "Nap Room" =>
            { name = "Nap Room"
            , checked = False
            }
        , "Yoga & Meditation Room" =>
            { name = "Yoga & Meditation Room"
            , checked = False
            }
        ]
  }

type Position
  = ThoughtLeader
  | ThoughtFollower

type Revolutionary
  = Yes
  | No

type Description
  = Airbnb
  | Amazon
  | Dropbox
  | Facebook
  | Google
  | Instagram
  | Linkedin
  | Netflix
  | Pinterest
  | Slack
  | Snapchat
  | Spotify
  | Stripe
  | Uber



-- UPDATE

type Msg
  = UpdateName String
  | UpdatePosition Position
  | UpdateMarket String
  | UpdateRevolutionary Revolutionary
  | UpdateDescription Description
  | UpdateLocation String
  | UpdateDisruptedField String Bool
  | UpdateOfficePerks String Bool
  | UpdateColor


update msg model =
  case msg of
    UpdateName value ->
      { model | name = value }

    UpdateLocation value ->
      { model | location = value }

    UpdateMarket value ->
      { model | market = value }

    UpdatePosition value ->
      { model | position = value }

    UpdateRevolutionary value ->
      { model | revolutionary = value }

    UpdateDescription value ->
      { model | description = value }

    UpdateColor ->
      { model | color = "blue" }

    UpdateDisruptedField checkboxId checked ->
      let
        updateRecord =
          Maybe.map (\checkboxData -> { checkboxData | checked = checked })

        disruptedFieldsUpdated =
          Dict.update checkboxId
          updateRecord
          model.disruptedFields
      in
        { model | disruptedFields = disruptedFieldsUpdated }

    UpdateOfficePerks checkboxId checked ->
      let
        updateRecord =
          Maybe.map (\checkboxData -> { checkboxData | checked = checked })

        officePerkUpdated =
          Dict.update checkboxId
          updateRecord
          model.officePerks
      in
        { model | officePerks = officePerkUpdated }



-- VIEW

view model =
  let
    disruptingCheckboxes ( key, data ) =
      label []
        [ input [ type' "checkbox", checked data.checked, onCheck (UpdateDisruptedField key) ] []
        , text data.name
        ]

    perkCheckboxes ( key, data ) =
      label []
        [ input [ type' "checkbox", checked data.checked, onCheck (UpdateOfficePerks key) ] []
        , text data.name
        ]
  in
    div [ class "elm-wrapper" ]
      [ TextInput.view "What is your startup name?" model.name UpdateName
      , TextInput.view "Where are you located?" model.location UpdateLocation
      , TextInput.view "Who are your target users?" model.market UpdateMarket
      , section [ id "disrupted-fields" ]
        [ h2 [] [ text "What fields are you disrupting?" ]
        , div [ class "multi-column" ]
          (model.disruptedFields |> Dict.toList |> List.map disruptingCheckboxes)
        ]
      , section [ id "revolutionary" ]
        [ h2 [] [ text "Are you revolutionary?"]
        , div [ class "multi-column" ]
          [ RadioInput.view "Yes" "revolutionary" Yes UpdateRevolutionary
          , RadioInput.view "No" "revolutionary" No UpdateRevolutionary
          ]
        ]
      , section [ id "market" ]
        [ h2 [] [ text "Describe your startup:" ]
        , div [ class "multi-column" ]
          [ RadioInput.view ("Airbnb but for " ++ model.market) "description" Airbnb UpdateDescription
          , RadioInput.view ("Amazon but for " ++ model.market) "description" Amazon UpdateDescription
          , RadioInput.view ("Dropbox but for " ++ model.market) "description" Dropbox UpdateDescription
          , RadioInput.view ("Facebook but for " ++ model.market) "description" Facebook UpdateDescription
          , RadioInput.view ("Google but for " ++ model.market) "description" Google UpdateDescription
          , RadioInput.view ("Instagram but for " ++ model.market) "description" Instagram UpdateDescription
          , RadioInput.view ("Linkedin but for " ++ model.market) "description" Linkedin UpdateDescription
          , RadioInput.view ("Netflix but for " ++ model.market) "description" Netflix UpdateDescription
          , RadioInput.view ("Pinterest but for " ++ model.market) "description" Pinterest UpdateDescription
          , RadioInput.view ("Slack but for " ++ model.market) "description" Slack UpdateDescription
          , RadioInput.view ("Snapchat but for " ++ model.market) "description" Snapchat UpdateDescription
          , RadioInput.view ("Spotify but for " ++ model.market) "description" Spotify UpdateDescription
          , RadioInput.view ("Stripe but for " ++ model.market) "description" Stripe UpdateDescription
          , RadioInput.view ("Uber but for " ++ model.market) "description" Uber UpdateDescription
          ]
        ]
      , section [ id "office-perks" ]
        [ h2 [] [ text "What perks are available in your office?" ]
        , div [ class "multi-column" ]
          (model.officePerks |> Dict.toList |> List.map perkCheckboxes)
        ]
      , section [ id "position" ]
        [ h2 [] [ text "Are you a thought-leader or thought-follower?" ]
        , div [ class "multi-column" ]
          [ RadioInput.view "Thought Leader" "position" ThoughtLeader UpdatePosition
          , RadioInput.view "Thought Follower" "position" ThoughtFollower UpdatePosition
          ]
        ]
      , div []
        [ button [ onClick UpdateColor ]
          [ text "Find your color" ]
          , text model.color
        ]
      ]

-- progress bar/counter
-- enter to move to next question
-- autofocus questions
-- before/next buttons
-- loop questions


