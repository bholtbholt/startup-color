import Html exposing (text, section, h2, div, p, button, label, input)
import Html.App exposing (beginnerProgram)
import Html.Attributes exposing (class, style, type', checked)
import Html.Events exposing (onClick, onCheck)
import Dict
import TextInput
import RadioInput

(=>) : a -> b -> ( a, b )
(=>) a b = ( a, b )

main =
  beginnerProgram { model = model, view = view, update = update }

-- MODEL

type alias Model =
  { progress : Int
  , name : String
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
  { progress = 0
  , name = ""
  , location = ""
  , revolutionary = Yes
  , market = ""
  , description = Airbnb
  , position = ThoughtLeader
  , color = ""
  , disruptedFields =
      Dict.fromList
        [ "Advertising & Marketing" =>
            { name = "Advertising & Marketing"
            , checked = False
            }
        , "Banking" =>
            { name = "Banking"
            , checked = False
            }
        , "Education" =>
            { name = "Education"
            , checked = False
            }
        , "Health" =>
            { name = "Health"
            , checked = False
            }
        , "Entertainment" =>
            { name = "Entertainment"
            , checked = False
            }
        , "Service" =>
            { name = "Service"
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
        , "Free Beer & Snacks" =>
            { name = "Free Beer & Snacks"
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
        , "Arcade Machines" =>
            { name = "Arcade Machines"
            , checked = False
            }
        , "Foosball" =>
            { name = "Foosball"
            , checked = False
            }
        , "Nap Room" =>
            { name = "Nap Room"
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
  | Dropbox
  | Facebook
  | Netflix
  | Pinterest
  | Slack
  | Snapchat
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
  | UpdateProgress Int


update msg model =
  case msg of
    UpdateName value ->
      { model | name = value }

    UpdateProgress value ->
      { model | progress = (clamp 0 9 (model.progress + value)) }

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
      { model | color = "It's blue." }

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

    sectionActivator ( number ) =
      if model.progress == number
      then "section active"
      else "section"

    colorChanger ( number ) =
      if number == 1 then "bg-blue"
      else if number == 2 then "bg-purple"
      else if number == 3 then "bg-red"
      else if number == 4 then "bg-orange"
      else if number == 5 then "bg-yellow"
      else if number == 6 then "bg-green"
      else ""

    revolutionarySummary =
      if model.revolutionary == Yes
      then "revolutionary new"
      else "newest"

    positionSummary =
      if model.position == ThoughtLeader
      then "A thought-leader in their space, "
      else "Following trends set by their peers, "

    disruptingSummary =
      "disrupting the industries"

    --perksSummary =
    --  if model.officePerks.size < 3
    --  then "Their office is quaint with all the startup necessities, "
    --  else if model.officePerks.size < 6
    --  then "They're in a great space with all the regular startup perks, "
    --  else "They're a full-blown startup with "


    progressStart = model.progress == 0
    questionsComplete = model.progress == 8
    progressComplete = model.progress == 9

  in
    div [ class ("elm-wrapper " ++ (colorChanger model.progress)) ]
      [ div [ class "progress-bar" ]
        [ div
          [ style [ ("width", ((toString ((toFloat model.progress) / 9 * 100))++ "%")) ]
          , class "progress-indication"
          ] []
        ]
      , div [ if progressComplete then class "progress-buttons hidden" else class "progress-buttons" ]
        [ button
          [ if progressStart then class "btn-primary hidden" else class "btn-primary"
          , onClick (UpdateProgress -1)
          ] [ text "Back" ]
        , button
          [ class "btn-primary"
          , onClick (UpdateProgress  1)
          ] [ text (
              if progressStart then "Get Started"
              else if questionsComplete then "Complete"
              else "Next" )
            ]
        ]
      , section [ class (sectionActivator 0) ]
        [ h2 [] [ text "Welcome to Startup Colour." ]
        , p [] [ text "8 questions to define your startup's brand." ]
        ]
      , TextInput.view (sectionActivator 1) "What is your startup's name?" model.name UpdateName
      , TextInput.view (sectionActivator 2) "Where are you located?" model.location UpdateLocation
      , TextInput.view (sectionActivator 3) "Who are your target users?" model.market UpdateMarket
      , section [ class (sectionActivator 4) ]
        [ h2 [] [ text "What fields are you disrupting?" ]
        , div [ class "multi-column" ]
          (model.disruptedFields |> Dict.toList |> List.map disruptingCheckboxes)
        ]
      , section [ class (sectionActivator 5) ]
        [ h2 [] [ text "Are you revolutionary?"]
        , RadioInput.view "Yes" "revolutionary" Yes UpdateRevolutionary
        , RadioInput.view "No" "revolutionary" No UpdateRevolutionary
        ]
      , section [ class (sectionActivator 6) ]
        [ h2 [] [ text "Describe your startup:" ]
        , div [ class "multi-column" ]
          [ RadioInput.view ("Airbnb but for " ++ model.market) "description" Airbnb UpdateDescription
          , RadioInput.view ("Dropbox but for " ++ model.market) "description" Dropbox UpdateDescription
          , RadioInput.view ("Facebook but for " ++ model.market) "description" Facebook UpdateDescription
          , RadioInput.view ("Netflix but for " ++ model.market) "description" Netflix UpdateDescription
          , RadioInput.view ("Pinterest but for " ++ model.market) "description" Pinterest UpdateDescription
          , RadioInput.view ("Slack but for " ++ model.market) "description" Slack UpdateDescription
          , RadioInput.view ("Snapchat but for " ++ model.market) "description" Snapchat UpdateDescription
          , RadioInput.view ("Stripe but for " ++ model.market) "description" Stripe UpdateDescription
          , RadioInput.view ("Uber but for " ++ model.market) "description" Uber UpdateDescription
          ]
        ]
      , section [ class (sectionActivator 7) ]
        [ h2 [] [ text "What are your office perks?" ]
        , div [ class "multi-column" ]
          (model.officePerks |> Dict.toList |> List.map perkCheckboxes)
        ]
      , section [ class (sectionActivator 8) ]
        [ h2 [] [ text "Are you a thought-leader or thought-follower?" ]
        , RadioInput.view "Thought Leader" "position" ThoughtLeader UpdatePosition
        , RadioInput.view "Thought Follower" "position" ThoughtFollower UpdatePosition
        ]
      , section [ class (sectionActivator 9) ]
        [ p []
          [ text
            ( "Meet "
            ++ model.name -- StartupColor
            ++ ", the "
            ++ revolutionarySummary -- revolutionary new
            ++ " startup from "
            ++ model.location -- Vancouver
            --++ (toString (model.officePerks |> Dict.toList |> List.map .checked officePerks))
            --++ (get "White-board Walls" model.officePerks.length)
            --++ officePerksSummary
            ++ ". "
            ++ positionSummary -- A thought-leader in their space
            ++ model.name -- StartupColor
            ++ " is "
            ++ disruptingSummary -- disrupting the tech industry.
            ++ "They're just like "
            ++ (toString model.description) -- Airbnb
            ++ " but for "
            ++ model.market -- people who tech
            ++ "."
            )
          ]
        , button [ class "btn-primary", onClick UpdateColor ]
          [ text "Find your color" ]
          , text model.color
        ]
      ]

-- add message before finding colour = Meet startup name, a revolutionary new bla bal
-- enter to move to next question
-- autofocus questions
