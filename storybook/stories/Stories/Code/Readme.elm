module Stories.Code.Readme exposing (..)

import Browser
import Code.Definition.Doc as Doc
import Code.Definition.Readme as Readme exposing (Readme)
import Code.Syntax as Syntax
import Code.Workspace.Zoom exposing (Zoom(..))
import Html exposing (Html)
import Json.Decode exposing (decodeString)
import UI.Click as Click
import Helpers.Layout exposing (col)

sampleToClick : Syntax.ToClick ()
sampleToClick =
    \_ -> Click.Disabled


sampleTooltipConfig : Syntax.TooltipConfig ()
sampleTooltipConfig =
    { toHoverStart = \_ -> ()
    , toHoverEnd = \_ -> ()
    , toTooltip = \_ -> Nothing
    }


config : Syntax.LinkedWithTooltipConfig ()
config =
    { toClick = sampleToClick
    , tooltip = sampleTooltipConfig
    }


sampleFoldId : Doc.FoldId
sampleFoldId =
    Doc.FoldId []


sampleToggles : Doc.DocFoldToggles
sampleToggles =
    Doc.emptyDocFoldToggles


sampleReadme : Readme
sampleReadme =
    Readme.Readme <| Doc.Word "sample doc word"


sampleView : Html ()
sampleView =
    Readme.view
        config
        (\_ -> ())
        sampleToggles
        sampleReadme


type alias Model =
    ()


main : Program () Model ()
main =
    Browser.element
        { init = \_ -> ( (), Cmd.none )
        , view = view
        , update = update
        , subscriptions = \_ -> Sub.none
        }


update : () -> () -> ( (), Cmd () )
update _ _ =
    ( (), Cmd.none )


view : Model -> Html ()
view _ =
    case decodeReadme of
        Err error ->
            col [] [ Html.text (Json.Decode.errorToString error) ]

        Ok readme ->
            Debug.log 
                "log"
                Readme.view
                config
                (\_ -> ())
                sampleToggles
                readme


decodeReadme : Result Json.Decode.Error Readme
decodeReadme =
    decodeString Readme.decode readmeSample3


readmeSample3 : String
readmeSample3 = """
{
    "contents": [
        {
            "contents": "Read",
            "tag": "Word"
        },
        {
            "contents": "me!",
            "tag": "Word"
        }
    ],
    "tag": "Paragraph"
}
"""

readmeSample2 : String
readmeSample2 = """
{"termDefinitions":{"#9fuc7rc235p4okvll4g4haamponj054lln4ohflsvdec256dq776b8nik98tmjrsqfbc28s5o88v059svrv1rjkn66r61rp99cq7osg":{"termNames":["public.file.latest.README"],"bestTermName":"latest.README","defnTermTag":"Doc","termDefinition":{"tag":"UserObject","contents":[{"annotation":{"contents":"latest.README","tag":"HashQualifier"},"segment":"latest.README"},{"annotation":{"tag":"TypeAscriptionColon"},"segment":" :"},{"annotation":null,"segment":" "},{"annotation":{"contents":"#ej86si0ur1lsjade71dojr25phk9bbom9rdks6dltolos5tjivakujcriqe02npba53n9gd7tkh8bmv08ttjb9t35lq2ch5heshqcs0","tag":"TypeReference"},"segment":"Doc"},{"annotation":null,"segment":"\\n"},{"annotation":{"contents":"latest.README","tag":"HashQualifier"},"segment":"latest.README"},{"annotation":{"tag":"BindingEquals"},"segment":" ="},{"annotation":null,"segment":"\\n"},{"annotation":null,"segment":"  "},{"annotation":{"tag":"DocDelimiter"},"segment":"{{"},{"annotation":null,"segment":" "},{"annotation":null,"segment":"#"},{"annotation":null,"segment":" "},{"annotation":null,"segment":"File"},{"annotation":null,"segment":" "},{"annotation":null,"segment":"utilities"},{"annotation":null,"segment":"\\n"},{"annotation":null,"segment":"  "},{"annotation":null,"segment":"\\n"},{"annotation":null,"segment":"  "},{"annotation":null,"segment":"  "},{"annotation":null,"segment":"Helpers"},{"annotation":null,"segment":" "},{"annotation":null,"segment":"for"},{"annotation":null,"segment":" "},{"annotation":null,"segment":"dealing"},{"annotation":null,"segment":" "},{"annotation":null,"segment":"with"},{"annotation":null,"segment":" "},{"annotation":null,"segment":"files."},{"annotation":null,"segment":"\\n"},{"annotation":null,"segment":"  "},{"annotation":null,"segment":"  "},{"annotation":null,"segment":"\\n"},{"annotation":null,"segment":"  "},{"annotation":null,"segment":"  "},{"annotation":null,"segment":"* "},{"annotation":null,"segment":"{"},{"annotation":{"contents":"#u5sprmftsjd0v1jddhtiqmm1ru6ac4humubuefs0gj8t89mcvkvha0idugsc52ij0ajulq905b8arqkqm524j1qdt1tmglln505arm8","tag":"TermReference"},"segment":"appendFile"},{"annotation":null,"segment":"}"},{"annotation":null,"segment":"\\n"},{"annotation":null,"segment":"  "},{"annotation":null,"segment":"  "},{"annotation":null,"segment":"* "},{"annotation":null,"segment":"{"},{"annotation":{"contents":"#0h20d6hbk2k6rrtssd0neej2glefg4pj4ch18rcqvbt6otdevd7cvlfn115b32ft56rdnhagnbpid23hq73357bisht3u206fksalro","tag":"TermReference"},"segment":"readFile"},{"annotation":null,"segment":"}"},{"annotation":null,"segment":"\\n"},{"annotation":null,"segment":"  "},{"annotation":null,"segment":"  "},{"annotation":null,"segment":"* "},{"annotation":null,"segment":"{"},{"annotation":{"contents":"#626og62l40dlejbtnm7dkbj004omumtu7t60f2j0d0prpo6fhitm22m523auh19hvskjfr7fk5mlgcrpkrtakr64h84t15d9obp6llo","tag":"TermReference"},"segment":"writeFile"},{"annotation":null,"segment":"}"},{"annotation":null,"segment":"\\n"},{"annotation":null,"segment":"  "},{"annotation":null,"segment":"  "},{"annotation":null,"segment":"* "},{"annotation":null,"segment":"{"},{"annotation":{"contents":"#j0k72dube9tgcg3r5tr3kn83j6no1qnjn022q089vto6fru53e0ni0j5hnah8l47i9im29fhpr0nstsobffn7ni5j7lrcjc3pknn4io","tag":"TermReference"},"segment":"appendFileUtf8"},{"annotation":null,"segment":"}"},{"annotation":null,"segment":"\\n"},{"annotation":null,"segment":"  "},{"annotation":null,"segment":"  "},{"annotation":null,"segment":"* "},{"annotation":null,"segment":"{"},{"annotation":{"contents":"#l4gfnrqfq3glvdn7mbni00esdj45r1mrrm3sac3di257ihjs30v8ogtjglcm4bq0b9kb1mqq0j2hch75ntgo5f8rmlurvk0dngsph38","tag":"TermReference"},"segment":"readFileUtf8"},{"annotation":null,"segment":"}"},{"annotation":null,"segment":"\\n"},{"annotation":null,"segment":"  "},{"annotation":null,"segment":"  "},{"annotation":null,"segment":"* "},{"annotation":null,"segment":"{"},{"annotation":{"contents":"#pqon65lud6a1rgq7buch45gjl8qelsdhgb8m3hbdhe98m7km6299h8ilks4c2c17ugktsk6rbmaokkg4nojbh4pba0p1iql5hr44too","tag":"TermReference"},"segment":"writeFileUtf8"},{"annotation":null,"segment":"}"},{"annotation":null,"segment":" "},{"annotation":{"tag":"DocDelimiter"},"segment":"}}"}]},"signature":[{"annotation":{"contents":"#ej86si0ur1lsjade71dojr25phk9bbom9rdks6dltolos5tjivakujcriqe02npba53n9gd7tkh8bmv08ttjb9t35lq2ch5heshqcs0","tag":"TypeReference"},"segment":"Doc"}],"termDocs":[["latest.README","#9fuc7rc235p4okvll4g4haamponj054lln4ohflsvdec256dq776b8nik98tmjrsqfbc28s5o88v059svrv1rjkn66r61rp99cq7osg",{"contents":[{"contents":[{"contents":"File","tag":"Word"},{"contents":"utilities","tag":"Word"}],"tag":"Paragraph"},[{"contents":[{"contents":"Helpers","tag":"Word"},{"contents":"for","tag":"Word"},{"contents":"dealing","tag":"Word"},{"contents":"with","tag":"Word"},{"contents":"files.","tag":"Word"}],"tag":"Paragraph"},{"contents":[{"contents":[{"contents":{"contents":[{"annotation":{"contents":"#u5sprmftsjd0v1jddhtiqmm1ru6ac4humubuefs0gj8t89mcvkvha0idugsc52ij0ajulq905b8arqkqm524j1qdt1tmglln505arm8","tag":"TermReference"},"segment":"appendFile"}],"tag":"Link"},"tag":"Special"}],"tag":"Paragraph"},{"contents":[{"contents":{"contents":[{"annotation":{"contents":"#0h20d6hbk2k6rrtssd0neej2glefg4pj4ch18rcqvbt6otdevd7cvlfn115b32ft56rdnhagnbpid23hq73357bisht3u206fksalro","tag":"TermReference"},"segment":"readFile"}],"tag":"Link"},"tag":"Special"}],"tag":"Paragraph"},{"contents":[{"contents":{"contents":[{"annotation":{"contents":"#626og62l40dlejbtnm7dkbj004omumtu7t60f2j0d0prpo6fhitm22m523auh19hvskjfr7fk5mlgcrpkrtakr64h84t15d9obp6llo","tag":"TermReference"},"segment":"writeFile"}],"tag":"Link"},"tag":"Special"}],"tag":"Paragraph"},{"contents":[{"contents":{"contents":[{"annotation":{"contents":"#j0k72dube9tgcg3r5tr3kn83j6no1qnjn022q089vto6fru53e0ni0j5hnah8l47i9im29fhpr0nstsobffn7ni5j7lrcjc3pknn4io","tag":"TermReference"},"segment":"appendFileUtf8"}],"tag":"Link"},"tag":"Special"}],"tag":"Paragraph"},{"contents":[{"contents":{"contents":[{"annotation":{"contents":"#l4gfnrqfq3glvdn7mbni00esdj45r1mrrm3sac3di257ihjs30v8ogtjglcm4bq0b9kb1mqq0j2hch75ntgo5f8rmlurvk0dngsph38","tag":"TermReference"},"segment":"readFileUtf8"}],"tag":"Link"},"tag":"Special"}],"tag":"Paragraph"},{"contents":[{"contents":{"contents":[{"annotation":{"contents":"#pqon65lud6a1rgq7buch45gjl8qelsdhgb8m3hbdhe98m7km6299h8ilks4c2c17ugktsk6rbmaokkg4nojbh4pba0p1iql5hr44too","tag":"TermReference"},"segment":"writeFileUtf8"}],"tag":"Link"},"tag":"Special"}],"tag":"Paragraph"}],"tag":"BulletedList"}]],"tag":"Section"}]]}},"typeDefinitions":{},"missingDefinitions":[]}"""


readmeSample : String
readmeSample = """{
    "termDefinitions": {
        "#1444pla0bqsncfv212494rfuhl9fuqh7uhf8api0k0q235npufpo1ee79bs4j42s7m2lo5o9oo6ppmmqlr37i8ekrsp2pbc8suonqbo": {
            "termNames": [
                "base.README",
                "lab.lib.base.README"
            ],
            "bestTermName": "base.README",
            "defnTermTag": "Doc",
            "termDefinition": {
                "tag": "UserObject",
                "contents": [
                    {
                        "annotation": {
                            "contents": "base.README",
                            "tag": "HashQualifier"
                        },
                        "segment": "base.README"
                    },
                    {
                        "annotation": {
                            "tag": "TypeAscriptionColon"
                        },
                        "segment": " :"
                    },
                    {
                        "annotation": null,
                        "segment": " "
                    },
                    {
                        "annotation": {
                            "contents": "#ej86si0ur1lsjade71dojr25phk9bbom9rdks6dltolos5tjivakujcriqe02npba53n9gd7tkh8bmv08ttjb9t35lq2ch5heshqcs0",
                            "tag": "TypeReference"
                        },
                        "segment": "Doc"
                    },
                    {
                        "annotation": null,
                        "segment": "\\n"
                    },
                    {
                        "annotation": {
                            "contents": "base.README",
                            "tag": "HashQualifier"
                        },
                        "segment": "base.README"
                    },
                    {
                        "annotation": {
                            "tag": "BindingEquals"
                        },
                        "segment": " ="
                    },
                    {
                        "annotation": null,
                        "segment": "\\n"
                    },
                    {
                        "annotation": null,
                        "segment": "  "
                    },
                    {
                        "annotation": {
                            "tag": "DocDelimiter"
                        },
                        "segment": "{{"
                    },
                    {
                        "annotation": null,
                        "segment": "\\n"
                    },
                    {
                        "annotation": null,
                        "segment": "  "
                    },
                    {
                        "annotation": null,
                        "segment": "#"
                    },
                    {
                        "annotation": null,
                        "segment": " "
                    },
                    {
                        "annotation": null,
                        "segment": "The"
                    },
                    {
                        "annotation": null,
                        "segment": " "
                    },
                    {
                        "annotation": null,
                        "segment": "Unison"
                    },
                    {
                        "annotation": null,
                        "segment": " "
                    },
                    {
                        "annotation": null,
                        "segment": "Base"
                    },
                    {
                        "annotation": null,
                        "segment": " "
                    },
                    {
                        "annotation": null,
                        "segment": "Library"
                    },
                    {
                        "annotation": null,
                        "segment": "\\n"
                    },
                    {
                        "annotation": null,
                        "segment": "  "
                    },
                    {
                        "annotation": null,
                        "segment": "\\n"
                    },
                    {
                        "annotation": null,
                        "segment": "  "
                    },
                    {
                        "annotation": null,
                        "segment": "  "
                    },
                    {
                        "annotation": null,
                        "segment": "This"
                    },
                    {
                        "annotation": null,
                        "segment": " "
                    },
                    {
                        "annotation": null,
                        "segment": "library"
                    },
                    {
                        "annotation": null,
                        "segment": " "
                    },
                    {
                        "annotation": null,
                        "segment": "provides"
                    },
                    {
                        "annotation": null,
                        "segment": " "
                    },
                    {
                        "annotation": null,
                        "segment": "essential"
                    },
                    {
                        "annotation": null,
                        "segment": " "
                    },
                    {
                        "annotation": null,
                        "segment": "Unison"
                    },
                    {
                        "annotation": null,
                        "segment": " "
                    },
                    {
                        "annotation": null,
                        "segment": "functionality,"
                    },
                    {
                        "annotation": null,
                        "segment": " "
                    },
                    {
                        "annotation": null,
                        "segment": "data"
                    },
                    {
                        "annotation": null,
                        "segment": " "
                    },
                    {
                        "annotation": null,
                        "segment": "types,"
                    },
                    {
                        "annotation": null,
                        "segment": " "
                    },
                    {
                        "annotation": null,
                        "segment": "and"
                    },
                    {
                        "annotation": null,
                        "segment": "\\n"
                    },
                    {
                        "annotation": null,
                        "segment": "  "
                    },
                    {
                        "annotation": null,
                        "segment": "  "
                    },
                    {
                        "annotation": null,
                        "segment": "shared"
                    },
                    {
                        "annotation": null,
                        "segment": " "
                    },
                    {
                        "annotation": null,
                        "segment": "abstractions"
                    },
                    {
                        "annotation": null,
                        "segment": " "
                    },
                    {
                        "annotation": null,
                        "segment": "used"
                    },
                    {
                        "annotation": null,
                        "segment": " "
                    },
                    {
                        "annotation": null,
                        "segment": "by"
                    },
                    {
                        "annotation": null,
                        "segment": " "
                    },
                    {
                        "annotation": null,
                        "segment": "most"
                    },
                    {
                        "annotation": null,
                        "segment": " "
                    },
                    {
                        "annotation": null,
                        "segment": "other"
                    },
                    {
                        "annotation": null,
                        "segment": " "
                    },
                    {
                        "annotation": null,
                        "segment": "libraries"
                    },
                    {
                        "annotation": null,
                        "segment": " "
                    },
                    {
                        "annotation": null,
                        "segment": "and"
                    },
                    {
                        "annotation": null,
                        "segment": " "
                    },
                    {
                        "annotation": null,
                        "segment": "applications,"
                    },
                    {
                        "annotation": null,
                        "segment": " "
                    },
                    {
                        "annotation": null,
                        "segment": "as"
                    },
                    {
                        "annotation": null,
                        "segment": " "
                    },
                    {
                        "annotation": null,
                        "segment": "well"
                    },
                    {
                        "annotation": null,
                        "segment": "\\n"
                    },
                    {
                        "annotation": null,
                        "segment": "  "
                    },
                    {
                        "annotation": null,
                        "segment": "  "
                    },
                    {
                        "annotation": null,
                        "segment": "as"
                    },
                    {
                        "annotation": null,
                        "segment": " "
                    },
                    {
                        "annotation": null,
                        "segment": "by"
                    },
                    {
                        "annotation": null,
                        "segment": " "
                    },
                    {
                        "annotation": null,
                        "segment": "Unison"
                    },
                    {
                        "annotation": null,
                        "segment": " "
                    },
                    {
                        "annotation": null,
                        "segment": "itself."
                    },
                    {
                        "annotation": null,
                        "segment": "\\n"
                    },
                    {
                        "annotation": null,
                        "segment": "  "
                    },
                    {
                        "annotation": null,
                        "segment": "  "
                    },
                    {
                        "annotation": null,
                        "segment": "\\n"
                    },
                    {
                        "annotation": null,
                        "segment": "  "
                    },
                    {
                        "annotation": null,
                        "segment": "  "
                    },
                    {
                        "annotation": null,
                        "segment": "Release:"
                    },
                    {
                        "annotation": null,
                        "segment": " "
                    },
                    {
                        "annotation": null,
                        "segment": "**"
                    },
                    {
                        "annotation": {
                            "tag": "DocDelimiter"
                        },
                        "segment": "{{"
                    },
                    {
                        "annotation": null,
                        "segment": " "
                    },
                    {
                        "annotation": {
                            "contents": "#23gnk1tdun7j6k7uuhfo5802d287u7tt3movl38v5t6a87qgadts5f9gch3mqrh4dev9u11ml2mdif5go9adsfoheec0606hd613ar0",
                            "tag": "TermReference"
                        },
                        "segment": "releaseName"
                    },
                    {
                        "annotation": null,
                        "segment": " "
                    },
                    {
                        "annotation": {
                            "tag": "DocDelimiter"
                        },
                        "segment": "}}"
                    },
                    {
                        "annotation": null,
                        "segment": "**"
                    },
                    {
                        "annotation": null,
                        "segment": "\\n"
                    },
                    {
                        "annotation": null,
                        "segment": "  "
                    },
                    {
                        "annotation": null,
                        "segment": "  "
                    },
                    {
                        "annotation": null,
                        "segment": "\\n"
                    },
                    {
                        "annotation": null,
                        "segment": "  "
                    },
                    {
                        "annotation": null,
                        "segment": "  "
                    },
                    {
                        "annotation": null,
                        "segment": "##"
                    },
                    {
                        "annotation": null,
                        "segment": " "
                    },
                    {
                        "annotation": null,
                        "segment": "What's"
                    },
                    {
                        "annotation": null,
                        "segment": " "
                    },
                    {
                        "annotation": null,
                        "segment": "here?"
                    },
                    {
                        "annotation": null,
                        "segment": "\\n"
                    },
                    {
                        "annotation": null,
                        "segment": "  "
                    },
                    {
                        "annotation": null,
                        "segment": "  "
                    },
                    {
                        "annotation": null,
                        "segment": "\\n"
                    },
                    {
                        "annotation": null,
                        "segment": "  "
                    },
                    {
                        "annotation": null,
                        "segment": "  "
                    },
                    {
                        "annotation": null,
                        "segment": "   "
                    },
                    {
                        "annotation": null,
                        "segment": "This"
                    },
                    {
                        "annotation": null,
                        "segment": " "
                    },
                    {
                        "annotation": null,
                        "segment": "document"
                    },
                    {
                        "annotation": null,
                        "segment": " "
                    },
                    {
                        "annotation": null,
                        "segment": "is"
                    },
                    {
                        "annotation": null,
                        "segment": " "
                    },
                    {
                        "annotation": null,
                        "segment": "organized"
                    },
                    {
                        "annotation": null,
                        "segment": " "
                    },
                    {
                        "annotation": null,
                        "segment": "into"
                    },
                    {
                        "annotation": null,
                        "segment": " "
                    },
                    {
                        "annotation": null,
                        "segment": "a"
                    },
                    {
                        "annotation": null,
                        "segment": " "
                    },
                    {
                        "annotation": null,
                        "segment": "number"
                    },
                    {
                        "annotation": null,
                        "segment": " "
                    },
                    {
                        "annotation": null,
                        "segment": "of"
                    },
                    {
                        "annotation": null,
                        "segment": " "
                    },
                    {
                        "annotation": null,
                        "segment": "sections,"
                    },
                    {
                        "annotation": null,
                        "segment": " "
                    },
                    {
                        "annotation": null,
                        "segment": "each"
                    },
                    {
                        "annotation": null,
                        "segment": " "
                    },
                    {
                        "annotation": null,
                        "segment": "giving"
                    },
                    {
                        "annotation": null,
                        "segment": " "
                    },
                    {
                        "annotation": null,
                        "segment": "a"
                    },
                    {
                        "annotation": null,
                        "segment": "\\n"
                    },
                    {
                        "annotation": null,
                        "segment": "  "
                    },
                    {
                        "annotation": null,
                        "segment": "  "
                    },
                    {
                        "annotation": null,
                        "segment": "   "
                    },
                    {
                        "annotation": null,
                        "segment": "high-level"
                    },
                    {
                        "annotation": null,
                        "segment": " "
                    },
                    {
                        "annotation": null,
                        "segment": "overview"
                    },
                    {
                        "annotation": null,
                        "segment": " "
                    },
                    {
                        "annotation": null,
                        "segment": "of"
                    },
                    {
                        "annotation": null,
                        "segment": " "
                    },
                    {
                        "annotation": null,
                        "segment": "some"
                    },
                    {
                        "annotation": null,
                        "segment": " "
                    },
                    {
                        "annotation": null,
                        "segment": "region"
                    },
                    {
                        "annotation": null,
                        "segment": " "
                    },
                    {
                        "annotation": null,
                        "segment": "of"
                    },
                    {
                        "annotation": null,
                        "segment": " "
                    },
                    {
                        "annotation": null,
                        "segment": "the"
                    },
                    {
                        "annotation": null,
                        "segment": " "
                    },
                    {
                        "annotation": null,
                        "segment": "Base"
                    },
                    {
                        "annotation": null,
                        "segment": " "
                    },
                    {
                        "annotation": null,
                        "segment": "library."
                    },
                    {
                        "annotation": null,
                        "segment": " "
                    },
                    {
                        "annotation": null,
                        "segment": "You"
                    },
                    {
                        "annotation": null,
                        "segment": " "
                    },
                    {
                        "annotation": null,
                        "segment": "can"
                    },
                    {
                        "annotation": null,
                        "segment": " "
                    },
                    {
                        "annotation": null,
                        "segment": "find"
                    },
                    {
                        "annotation": null,
                        "segment": "\\n"
                    },
                    {
                        "annotation": null,
                        "segment": "  "
                    },
                    {
                        "annotation": null,
                        "segment": "  "
                    },
                    {
                        "annotation": null,
                        "segment": "   "
                    },
                    {
                        "annotation": null,
                        "segment": "more"
                    },
                    {
                        "annotation": null,
                        "segment": " "
                    },
                    {
                        "annotation": null,
                        "segment": "detailed"
                    },
                    {
                        "annotation": null,
                        "segment": " "
                    },
                    {
                        "annotation": null,
                        "segment": "documentation"
                    },
                    {
                        "annotation": null,
                        "segment": " "
                    },
                    {
                        "annotation": null,
                        "segment": "by"
                    },
                    {
                        "annotation": null,
                        "segment": " "
                    },
                    {
                        "annotation": null,
                        "segment": "following"
                    },
                    {
                        "annotation": null,
                        "segment": " "
                    },
                    {
                        "annotation": null,
                        "segment": "the"
                    },
                    {
                        "annotation": null,
                        "segment": " "
                    },
                    {
                        "annotation": null,
                        "segment": "links."
                    },
                    {
                        "annotation": null,
                        "segment": " "
                    },
                    {
                        "annotation": null,
                        "segment": "In"
                    },
                    {
                        "annotation": null,
                        "segment": " "
                    },
                    {
                        "annotation": null,
                        "segment": "general,"
                    },
                    {
                        "annotation": null,
                        "segment": " "
                    },
                    {
                        "annotation": null,
                        "segment": "the"
                    },
                    {
                        "annotation": null,
                        "segment": " "
                    },
                    {
                        "annotation": null,
                        "segment": "docs"
                    },
                    {
                        "annotation": null,
                        "segment": "\\n"
                    },
                    {
                        "annotation": null,
                        "segment": "  "
                    },
                    {
                        "annotation": null,
                        "segment": "  "
                    },
                    {
                        "annotation": null,
                        "segment": "   "
                    },
                    {
                        "annotation": null,
                        "segment": "for"
                    },
                    {
                        "annotation": null,
                        "segment": " "
                    },
                    {
                        "annotation": null,
                        "segment": "a"
                    },
                    {
                        "annotation": null,
                        "segment": " "
                    },
                    {
                        "annotation": null,
                        "segment": "type"
                    },
                    {
                        "annotation": null,
                        "segment": " "
                    },
                    {
                        "annotation": null,
                        "segment": "provide"
                    },
                    {
                        "annotation": null,
                        "segment": " "
                    },
                    {
                        "annotation": null,
                        "segment": "an"
                    },
                    {
                        "annotation": null,
                        "segment": " "
                    },
                    {
                        "annotation": null,
                        "segment": "overview"
                    },
                    {
                        "annotation": null,
                        "segment": " "
                    },
                    {
                        "annotation": null,
                        "segment": "of"
                    },
                    {
                        "annotation": null,
                        "segment": " "
                    },
                    {
                        "annotation": null,
                        "segment": "operations"
                    },
                    {
                        "annotation": null,
                        "segment": " "
                    },
                    {
                        "annotation": null,
                        "segment": "on"
                    },
                    {
                        "annotation": null,
                        "segment": " "
                    },
                    {
                        "annotation": null,
                        "segment": "that"
                    },
                    {
                        "annotation": null,
                        "segment": " "
                    },
                    {
                        "annotation": null,
                        "segment": "type,"
                    },
                    {
                        "annotation": null,
                        "segment": " "
                    },
                    {
                        "annotation": null,
                        "segment": "and"
                    },
                    {
                        "annotation": null,
                        "segment": " "
                    },
                    {
                        "annotation": null,
                        "segment": "the"
                    },
                    {
                        "annotation": null,
                        "segment": " "
                    },
                    {
                        "annotation": null,
                        "segment": "docs"
                    },
                    {
                        "annotation": null,
                        "segment": "\\n"
                    },
                    {
                        "annotation": null,
                        "segment": "  "
                    },
                    {
                        "annotation": null,
                        "segment": "  "
                    },
                    {
                        "annotation": null,
                        "segment": "   "
                    },
                    {
                        "annotation": null,
                        "segment": "for"
                    },
                    {
                        "annotation": null,
                        "segment": " "
                    },
                    {
                        "annotation": null,
                        "segment": "a"
                    },
                    {
                        "annotation": null,
                        "segment": " "
                    },
                    {
                        "annotation": null,
                        "segment": "specific"
                    },
                    {
                        "annotation": null,
                        "segment": " "
                    },
                    {
                        "annotation": null,
                        "segment": "function"
                    },
                    {
                        "annotation": null,
                        "segment": " "
                    },
                    {
                        "annotation": null,
                        "segment": "give"
                    },
                    {
                        "annotation": null,
                        "segment": " "
                    },
                    {
                        "annotation": null,
                        "segment": "more"
                    },
                    {
                        "annotation": null,
                        "segment": " "
                    },
                    {
                        "annotation": null,
                        "segment": "detail"
                    },
                    {
                        "annotation": null,
                        "segment": " "
                    },
                    {
                        "annotation": null,
                        "segment": "and"
                    },
                    {
                        "annotation": null,
                        "segment": " "
                    },
                    {
                        "annotation": null,
                        "segment": "more"
                    },
                    {
                        "annotation": null,
                        "segment": " "
                    },
                    {
                        "annotation": null,
                        "segment": "examples."
                    },
                    {
                        "annotation": null,
                        "segment": "\\n"
                    },
                    {
                        "annotation": null,
                        "segment": "  "
                    },
                    {
                        "annotation": null,
                        "segment": "  "
                    },
                    {
                        "annotation": null,
                        "segment": "\\n"
                    },
                    {
                        "annotation": null,
                        "segment": "  "
                    },
                    {
                        "annotation": null,
                        "segment": "  "
                    },
                    {
                        "annotation": null,
                        "segment": "##"
                    },
                    {
                        "annotation": null,
                        "segment": " "
                    },
                    {
                        "annotation": null,
                        "segment": "Contents"
                    },
                    {
                        "annotation": null,
                        "segment": "\\n"
                    },
                    {
                        "annotation": null,
                        "segment": "  "
                    },
                    {
                        "annotation": null,
                        "segment": "  "
                    },
                    {
                        "annotation": null,
                        "segment": "\\n"
                    },
                    {
                        "annotation": null,
                        "segment": "  "
                    },
                    {
                        "annotation": null,
                        "segment": "  "
                    },
                    {
                        "annotation": null,
                        "segment": "   "
                    },
                    {
                        "annotation": null,
                        "segment": "* "
                    },
                    {
                        "annotation": null,
                        "segment": "["
                    },
                    {
                        "annotation": null,
                        "segment": "Primitive"
                    },
                    {
                        "annotation": null,
                        "segment": " "
                    },
                    {
                        "annotation": null,
                        "segment": "types"
                    },
                    {
                        "annotation": null,
                        "segment": "]("
                    },
                    {
                        "annotation": null,
                        "segment": "{"
                    },
                    {
                        "annotation": {
                            "contents": "#8lid9k4lt6kk92qm9ku0kih11q5dm0u1plhjipal4l2hbcatfd04lfgkn5723nic9rjr49uhl06i9kom2aq72egjb9o82t4tc70gtkg",
                            "tag": "TermReference"
                        },
                        "segment": "primitiveTypes"
                    },
                    {
                        "annotation": null,
                        "segment": "}"
                    },
                    {
                        "annotation": null,
                        "segment": ")"
                    },
                    {
                        "annotation": null,
                        "segment": " "
                    },
                    {
                        "annotation": null,
                        "segment": "—"
                    },
                    {
                        "annotation": null,
                        "segment": " "
                    },
                    {
                        "annotation": null,
                        "segment": "{type "
                    },
                    {
                        "annotation": {
                            "contents": "##Nat",
                            "tag": "TypeReference"
                        },
                        "segment": "Nat"
                    },
                    {
                        "annotation": null,
                        "segment": "}"
                    },
                    {
                        "annotation": null,
                        "segment": ","
                    },
                    {
                        "annotation": null,
                        "segment": " "
                    },
                    {
                        "annotation": null,
                        "segment": "{type "
                    },
                    {
                        "annotation": {
                            "contents": "##Int",
                            "tag": "TypeReference"
                        },
                        "segment": "Int"
                    },
                    {
                        "annotation": null,
                        "segment": "}"
                    },
                    {
                        "annotation": null,
                        "segment": ","
                    },
                    {
                        "annotation": null,
                        "segment": "\\n"
                    },
                    {
                        "annotation": null,
                        "segment": "  "
                    },
                    {
                        "annotation": null,
                        "segment": "  "
                    },
                    {
                        "annotation": null,
                        "segment": "   "
                    },
                    {
                        "annotation": null,
                        "segment": "  "
                    },
                    {
                        "annotation": null,
                        "segment": "{type "
                    },
                    {
                        "annotation": {
                            "contents": "##Float",
                            "tag": "TypeReference"
                        },
                        "segment": "Float"
                    },
                    {
                        "annotation": null,
                        "segment": "}"
                    },
                    {
                        "annotation": null,
                        "segment": ","
                    },
                    {
                        "annotation": null,
                        "segment": " "
                    },
                    {
                        "annotation": null,
                        "segment": "{type "
                    },
                    {
                        "annotation": {
                            "contents": "##Boolean",
                            "tag": "TypeReference"
                        },
                        "segment": "Boolean"
                    },
                    {
                        "annotation": null,
                        "segment": "}"
                    },
                    {
                        "annotation": null,
                        "segment": ","
                    },
                    {
                        "annotation": null,
                        "segment": " "
                    },
                    {
                        "annotation": null,
                        "segment": "{type "
                    },
                    {
                        "annotation": {
                            "contents": "##Bytes",
                            "tag": "TypeReference"
                        },
                        "segment": "Bytes"
                    },
                    {
                        "annotation": null,
                        "segment": "}"
                    },
                    {
                        "annotation": null,
                        "segment": ","
                    },
                    {
                        "annotation": null,
                        "segment": " "
                    },
                    {
                        "annotation": null,
                        "segment": "{type "
                    },
                    {
                        "annotation": {
                            "contents": "##Text",
                            "tag": "TypeReference"
                        },
                        "segment": "Text"
                    },
                    {
                        "annotation": null,
                        "segment": "}"
                    },
                    {
                        "annotation": null,
                        "segment": ","
                    },
                    {
                        "annotation": null,
                        "segment": " "
                    },
                    {
                        "annotation": null,
                        "segment": "and"
                    },
                    {
                        "annotation": null,
                        "segment": "\\n"
                    },
                    {
                        "annotation": null,
                        "segment": "  "
                    },
                    {
                        "annotation": null,
                        "segment": "  "
                    },
                    {
                        "annotation": null,
                        "segment": "   "
                    },
                    {
                        "annotation": null,
                        "segment": "  "
                    },
                    {
                        "annotation": null,
                        "segment": "{type "
                    },
                    {
                        "annotation": {
                            "contents": "##Char",
                            "tag": "TypeReference"
                        },
                        "segment": "Char"
                    },
                    {
                        "annotation": null,
                        "segment": "}"
                    },
                    {
                        "annotation": null,
                        "segment": ","
                    },
                    {
                        "annotation": null,
                        "segment": " "
                    },
                    {
                        "annotation": null,
                        "segment": "as"
                    },
                    {
                        "annotation": null,
                        "segment": " "
                    },
                    {
                        "annotation": null,
                        "segment": "well"
                    },
                    {
                        "annotation": null,
                        "segment": " "
                    },
                    {
                        "annotation": null,
                        "segment": "as"
                    },
                    {
                        "annotation": null,
                        "segment": " "
                    },
                    {
                        "annotation": null,
                        "segment": "operations"
                    },
                    {
                        "annotation": null,
                        "segment": " "
                    },
                    {
                        "annotation": null,
                        "segment": "on"
                    },
                    {
                        "annotation": null,
                        "segment": " "
                    },
                    {
                        "annotation": null,
                        "segment": "these"
                    },
                    {
                        "annotation": null,
                        "segment": " "
                    },
                    {
                        "annotation": null,
                        "segment": "types."
                    },
                    {
                        "annotation": null,
                        "segment": "\\n"
                    },
                    {
                        "annotation": null,
                        "segment": "  "
                    },
                    {
                        "annotation": null,
                        "segment": "  "
                    },
                    {
                        "annotation": null,
                        "segment": "   "
                    },
                    {
                        "annotation": null,
                        "segment": "* "
                    },
                    {
                        "annotation": null,
                        "segment": "["
                    },
                    {
                        "annotation": null,
                        "segment": "Collections"
                    },
                    {
                        "annotation": null,
                        "segment": "]("
                    },
                    {
                        "annotation": null,
                        "segment": "{"
                    },
                    {
                        "annotation": {
                            "contents": "#sucij5tionuseaeisjfjupa6cjedg8i24m8kikb7buejiarov8rjeess4u0plshgnqadoh6n4o0v8nm9v318l9su7k10aucfs5r8h98",
                            "tag": "TermReference"
                        },
                        "segment": "collectionTypes"
                    },
                    {
                        "annotation": null,
                        "segment": "}"
                    },
                    {
                        "annotation": null,
                        "segment": ")"
                    },
                    {
                        "annotation": null,
                        "segment": " "
                    },
                    {
                        "annotation": null,
                        "segment": "like"
                    },
                    {
                        "annotation": null,
                        "segment": " "
                    },
                    {
                        "annotation": null,
                        "segment": "{type "
                    },
                    {
                        "annotation": {
                            "contents": "##Sequence",
                            "tag": "TypeReference"
                        },
                        "segment": "List"
                    },
                    {
                        "annotation": null,
                        "segment": "}"
                    },
                    {
                        "annotation": null,
                        "segment": ","
                    },
                    {
                        "annotation": null,
                        "segment": " "
                    },
                    {
                        "annotation": null,
                        "segment": "{type "
                    },
                    {
                        "annotation": {
                            "contents": "#prrhin67cemaummdiu0c35cj17g8m7t96qne5i8vfj9m6ur338250jukj6q33ob0llgl9vvgc50rfgiiu7u0nvg5fvajkpqa0amjct0",
                            "tag": "TypeReference"
                        },
                        "segment": "Set"
                    },
                    {
                        "annotation": null,
                        "segment": "}"
                    },
                    {
                        "annotation": null,
                        "segment": ","
                    },
                    {
                        "annotation": null,
                        "segment": "\\n"
                    },
                    {
                        "annotation": null,
                        "segment": "  "
                    },
                    {
                        "annotation": null,
                        "segment": "  "
                    },
                    {
                        "annotation": null,
                        "segment": "   "
                    },
                    {
                        "annotation": null,
                        "segment": "  "
                    },
                    {
                        "annotation": null,
                        "segment": "{type "
                    },
                    {
                        "annotation": {
                            "contents": "#nk9jfsoidsc5h3nhcf1p6528t6c5hqui3hridbvaqnruel4jns3qo6plgups2sgi82c9jgt9ba1qlkum1bdjdgp75h7si2thbo7tcfg",
                            "tag": "TypeReference"
                        },
                        "segment": "Map"
                    },
                    {
                        "annotation": null,
                        "segment": "}"
                    },
                    {
                        "annotation": null,
                        "segment": ","
                    },
                    {
                        "annotation": null,
                        "segment": " "
                    },
                    {
                        "annotation": null,
                        "segment": "{type "
                    },
                    {
                        "annotation": {
                            "contents": "#8v9565gf9gu039kgnj3jlnarqmb75r2acoqsqspgnkcor7ac04f1smo75k3sqcb27nap3hn0mmmd3rg9i6lnegivpsdrikifbta0n28",
                            "tag": "TypeReference"
                        },
                        "segment": "data.Array"
                    },
                    {
                        "annotation": null,
                        "segment": "}"
                    },
                    {
                        "annotation": null,
                        "segment": " "
                    },
                    {
                        "annotation": null,
                        "segment": "and"
                    },
                    {
                        "annotation": null,
                        "segment": " "
                    },
                    {
                        "annotation": null,
                        "segment": "others."
                    },
                    {
                        "annotation": null,
                        "segment": "\\n"
                    },
                    {
                        "annotation": null,
                        "segment": "  "
                    },
                    {
                        "annotation": null,
                        "segment": "  "
                    },
                    {
                        "annotation": null,
                        "segment": "   "
                    },
                    {
                        "annotation": null,
                        "segment": "* "
                    },
                    {
                        "annotation": null,
                        "segment": "["
                    },
                    {
                        "annotation": null,
                        "segment": "Tuples"
                    },
                    {
                        "annotation": null,
                        "segment": "]("
                    },
                    {
                        "annotation": null,
                        "segment": "{"
                    },
                    {
                        "annotation": {
                            "contents": "#ujp4b8jginm3nfh9lrp05kh1j4n3pgrofrn30b0o1r70pod8pmrrtjk0ntoaeugk0q676ph9q2mp0bcnh5f6vj8khbbt0mso4m2sl3g",
                            "tag": "TermReference"
                        },
                        "segment": "Tuple.doc"
                    },
                    {
                        "annotation": null,
                        "segment": "}"
                    },
                    {
                        "annotation": null,
                        "segment": ")"
                    },
                    {
                        "annotation": null,
                        "segment": " "
                    },
                    {
                        "annotation": null,
                        "segment": "–"
                    },
                    {
                        "annotation": null,
                        "segment": " "
                    },
                    {
                        "annotation": null,
                        "segment": "the"
                    },
                    {
                        "annotation": null,
                        "segment": " "
                    },
                    {
                        "annotation": null,
                        "segment": "{type "
                    },
                    {
                        "annotation": {
                            "contents": "#2lg4ah6ir6t129m33d7gssnigacral39qdamo20mn6r2vefliubpeqnjhejai9ekjckv0qnu9mlu3k9nbpfhl2schec4dohn7rjhjt8",
                            "tag": "TypeReference"
                        },
                        "segment": "Tuple"
                    },
                    {
                        "annotation": null,
                        "segment": "}"
                    },
                    {
                        "annotation": null,
                        "segment": " "
                    },
                    {
                        "annotation": null,
                        "segment": "type"
                    },
                    {
                        "annotation": null,
                        "segment": " "
                    },
                    {
                        "annotation": null,
                        "segment": "and"
                    },
                    {
                        "annotation": null,
                        "segment": " "
                    },
                    {
                        "annotation": null,
                        "segment": "associated"
                    },
                    {
                        "annotation": null,
                        "segment": "\\n"
                    },
                    {
                        "annotation": null,
                        "segment": "  "
                    },
                    {
                        "annotation": null,
                        "segment": "  "
                    },
                    {
                        "annotation": null,
                        "segment": "   "
                    },
                    {
                        "annotation": null,
                        "segment": "  "
                    },
                    {
                        "annotation": null,
                        "segment": "functions."
                    },
                    {
                        "annotation": null,
                        "segment": "\\n"
                    },
                    {
                        "annotation": null,
                        "segment": "  "
                    },
                    {
                        "annotation": null,
                        "segment": "  "
                    },
                    {
                        "annotation": null,
                        "segment": "   "
                    },
                    {
                        "annotation": null,
                        "segment": "* "
                    },
                    {
                        "annotation": null,
                        "segment": "["
                    },
                    {
                        "annotation": null,
                        "segment": "Basic"
                    },
                    {
                        "annotation": null,
                        "segment": " "
                    },
                    {
                        "annotation": null,
                        "segment": "data"
                    },
                    {
                        "annotation": null,
                        "segment": " "
                    },
                    {
                        "annotation": null,
                        "segment": "types"
                    },
                    {
                        "annotation": null,
                        "segment": "]("
                    },
                    {
                        "annotation": null,
                        "segment": "{"
                    },
                    {
                        "annotation": {
                            "contents": "#vti02g169ibiaamanaolcl2in1jfiruu7hg7ak6di9cpd4ckjm11cjbua539h6tht16kcedfdo9085bs9d2jkiudv5gi7vmp0pd0u5g",
                            "tag": "TermReference"
                        },
                        "segment": "basicDataTypes"
                    },
                    {
                        "annotation": null,
                        "segment": "}"
                    },
                    {
                        "annotation": null,
                        "segment": ")"
                    },
                    {
                        "annotation": null,
                        "segment": " "
                    },
                    {
                        "annotation": null,
                        "segment": "–"
                    },
                    {
                        "annotation": null,
                        "segment": " "
                    },
                    {
                        "annotation": null,
                        "segment": "{type "
                    },
                    {
                        "annotation": {
                            "contents": "#00nv2kob8fp11qdkr750rlppf81cda95m3q0niohj1pvljnjl4r3hqrhvp1un2p40ptgkhhsne7hocod90r3qdlus9guivh7j3qcq0g",
                            "tag": "TypeReference"
                        },
                        "segment": "Unit"
                    },
                    {
                        "annotation": null,
                        "segment": "}"
                    },
                    {
                        "annotation": null,
                        "segment": ","
                    },
                    {
                        "annotation": null,
                        "segment": " "
                    },
                    {
                        "annotation": null,
                        "segment": "{type "
                    },
                    {
                        "annotation": {
                            "contents": "#6nbg92mjat8jl2ad8fl0mimqvdfbou9mc6o7q8a17sc09867upl35omb1ddqrsfplk338v6porgnlm2h35u2qv0pgqhtt0a67bf16u8",
                            "tag": "TypeReference"
                        },
                        "segment": "Void"
                    },
                    {
                        "annotation": null,
                        "segment": "}"
                    },
                    {
                        "annotation": null,
                        "segment": ","
                    },
                    {
                        "annotation": null,
                        "segment": "\\n"
                    },
                    {
                        "annotation": null,
                        "segment": "  "
                    },
                    {
                        "annotation": null,
                        "segment": "  "
                    },
                    {
                        "annotation": null,
                        "segment": "   "
                    },
                    {
                        "annotation": null,
                        "segment": "  "
                    },
                    {
                        "annotation": null,
                        "segment": "{type "
                    },
                    {
                        "annotation": {
                            "contents": "#nirp5os0q69o4e1u9p3t6mmq6l6otluefi3ksm7dhm0diidjvkkgl8o9bvnflbj0sanuvdusf34f1qrins3ktcaglpcqv9oums2slsg",
                            "tag": "TypeReference"
                        },
                        "segment": "Optional"
                    },
                    {
                        "annotation": null,
                        "segment": "}"
                    },
                    {
                        "annotation": null,
                        "segment": ","
                    },
                    {
                        "annotation": null,
                        "segment": " "
                    },
                    {
                        "annotation": null,
                        "segment": "and"
                    },
                    {
                        "annotation": null,
                        "segment": " "
                    },
                    {
                        "annotation": null,
                        "segment": "{type "
                    },
                    {
                        "annotation": {
                            "contents": "#0o7mf021foma9acqdaibmlh1jidlijq08uf7f5se9tssttqs546pfunjpk6s31mqoq8s2o1natede8hkk6he45l95fibglidikt44v8",
                            "tag": "TypeReference"
                        },
                        "segment": "Either"
                    },
                    {
                        "annotation": null,
                        "segment": "}"
                    },
                    {
                        "annotation": null,
                        "segment": "."
                    },
                    {
                        "annotation": null,
                        "segment": "\\n"
                    },
                    {
                        "annotation": null,
                        "segment": "  "
                    },
                    {
                        "annotation": null,
                        "segment": "  "
                    },
                    {
                        "annotation": null,
                        "segment": "   "
                    },
                    {
                        "annotation": null,
                        "segment": "* "
                    },
                    {
                        "annotation": null,
                        "segment": "["
                    },
                    {
                        "annotation": null,
                        "segment": "Basic"
                    },
                    {
                        "annotation": null,
                        "segment": " "
                    },
                    {
                        "annotation": null,
                        "segment": "abilities"
                    },
                    {
                        "annotation": null,
                        "segment": "]("
                    },
                    {
                        "annotation": null,
                        "segment": "{"
                    },
                    {
                        "annotation": {
                            "contents": "#5vlhb8hsnfo5m9928qb715nv8tn90vh14ipf6vhkqjj82qnhsbn494q9q70n8osgd3dhgl0sgil3fe7848m5i2heajbbhh78khk0ub0",
                            "tag": "TermReference"
                        },
                        "segment": "basicAbilities"
                    },
                    {
                        "annotation": null,
                        "segment": "}"
                    },
                    {
                        "annotation": null,
                        "segment": ")"
                    },
                    {
                        "annotation": null,
                        "segment": " "
                    },
                    {
                        "annotation": null,
                        "segment": "such"
                    },
                    {
                        "annotation": null,
                        "segment": " "
                    },
                    {
                        "annotation": null,
                        "segment": "as"
                    },
                    {
                        "annotation": null,
                        "segment": " "
                    },
                    {
                        "annotation": null,
                        "segment": "{type "
                    },
                    {
                        "annotation": {
                            "contents": "#b589mbg492brf3k3t0lg706d7ob88jqslgmja9gkrimv4137utuittc2r9l1tgvhrl40f71c99m39ch48gubbjhn5vf2pf5evjsinn8",
                            "tag": "TypeReference"
                        },
                        "segment": "Abort"
                    },
                    {
                        "annotation": null,
                        "segment": "}"
                    },
                    {
                        "annotation": null,
                        "segment": ","
                    },
                    {
                        "annotation": null,
                        "segment": " "
                    },
                    {
                        "annotation": null,
                        "segment": "{type "
                    },
                    {
                        "annotation": {
                            "contents": "#h4uhcub76va4tckj1iccnsb07rh0fhgpigqapb4jh5n07s0tugec4nm2vikuv973mab7oh4ne07o6armcnnl7mbfjtb4imphgrjgimg",
                            "tag": "TypeReference"
                        },
                        "segment": "Ask"
                    },
                    {
                        "annotation": null,
                        "segment": "}"
                    },
                    {
                        "annotation": null,
                        "segment": ","
                    },
                    {
                        "annotation": null,
                        "segment": "\\n"
                    },
                    {
                        "annotation": null,
                        "segment": "  "
                    },
                    {
                        "annotation": null,
                        "segment": "  "
                    },
                    {
                        "annotation": null,
                        "segment": "   "
                    },
                    {
                        "annotation": null,
                        "segment": "  "
                    },
                    {
                        "annotation": null,
                        "segment": "{type "
                    },
                    {
                        "annotation": {
                            "contents": "#jepp512vb4m2no30cvcueqs199iends2bnatu86t196k83radiguds4gkkk4btv1fvurjob4dv8i7tj3a750cg4lum7329e9m7fe45o",
                            "tag": "TypeReference"
                        },
                        "segment": "Random"
                    },
                    {
                        "annotation": null,
                        "segment": "}"
                    },
                    {
                        "annotation": null,
                        "segment": ","
                    },
                    {
                        "annotation": null,
                        "segment": " "
                    },
                    {
                        "annotation": null,
                        "segment": "{type "
                    },
                    {
                        "annotation": {
                            "contents": "#fmj3l8nggpfuh0ueuhr2rcka4s91ihufqiq6rocn25vsnni3v8rtjjteq79d398shvrfvbmhhoc7amhoh9lmdlghhiirl81sodj3ti0",
                            "tag": "TypeReference"
                        },
                        "segment": "Store"
                    },
                    {
                        "annotation": null,
                        "segment": "}"
                    },
                    {
                        "annotation": null,
                        "segment": ","
                    },
                    {
                        "annotation": null,
                        "segment": " "
                    },
                    {
                        "annotation": null,
                        "segment": "{type "
                    },
                    {
                        "annotation": {
                            "contents": "#rfi1v9429f9qluv533l2iba77aadttilrpmnhljfapfnfa6sru2nr8ibpqvib9nc4s4nb9s1as45upsfqfqe6ivqi2p82b2vd866it8",
                            "tag": "TypeReference"
                        },
                        "segment": "Stream"
                    },
                    {
                        "annotation": null,
                        "segment": "}"
                    },
                    {
                        "annotation": null,
                        "segment": ","
                    },
                    {
                        "annotation": null,
                        "segment": " "
                    },
                    {
                        "annotation": null,
                        "segment": "and"
                    },
                    {
                        "annotation": null,
                        "segment": " "
                    },
                    {
                        "annotation": null,
                        "segment": "{type "
                    },
                    {
                        "annotation": {
                            "contents": "#32q9jqhmi8f08pec3hj0je4u7k52f9f1hdfsmn9ncg2kpki5da9dabigplvdcot3a00k7s5npc4n78psd6ojaumqjla259e9pqd4ov8",
                            "tag": "TypeReference"
                        },
                        "segment": "Throw"
                    },
                    {
                        "annotation": null,
                        "segment": "}"
                    },
                    {
                        "annotation": null,
                        "segment": "."
                    },
                    {
                        "annotation": null,
                        "segment": "\\n"
                    },
                    {
                        "annotation": null,
                        "segment": "  "
                    },
                    {
                        "annotation": null,
                        "segment": "  "
                    },
                    {
                        "annotation": null,
                        "segment": "   "
                    },
                    {
                        "annotation": null,
                        "segment": "* "
                    },
                    {
                        "annotation": null,
                        "segment": "["
                    },
                    {
                        "annotation": null,
                        "segment": "Input"
                    },
                    {
                        "annotation": null,
                        "segment": " "
                    },
                    {
                        "annotation": null,
                        "segment": "and"
                    },
                    {
                        "annotation": null,
                        "segment": " "
                    },
                    {
                        "annotation": null,
                        "segment": "output"
                    },
                    {
                        "annotation": null,
                        "segment": "]("
                    },
                    {
                        "annotation": null,
                        "segment": "{"
                    },
                    {
                        "annotation": {
                            "contents": "#joqrus67evfsd9bd5tkbqosotbosrsqt56699977ljia8uee4kv7dojkih84t1jvu2742r10mln40o39s98t3n6o1brbfo0iakob5ag",
                            "tag": "TermReference"
                        },
                        "segment": "IO.doc"
                    },
                    {
                        "annotation": null,
                        "segment": "}"
                    },
                    {
                        "annotation": null,
                        "segment": ")"
                    },
                    {
                        "annotation": null,
                        "segment": " "
                    },
                    {
                        "annotation": null,
                        "segment": "–"
                    },
                    {
                        "annotation": null,
                        "segment": " "
                    },
                    {
                        "annotation": null,
                        "segment": "the"
                    },
                    {
                        "annotation": null,
                        "segment": " "
                    },
                    {
                        "annotation": null,
                        "segment": "{type "
                    },
                    {
                        "annotation": {
                            "contents": "##IO",
                            "tag": "TypeReference"
                        },
                        "segment": "IO"
                    },
                    {
                        "annotation": null,
                        "segment": "}"
                    },
                    {
                        "annotation": null,
                        "segment": " "
                    },
                    {
                        "annotation": null,
                        "segment": "ability"
                    },
                    {
                        "annotation": null,
                        "segment": " "
                    },
                    {
                        "annotation": null,
                        "segment": "and"
                    },
                    {
                        "annotation": null,
                        "segment": " "
                    },
                    {
                        "annotation": null,
                        "segment": "basic"
                    },
                    {
                        "annotation": null,
                        "segment": " "
                    },
                    {
                        "annotation": null,
                        "segment": "I/O"
                    },
                    {
                        "annotation": null,
                        "segment": "\\n"
                    },
                    {
                        "annotation": null,
                        "segment": "  "
                    },
                    {
                        "annotation": null,
                        "segment": "  "
                    },
                    {
                        "annotation": null,
                        "segment": "   "
                    },
                    {
                        "annotation": null,
                        "segment": "  "
                    },
                    {
                        "annotation": null,
                        "segment": "functions."
                    },
                    {
                        "annotation": null,
                        "segment": "\\n"
                    },
                    {
                        "annotation": null,
                        "segment": "  "
                    },
                    {
                        "annotation": null,
                        "segment": "  "
                    },
                    {
                        "annotation": null,
                        "segment": "   "
                    },
                    {
                        "annotation": null,
                        "segment": "* "
                    },
                    {
                        "annotation": null,
                        "segment": "["
                    },
                    {
                        "annotation": null,
                        "segment": "Basic"
                    },
                    {
                        "annotation": null,
                        "segment": " "
                    },
                    {
                        "annotation": null,
                        "segment": "networking"
                    },
                    {
                        "annotation": null,
                        "segment": "]("
                    },
                    {
                        "annotation": null,
                        "segment": "{"
                    },
                    {
                        "annotation": {
                            "contents": "#074albp4a5uvbgl07tli1q3o70d27b9oh50dqdfgv0sihok5gt0k2rvpsg8uehima623sj3tfqg2nm625u0p3faompjaobcg66iojj0",
                            "tag": "TermReference"
                        },
                        "segment": "networkAccess"
                    },
                    {
                        "annotation": null,
                        "segment": "}"
                    },
                    {
                        "annotation": null,
                        "segment": ")"
                    },
                    {
                        "annotation": null,
                        "segment": " "
                    },
                    {
                        "annotation": null,
                        "segment": "–"
                    },
                    {
                        "annotation": null,
                        "segment": " "
                    },
                    {
                        "annotation": null,
                        "segment": "networking"
                    },
                    {
                        "annotation": null,
                        "segment": " "
                    },
                    {
                        "annotation": null,
                        "segment": "primitives"
                    },
                    {
                        "annotation": null,
                        "segment": " "
                    },
                    {
                        "annotation": null,
                        "segment": "like"
                    },
                    {
                        "annotation": null,
                        "segment": "\\n"
                    },
                    {
                        "annotation": null,
                        "segment": "  "
                    },
                    {
                        "annotation": null,
                        "segment": "  "
                    },
                    {
                        "annotation": null,
                        "segment": "   "
                    },
                    {
                        "annotation": null,
                        "segment": "  "
                    },
                    {
                        "annotation": null,
                        "segment": "{type "
                    },
                    {
                        "annotation": {
                            "contents": "##Socket",
                            "tag": "TypeReference"
                        },
                        "segment": "Socket"
                    },
                    {
                        "annotation": null,
                        "segment": "}"
                    },
                    {
                        "annotation": null,
                        "segment": " "
                    },
                    {
                        "annotation": null,
                        "segment": "and"
                    },
                    {
                        "annotation": null,
                        "segment": " "
                    },
                    {
                        "annotation": null,
                        "segment": "{type "
                    },
                    {
                        "annotation": {
                            "contents": "##Tls",
                            "tag": "TypeReference"
                        },
                        "segment": "Tls"
                    },
                    {
                        "annotation": null,
                        "segment": "}"
                    },
                    {
                        "annotation": null,
                        "segment": "."
                    },
                    {
                        "annotation": null,
                        "segment": "\\n"
                    },
                    {
                        "annotation": null,
                        "segment": "  "
                    },
                    {
                        "annotation": null,
                        "segment": "  "
                    },
                    {
                        "annotation": null,
                        "segment": "   "
                    },
                    {
                        "annotation": null,
                        "segment": "* "
                    },
                    {
                        "annotation": null,
                        "segment": "["
                    },
                    {
                        "annotation": null,
                        "segment": "Concurrency"
                    },
                    {
                        "annotation": null,
                        "segment": "]("
                    },
                    {
                        "annotation": null,
                        "segment": "{"
                    },
                    {
                        "annotation": {
                            "contents": "#69k4g1fb4u4djoabi26o85n3eelpo849bouptgsfjfdagsk6d6rgud5rf5bc35q6d92c5ouqcgev9fc36hf161qpr9psr82q1kalji8",
                            "tag": "TermReference"
                        },
                        "segment": "concurrency"
                    },
                    {
                        "annotation": null,
                        "segment": "}"
                    },
                    {
                        "annotation": null,
                        "segment": ")"
                    },
                    {
                        "annotation": null,
                        "segment": " "
                    },
                    {
                        "annotation": null,
                        "segment": "–"
                    },
                    {
                        "annotation": null,
                        "segment": " "
                    },
                    {
                        "annotation": null,
                        "segment": "threads,"
                    },
                    {
                        "annotation": null,
                        "segment": " "
                    },
                    {
                        "annotation": null,
                        "segment": "mutable"
                    },
                    {
                        "annotation": null,
                        "segment": " "
                    },
                    {
                        "annotation": null,
                        "segment": "memory"
                    },
                    {
                        "annotation": null,
                        "segment": " "
                    },
                    {
                        "annotation": null,
                        "segment": "cells,"
                    },
                    {
                        "annotation": null,
                        "segment": " "
                    },
                    {
                        "annotation": null,
                        "segment": "and"
                    },
                    {
                        "annotation": null,
                        "segment": "\\n"
                    },
                    {
                        "annotation": null,
                        "segment": "  "
                    },
                    {
                        "annotation": null,
                        "segment": "  "
                    },
                    {
                        "annotation": null,
                        "segment": "   "
                    },
                    {
                        "annotation": null,
                        "segment": "  "
                    },
                    {
                        "annotation": null,
                        "segment": "software-transactional"
                    },
                    {
                        "annotation": null,
                        "segment": " "
                    },
                    {
                        "annotation": null,
                        "segment": "memory."
                    },
                    {
                        "annotation": null,
                        "segment": "\\n"
                    },
                    {
                        "annotation": null,
                        "segment": "  "
                    },
                    {
                        "annotation": null,
                        "segment": "  "
                    },
                    {
                        "annotation": null,
                        "segment": "   "
                    },
                    {
                        "annotation": null,
                        "segment": "* "
                    },
                    {
                        "annotation": null,
                        "segment": "["
                    },
                    {
                        "annotation": null,
                        "segment": "Higher-order"
                    },
                    {
                        "annotation": null,
                        "segment": " "
                    },
                    {
                        "annotation": null,
                        "segment": "functions"
                    },
                    {
                        "annotation": null,
                        "segment": "]("
                    },
                    {
                        "annotation": null,
                        "segment": "{"
                    },
                    {
                        "annotation": {
                            "contents": "#34ik76cm5ma0nr34h7ri427uicdaao7kou3jna00jeak384oe82759s8j82bs22f1u3af09fjckeojsgndh125aiprv1j2vc12lu9v0",
                            "tag": "TermReference"
                        },
                        "segment": "higherOrderFunctions"
                    },
                    {
                        "annotation": null,
                        "segment": "}"
                    },
                    {
                        "annotation": null,
                        "segment": ")"
                    },
                    {
                        "annotation": null,
                        "segment": " "
                    },
                    {
                        "annotation": null,
                        "segment": "–"
                    },
                    {
                        "annotation": null,
                        "segment": " "
                    },
                    {
                        "annotation": null,
                        "segment": "functions"
                    },
                    {
                        "annotation": null,
                        "segment": " "
                    },
                    {
                        "annotation": null,
                        "segment": "that"
                    },
                    {
                        "annotation": null,
                        "segment": "\\n"
                    },
                    {
                        "annotation": null,
                        "segment": "  "
                    },
                    {
                        "annotation": null,
                        "segment": "  "
                    },
                    {
                        "annotation": null,
                        "segment": "   "
                    },
                    {
                        "annotation": null,
                        "segment": "  "
                    },
                    {
                        "annotation": null,
                        "segment": "operate"
                    },
                    {
                        "annotation": null,
                        "segment": " "
                    },
                    {
                        "annotation": null,
                        "segment": "on"
                    },
                    {
                        "annotation": null,
                        "segment": " "
                    },
                    {
                        "annotation": null,
                        "segment": "functions."
                    },
                    {
                        "annotation": null,
                        "segment": "\\n"
                    },
                    {
                        "annotation": null,
                        "segment": "  "
                    },
                    {
                        "annotation": null,
                        "segment": "  "
                    },
                    {
                        "annotation": null,
                        "segment": "   "
                    },
                    {
                        "annotation": null,
                        "segment": "* "
                    },
                    {
                        "annotation": null,
                        "segment": "["
                    },
                    {
                        "annotation": null,
                        "segment": "Tests"
                    },
                    {
                        "annotation": null,
                        "segment": "]("
                    },
                    {
                        "annotation": null,
                        "segment": "{"
                    },
                    {
                        "annotation": {
                            "contents": "#bclg8cr5khn4376d6t68a352p5v4rahst2atn4er416begrnor1kpgm7dn0kd3e3cr1vcu0oldm7fplsjt53ef9ahtp89i9722vd5k8",
                            "tag": "TermReference"
                        },
                        "segment": "docs.tests"
                    },
                    {
                        "annotation": null,
                        "segment": "}"
                    },
                    {
                        "annotation": null,
                        "segment": ")"
                    },
                    {
                        "annotation": null,
                        "segment": " "
                    },
                    {
                        "annotation": null,
                        "segment": "–"
                    },
                    {
                        "annotation": null,
                        "segment": " "
                    },
                    {
                        "annotation": null,
                        "segment": "tests"
                    },
                    {
                        "annotation": null,
                        "segment": " "
                    },
                    {
                        "annotation": null,
                        "segment": "and"
                    },
                    {
                        "annotation": null,
                        "segment": " "
                    },
                    {
                        "annotation": null,
                        "segment": "test-case"
                    },
                    {
                        "annotation": null,
                        "segment": " "
                    },
                    {
                        "annotation": null,
                        "segment": "generation."
                    },
                    {
                        "annotation": null,
                        "segment": "\\n"
                    },
                    {
                        "annotation": null,
                        "segment": "  "
                    },
                    {
                        "annotation": null,
                        "segment": "  "
                    },
                    {
                        "annotation": null,
                        "segment": "   "
                    },
                    {
                        "annotation": null,
                        "segment": "* "
                    },
                    {
                        "annotation": null,
                        "segment": "["
                    },
                    {
                        "annotation": null,
                        "segment": "Unison"
                    },
                    {
                        "annotation": null,
                        "segment": " "
                    },
                    {
                        "annotation": null,
                        "segment": "language"
                    },
                    {
                        "annotation": null,
                        "segment": " "
                    },
                    {
                        "annotation": null,
                        "segment": "support"
                    },
                    {
                        "annotation": null,
                        "segment": "]("
                    },
                    {
                        "annotation": null,
                        "segment": "{"
                    },
                    {
                        "annotation": {
                            "contents": "#th2bml23oakiivqe3qdhvuu0q9nqjogio3a482j5m4n2ffs56fjtso4m784hk848e6opj3940gqjkp02mflo61dr1hfj6jumsojg4ag",
                            "tag": "TermReference"
                        },
                        "segment": "languageSupport"
                    },
                    {
                        "annotation": null,
                        "segment": "}"
                    },
                    {
                        "annotation": null,
                        "segment": ")"
                    },
                    {
                        "annotation": null,
                        "segment": " "
                    },
                    {
                        "annotation": null,
                        "segment": "–"
                    },
                    {
                        "annotation": null,
                        "segment": " "
                    },
                    {
                        "annotation": null,
                        "segment": "types"
                    },
                    {
                        "annotation": null,
                        "segment": " "
                    },
                    {
                        "annotation": null,
                        "segment": "and"
                    },
                    {
                        "annotation": null,
                        "segment": " "
                    },
                    {
                        "annotation": null,
                        "segment": "functions"
                    },
                    {
                        "annotation": null,
                        "segment": " "
                    },
                    {
                        "annotation": null,
                        "segment": "for"
                    },
                    {
                        "annotation": null,
                        "segment": "\\n"
                    },
                    {
                        "annotation": null,
                        "segment": "  "
                    },
                    {
                        "annotation": null,
                        "segment": "  "
                    },
                    {
                        "annotation": null,
                        "segment": "   "
                    },
                    {
                        "annotation": null,
                        "segment": "  "
                    },
                    {
                        "annotation": null,
                        "segment": "the"
                    },
                    {
                        "annotation": null,
                        "segment": " "
                    },
                    {
                        "annotation": null,
                        "segment": "Unison"
                    },
                    {
                        "annotation": null,
                        "segment": " "
                    },
                    {
                        "annotation": null,
                        "segment": "language"
                    },
                    {
                        "annotation": null,
                        "segment": " "
                    },
                    {
                        "annotation": null,
                        "segment": "itself."
                    },
                    {
                        "annotation": null,
                        "segment": "\\n"
                    },
                    {
                        "annotation": null,
                        "segment": "  "
                    },
                    {
                        "annotation": null,
                        "segment": "  "
                    },
                    {
                        "annotation": null,
                        "segment": "   "
                    },
                    {
                        "annotation": null,
                        "segment": "* "
                    },
                    {
                        "annotation": null,
                        "segment": "["
                    },
                    {
                        "annotation": null,
                        "segment": "First-class"
                    },
                    {
                        "annotation": null,
                        "segment": " "
                    },
                    {
                        "annotation": null,
                        "segment": "documentation"
                    },
                    {
                        "annotation": null,
                        "segment": "]("
                    },
                    {
                        "annotation": null,
                        "segment": "{"
                    },
                    {
                        "annotation": {
                            "contents": "#mp0apsvhkfs6ndp3icrqv5m3ajs5eqhdkf746oedsk0euqk4fkvojr6bdt32o60k5l5i58dpovectps2ddvq4juhp465g9m4cpobdbo",
                            "tag": "TermReference"
                        },
                        "segment": "Doc.doc"
                    },
                    {
                        "annotation": null,
                        "segment": "}"
                    },
                    {
                        "annotation": null,
                        "segment": ")"
                    },
                    {
                        "annotation": null,
                        "segment": " "
                    },
                    {
                        "annotation": null,
                        "segment": "–"
                    },
                    {
                        "annotation": null,
                        "segment": " "
                    },
                    {
                        "annotation": null,
                        "segment": "the"
                    },
                    {
                        "annotation": null,
                        "segment": " "
                    },
                    {
                        "annotation": null,
                        "segment": "{type "
                    },
                    {
                        "annotation": {
                            "contents": "#ej86si0ur1lsjade71dojr25phk9bbom9rdks6dltolos5tjivakujcriqe02npba53n9gd7tkh8bmv08ttjb9t35lq2ch5heshqcs0",
                            "tag": "TypeReference"
                        },
                        "segment": "Doc"
                    },
                    {
                        "annotation": null,
                        "segment": "}"
                    },
                    {
                        "annotation": null,
                        "segment": " "
                    },
                    {
                        "annotation": null,
                        "segment": "type"
                    },
                    {
                        "annotation": null,
                        "segment": " "
                    },
                    {
                        "annotation": null,
                        "segment": "for"
                    },
                    {
                        "annotation": null,
                        "segment": "\\n"
                    },
                    {
                        "annotation": null,
                        "segment": "  "
                    },
                    {
                        "annotation": null,
                        "segment": "  "
                    },
                    {
                        "annotation": null,
                        "segment": "   "
                    },
                    {
                        "annotation": null,
                        "segment": "  "
                    },
                    {
                        "annotation": null,
                        "segment": "writing"
                    },
                    {
                        "annotation": null,
                        "segment": " "
                    },
                    {
                        "annotation": null,
                        "segment": "Unison"
                    },
                    {
                        "annotation": null,
                        "segment": " "
                    },
                    {
                        "annotation": null,
                        "segment": "docs,"
                    },
                    {
                        "annotation": null,
                        "segment": " "
                    },
                    {
                        "annotation": null,
                        "segment": "like"
                    },
                    {
                        "annotation": null,
                        "segment": " "
                    },
                    {
                        "annotation": null,
                        "segment": "this"
                    },
                    {
                        "annotation": null,
                        "segment": " "
                    },
                    {
                        "annotation": null,
                        "segment": "very"
                    },
                    {
                        "annotation": null,
                        "segment": " "
                    },
                    {
                        "annotation": null,
                        "segment": "document!"
                    },
                    {
                        "annotation": null,
                        "segment": "\\n"
                    },
                    {
                        "annotation": null,
                        "segment": "  "
                    },
                    {
                        "annotation": null,
                        "segment": "  "
                    },
                    {
                        "annotation": null,
                        "segment": "   "
                    },
                    {
                        "annotation": null,
                        "segment": "* "
                    },
                    {
                        "annotation": null,
                        "segment": "["
                    },
                    {
                        "annotation": null,
                        "segment": "Very"
                    },
                    {
                        "annotation": null,
                        "segment": " "
                    },
                    {
                        "annotation": null,
                        "segment": "large"
                    },
                    {
                        "annotation": null,
                        "segment": " "
                    },
                    {
                        "annotation": null,
                        "segment": "numbers"
                    },
                    {
                        "annotation": null,
                        "segment": "]("
                    },
                    {
                        "annotation": null,
                        "segment": "{"
                    },
                    {
                        "annotation": {
                            "contents": "#qjriier1l7voqpos5hslnrtmm6jq1m4nnvhfimg9b0bmkg1f33va0ctbm7v2ibvjt7nqm7mk096pdm8nk53bc2g36bi7o59mjtovvro",
                            "tag": "TermReference"
                        },
                        "segment": "Natural.doc"
                    },
                    {
                        "annotation": null,
                        "segment": "}"
                    },
                    {
                        "annotation": null,
                        "segment": ")"
                    },
                    {
                        "annotation": null,
                        "segment": " "
                    },
                    {
                        "annotation": null,
                        "segment": "based"
                    },
                    {
                        "annotation": null,
                        "segment": " "
                    },
                    {
                        "annotation": null,
                        "segment": "on"
                    },
                    {
                        "annotation": null,
                        "segment": " "
                    },
                    {
                        "annotation": null,
                        "segment": "the"
                    },
                    {
                        "annotation": null,
                        "segment": " "
                    },
                    {
                        "annotation": null,
                        "segment": "{type "
                    },
                    {
                        "annotation": {
                            "contents": "#mch0tun94eovcb1hdeugfu6319pl8q5es1kq5831aumc19b784bkhbhj4v436s38pintnj864nuuo6t05t5s14mlgi5mevkk47qk2mo",
                            "tag": "TypeReference"
                        },
                        "segment": "Natural"
                    },
                    {
                        "annotation": null,
                        "segment": "}"
                    },
                    {
                        "annotation": null,
                        "segment": " "
                    },
                    {
                        "annotation": null,
                        "segment": "type."
                    },
                    {
                        "annotation": null,
                        "segment": "\\n"
                    },
                    {
                        "annotation": null,
                        "segment": "  "
                    },
                    {
                        "annotation": null,
                        "segment": "  "
                    },
                    {
                        "annotation": null,
                        "segment": "   "
                    },
                    {
                        "annotation": null,
                        "segment": "* "
                    },
                    {
                        "annotation": null,
                        "segment": "["
                    },
                    {
                        "annotation": null,
                        "segment": "Date"
                    },
                    {
                        "annotation": null,
                        "segment": " "
                    },
                    {
                        "annotation": null,
                        "segment": "and"
                    },
                    {
                        "annotation": null,
                        "segment": " "
                    },
                    {
                        "annotation": null,
                        "segment": "time"
                    },
                    {
                        "annotation": null,
                        "segment": "]("
                    },
                    {
                        "annotation": null,
                        "segment": "{"
                    },
                    {
                        "annotation": {
                            "contents": "#blcdk5knpnn6aiu70v1kb9jr643endk15c3741euhquvp1a8u1bs6plc05jd61771injbi0lru6ndg3ms828vckfr4pvfilv7tnbcc8",
                            "tag": "TermReference"
                        },
                        "segment": "time.README"
                    },
                    {
                        "annotation": null,
                        "segment": "}"
                    },
                    {
                        "annotation": null,
                        "segment": ")"
                    },
                    {
                        "annotation": null,
                        "segment": " "
                    },
                    {
                        "annotation": null,
                        "segment": "–"
                    },
                    {
                        "annotation": null,
                        "segment": " "
                    },
                    {
                        "annotation": null,
                        "segment": "real-time"
                    },
                    {
                        "annotation": null,
                        "segment": " "
                    },
                    {
                        "annotation": null,
                        "segment": "clocks,"
                    },
                    {
                        "annotation": null,
                        "segment": " "
                    },
                    {
                        "annotation": null,
                        "segment": "date"
                    },
                    {
                        "annotation": null,
                        "segment": " "
                    },
                    {
                        "annotation": null,
                        "segment": "and"
                    },
                    {
                        "annotation": null,
                        "segment": " "
                    },
                    {
                        "annotation": null,
                        "segment": "time"
                    },
                    {
                        "annotation": null,
                        "segment": "\\n"
                    },
                    {
                        "annotation": null,
                        "segment": "  "
                    },
                    {
                        "annotation": null,
                        "segment": "  "
                    },
                    {
                        "annotation": null,
                        "segment": "   "
                    },
                    {
                        "annotation": null,
                        "segment": "  "
                    },
                    {
                        "annotation": null,
                        "segment": "types,"
                    },
                    {
                        "annotation": null,
                        "segment": " "
                    },
                    {
                        "annotation": null,
                        "segment": "and"
                    },
                    {
                        "annotation": null,
                        "segment": " "
                    },
                    {
                        "annotation": null,
                        "segment": "supporting"
                    },
                    {
                        "annotation": null,
                        "segment": " "
                    },
                    {
                        "annotation": null,
                        "segment": "functions."
                    },
                    {
                        "annotation": null,
                        "segment": "\\n"
                    },
                    {
                        "annotation": null,
                        "segment": "  "
                    },
                    {
                        "annotation": {
                            "tag": "DocDelimiter"
                        },
                        "segment": "}}"
                    }
                ]
            },
            "signature": [
                {
                    "annotation": {
                        "contents": "#ej86si0ur1lsjade71dojr25phk9bbom9rdks6dltolos5tjivakujcriqe02npba53n9gd7tkh8bmv08ttjb9t35lq2ch5heshqcs0",
                        "tag": "TypeReference"
                    },
                    "segment": "Doc"
                }
            ],
            "termDocs": [
                [
                    "base.README",
                    "#1444pla0bqsncfv212494rfuhl9fuqh7uhf8api0k0q235npufpo1ee79bs4j42s7m2lo5o9oo6ppmmqlr37i8ekrsp2pbc8suonqbo",
                    {
                        "contents": [
                            {
                                "contents": [
                                    {
                                        "contents": "The",
                                        "tag": "Word"
                                    },
                                    {
                                        "contents": "Unison",
                                        "tag": "Word"
                                    },
                                    {
                                        "contents": "Base",
                                        "tag": "Word"
                                    },
                                    {
                                        "contents": "Library",
                                        "tag": "Word"
                                    }
                                ],
                                "tag": "Paragraph"
                            },
                            [
                                {
                                    "contents": [
                                        {
                                            "contents": "This",
                                            "tag": "Word"
                                        },
                                        {
                                            "contents": "library",
                                            "tag": "Word"
                                        },
                                        {
                                            "contents": "provides",
                                            "tag": "Word"
                                        },
                                        {
                                            "contents": "essential",
                                            "tag": "Word"
                                        },
                                        {
                                            "contents": "Unison",
                                            "tag": "Word"
                                        },
                                        {
                                            "contents": "functionality,",
                                            "tag": "Word"
                                        },
                                        {
                                            "contents": "data",
                                            "tag": "Word"
                                        },
                                        {
                                            "contents": "types,",
                                            "tag": "Word"
                                        },
                                        {
                                            "contents": "and",
                                            "tag": "Word"
                                        },
                                        {
                                            "contents": "shared",
                                            "tag": "Word"
                                        },
                                        {
                                            "contents": "abstractions",
                                            "tag": "Word"
                                        },
                                        {
                                            "contents": "used",
                                            "tag": "Word"
                                        },
                                        {
                                            "contents": "by",
                                            "tag": "Word"
                                        },
                                        {
                                            "contents": "most",
                                            "tag": "Word"
                                        },
                                        {
                                            "contents": "other",
                                            "tag": "Word"
                                        },
                                        {
                                            "contents": "libraries",
                                            "tag": "Word"
                                        },
                                        {
                                            "contents": "and",
                                            "tag": "Word"
                                        },
                                        {
                                            "contents": "applications,",
                                            "tag": "Word"
                                        },
                                        {
                                            "contents": "as",
                                            "tag": "Word"
                                        },
                                        {
                                            "contents": "well",
                                            "tag": "Word"
                                        },
                                        {
                                            "contents": "as",
                                            "tag": "Word"
                                        },
                                        {
                                            "contents": "by",
                                            "tag": "Word"
                                        },
                                        {
                                            "contents": "Unison",
                                            "tag": "Word"
                                        },
                                        {
                                            "contents": "itself.",
                                            "tag": "Word"
                                        }
                                    ],
                                    "tag": "Paragraph"
                                },
                                {
                                    "contents": [
                                        {
                                            "contents": "Release:",
                                            "tag": "Word"
                                        },
                                        {
                                            "contents": {
                                                "contents": [
                                                    {
                                                        "contents": [
                                                            {
                                                                "contents": "M4",
                                                                "tag": "Word"
                                                            }
                                                        ],
                                                        "tag": "Paragraph"
                                                    }
                                                ],
                                                "tag": "Paragraph"
                                            },
                                            "tag": "Bold"
                                        }
                                    ],
                                    "tag": "Paragraph"
                                },
                                {
                                    "contents": [
                                        {
                                            "contents": [
                                                {
                                                    "contents": "What's",
                                                    "tag": "Word"
                                                },
                                                {
                                                    "contents": "here?",
                                                    "tag": "Word"
                                                }
                                            ],
                                            "tag": "Paragraph"
                                        },
                                        [
                                            {
                                                "contents": [
                                                    {
                                                        "contents": "This",
                                                        "tag": "Word"
                                                    },
                                                    {
                                                        "contents": "document",
                                                        "tag": "Word"
                                                    },
                                                    {
                                                        "contents": "is",
                                                        "tag": "Word"
                                                    },
                                                    {
                                                        "contents": "organized",
                                                        "tag": "Word"
                                                    },
                                                    {
                                                        "contents": "into",
                                                        "tag": "Word"
                                                    },
                                                    {
                                                        "contents": "a",
                                                        "tag": "Word"
                                                    },
                                                    {
                                                        "contents": "number",
                                                        "tag": "Word"
                                                    },
                                                    {
                                                        "contents": "of",
                                                        "tag": "Word"
                                                    },
                                                    {
                                                        "contents": "sections,",
                                                        "tag": "Word"
                                                    },
                                                    {
                                                        "contents": "each",
                                                        "tag": "Word"
                                                    },
                                                    {
                                                        "contents": "giving",
                                                        "tag": "Word"
                                                    },
                                                    {
                                                        "contents": "a",
                                                        "tag": "Word"
                                                    },
                                                    {
                                                        "contents": "high-level",
                                                        "tag": "Word"
                                                    },
                                                    {
                                                        "contents": "overview",
                                                        "tag": "Word"
                                                    },
                                                    {
                                                        "contents": "of",
                                                        "tag": "Word"
                                                    },
                                                    {
                                                        "contents": "some",
                                                        "tag": "Word"
                                                    },
                                                    {
                                                        "contents": "region",
                                                        "tag": "Word"
                                                    },
                                                    {
                                                        "contents": "of",
                                                        "tag": "Word"
                                                    },
                                                    {
                                                        "contents": "the",
                                                        "tag": "Word"
                                                    },
                                                    {
                                                        "contents": "Base",
                                                        "tag": "Word"
                                                    },
                                                    {
                                                        "contents": "library.",
                                                        "tag": "Word"
                                                    },
                                                    {
                                                        "contents": "You",
                                                        "tag": "Word"
                                                    },
                                                    {
                                                        "contents": "can",
                                                        "tag": "Word"
                                                    },
                                                    {
                                                        "contents": "find",
                                                        "tag": "Word"
                                                    },
                                                    {
                                                        "contents": "more",
                                                        "tag": "Word"
                                                    },
                                                    {
                                                        "contents": "detailed",
                                                        "tag": "Word"
                                                    },
                                                    {
                                                        "contents": "documentation",
                                                        "tag": "Word"
                                                    },
                                                    {
                                                        "contents": "by",
                                                        "tag": "Word"
                                                    },
                                                    {
                                                        "contents": "following",
                                                        "tag": "Word"
                                                    },
                                                    {
                                                        "contents": "the",
                                                        "tag": "Word"
                                                    },
                                                    {
                                                        "contents": "links.",
                                                        "tag": "Word"
                                                    },
                                                    {
                                                        "contents": "In",
                                                        "tag": "Word"
                                                    },
                                                    {
                                                        "contents": "general,",
                                                        "tag": "Word"
                                                    },
                                                    {
                                                        "contents": "the",
                                                        "tag": "Word"
                                                    },
                                                    {
                                                        "contents": "docs",
                                                        "tag": "Word"
                                                    },
                                                    {
                                                        "contents": "for",
                                                        "tag": "Word"
                                                    },
                                                    {
                                                        "contents": "a",
                                                        "tag": "Word"
                                                    },
                                                    {
                                                        "contents": "type",
                                                        "tag": "Word"
                                                    },
                                                    {
                                                        "contents": "provide",
                                                        "tag": "Word"
                                                    },
                                                    {
                                                        "contents": "an",
                                                        "tag": "Word"
                                                    },
                                                    {
                                                        "contents": "overview",
                                                        "tag": "Word"
                                                    },
                                                    {
                                                        "contents": "of",
                                                        "tag": "Word"
                                                    },
                                                    {
                                                        "contents": "operations",
                                                        "tag": "Word"
                                                    },
                                                    {
                                                        "contents": "on",
                                                        "tag": "Word"
                                                    },
                                                    {
                                                        "contents": "that",
                                                        "tag": "Word"
                                                    },
                                                    {
                                                        "contents": "type,",
                                                        "tag": "Word"
                                                    },
                                                    {
                                                        "contents": "and",
                                                        "tag": "Word"
                                                    },
                                                    {
                                                        "contents": "the",
                                                        "tag": "Word"
                                                    },
                                                    {
                                                        "contents": "docs",
                                                        "tag": "Word"
                                                    },
                                                    {
                                                        "contents": "for",
                                                        "tag": "Word"
                                                    },
                                                    {
                                                        "contents": "a",
                                                        "tag": "Word"
                                                    },
                                                    {
                                                        "contents": "specific",
                                                        "tag": "Word"
                                                    },
                                                    {
                                                        "contents": "function",
                                                        "tag": "Word"
                                                    },
                                                    {
                                                        "contents": "give",
                                                        "tag": "Word"
                                                    },
                                                    {
                                                        "contents": "more",
                                                        "tag": "Word"
                                                    },
                                                    {
                                                        "contents": "detail",
                                                        "tag": "Word"
                                                    },
                                                    {
                                                        "contents": "and",
                                                        "tag": "Word"
                                                    },
                                                    {
                                                        "contents": "more",
                                                        "tag": "Word"
                                                    },
                                                    {
                                                        "contents": "examples.",
                                                        "tag": "Word"
                                                    }
                                                ],
                                                "tag": "Paragraph"
                                            }
                                        ]
                                    ],
                                    "tag": "Section"
                                },
                                {
                                    "contents": [
                                        {
                                            "contents": [
                                                {
                                                    "contents": "Contents",
                                                    "tag": "Word"
                                                }
                                            ],
                                            "tag": "Paragraph"
                                        },
                                        [
                                            {
                                                "contents": [
                                                    {
                                                        "contents": [
                                                            {
                                                                "contents": [
                                                                    {
                                                                        "contents": [
                                                                            {
                                                                                "contents": "Primitive",
                                                                                "tag": "Word"
                                                                            },
                                                                            {
                                                                                "contents": "types",
                                                                                "tag": "Word"
                                                                            }
                                                                        ],
                                                                        "tag": "Paragraph"
                                                                    },
                                                                    {
                                                                        "contents": {
                                                                            "contents": {
                                                                                "contents": [
                                                                                    {
                                                                                        "annotation": {
                                                                                            "contents": "#8lid9k4lt6kk92qm9ku0kih11q5dm0u1plhjipal4l2hbcatfd04lfgkn5723nic9rjr49uhl06i9kom2aq72egjb9o82t4tc70gtkg",
                                                                                            "tag": "TermReference"
                                                                                        },
                                                                                        "segment": "primitiveTypes"
                                                                                    }
                                                                                ],
                                                                                "tag": "Link"
                                                                            },
                                                                            "tag": "Special"
                                                                        },
                                                                        "tag": "Group"
                                                                    }
                                                                ],
                                                                "tag": "NamedLink"
                                                            },
                                                            {
                                                                "contents": "—",
                                                                "tag": "Word"
                                                            },
                                                            {
                                                                "contents": {
                                                                    "contents": [
                                                                        {
                                                                            "contents": {
                                                                                "contents": [
                                                                                    {
                                                                                        "annotation": {
                                                                                            "contents": "##Nat",
                                                                                            "tag": "TypeReference"
                                                                                        },
                                                                                        "segment": "Nat"
                                                                                    }
                                                                                ],
                                                                                "tag": "Link"
                                                                            },
                                                                            "tag": "Special"
                                                                        },
                                                                        {
                                                                            "contents": ",",
                                                                            "tag": "Word"
                                                                        }
                                                                    ],
                                                                    "tag": "Join"
                                                                },
                                                                "tag": "Group"
                                                            },
                                                            {
                                                                "contents": {
                                                                    "contents": [
                                                                        {
                                                                            "contents": {
                                                                                "contents": [
                                                                                    {
                                                                                        "annotation": {
                                                                                            "contents": "##Int",
                                                                                            "tag": "TypeReference"
                                                                                        },
                                                                                        "segment": "Int"
                                                                                    }
                                                                                ],
                                                                                "tag": "Link"
                                                                            },
                                                                            "tag": "Special"
                                                                        },
                                                                        {
                                                                            "contents": ",",
                                                                            "tag": "Word"
                                                                        }
                                                                    ],
                                                                    "tag": "Join"
                                                                },
                                                                "tag": "Group"
                                                            },
                                                            {
                                                                "contents": {
                                                                    "contents": [
                                                                        {
                                                                            "contents": {
                                                                                "contents": [
                                                                                    {
                                                                                        "annotation": {
                                                                                            "contents": "##Float",
                                                                                            "tag": "TypeReference"
                                                                                        },
                                                                                        "segment": "Float"
                                                                                    }
                                                                                ],
                                                                                "tag": "Link"
                                                                            },
                                                                            "tag": "Special"
                                                                        },
                                                                        {
                                                                            "contents": ",",
                                                                            "tag": "Word"
                                                                        }
                                                                    ],
                                                                    "tag": "Join"
                                                                },
                                                                "tag": "Group"
                                                            },
                                                            {
                                                                "contents": {
                                                                    "contents": [
                                                                        {
                                                                            "contents": {
                                                                                "contents": [
                                                                                    {
                                                                                        "annotation": {
                                                                                            "contents": "##Boolean",
                                                                                            "tag": "TypeReference"
                                                                                        },
                                                                                        "segment": "Boolean"
                                                                                    }
                                                                                ],
                                                                                "tag": "Link"
                                                                            },
                                                                            "tag": "Special"
                                                                        },
                                                                        {
                                                                            "contents": ",",
                                                                            "tag": "Word"
                                                                        }
                                                                    ],
                                                                    "tag": "Join"
                                                                },
                                                                "tag": "Group"
                                                            },
                                                            {
                                                                "contents": {
                                                                    "contents": [
                                                                        {
                                                                            "contents": {
                                                                                "contents": [
                                                                                    {
                                                                                        "annotation": {
                                                                                            "contents": "##Bytes",
                                                                                            "tag": "TypeReference"
                                                                                        },
                                                                                        "segment": "Bytes"
                                                                                    }
                                                                                ],
                                                                                "tag": "Link"
                                                                            },
                                                                            "tag": "Special"
                                                                        },
                                                                        {
                                                                            "contents": ",",
                                                                            "tag": "Word"
                                                                        }
                                                                    ],
                                                                    "tag": "Join"
                                                                },
                                                                "tag": "Group"
                                                            },
                                                            {
                                                                "contents": {
                                                                    "contents": [
                                                                        {
                                                                            "contents": {
                                                                                "contents": [
                                                                                    {
                                                                                        "annotation": {
                                                                                            "contents": "##Text",
                                                                                            "tag": "TypeReference"
                                                                                        },
                                                                                        "segment": "Text"
                                                                                    }
                                                                                ],
                                                                                "tag": "Link"
                                                                            },
                                                                            "tag": "Special"
                                                                        },
                                                                        {
                                                                            "contents": ",",
                                                                            "tag": "Word"
                                                                        }
                                                                    ],
                                                                    "tag": "Join"
                                                                },
                                                                "tag": "Group"
                                                            },
                                                            {
                                                                "contents": "and",
                                                                "tag": "Word"
                                                            },
                                                            {
                                                                "contents": {
                                                                    "contents": [
                                                                        {
                                                                            "contents": {
                                                                                "contents": [
                                                                                    {
                                                                                        "annotation": {
                                                                                            "contents": "##Char",
                                                                                            "tag": "TypeReference"
                                                                                        },
                                                                                        "segment": "Char"
                                                                                    }
                                                                                ],
                                                                                "tag": "Link"
                                                                            },
                                                                            "tag": "Special"
                                                                        },
                                                                        {
                                                                            "contents": ",",
                                                                            "tag": "Word"
                                                                        }
                                                                    ],
                                                                    "tag": "Join"
                                                                },
                                                                "tag": "Group"
                                                            },
                                                            {
                                                                "contents": "as",
                                                                "tag": "Word"
                                                            },
                                                            {
                                                                "contents": "well",
                                                                "tag": "Word"
                                                            },
                                                            {
                                                                "contents": "as",
                                                                "tag": "Word"
                                                            },
                                                            {
                                                                "contents": "operations",
                                                                "tag": "Word"
                                                            },
                                                            {
                                                                "contents": "on",
                                                                "tag": "Word"
                                                            },
                                                            {
                                                                "contents": "these",
                                                                "tag": "Word"
                                                            },
                                                            {
                                                                "contents": "types.",
                                                                "tag": "Word"
                                                            }
                                                        ],
                                                        "tag": "Paragraph"
                                                    },
                                                    {
                                                        "contents": [
                                                            {
                                                                "contents": [
                                                                    {
                                                                        "contents": [
                                                                            {
                                                                                "contents": "Collections",
                                                                                "tag": "Word"
                                                                            }
                                                                        ],
                                                                        "tag": "Paragraph"
                                                                    },
                                                                    {
                                                                        "contents": {
                                                                            "contents": {
                                                                                "contents": [
                                                                                    {
                                                                                        "annotation": {
                                                                                            "contents": "#sucij5tionuseaeisjfjupa6cjedg8i24m8kikb7buejiarov8rjeess4u0plshgnqadoh6n4o0v8nm9v318l9su7k10aucfs5r8h98",
                                                                                            "tag": "TermReference"
                                                                                        },
                                                                                        "segment": "collectionTypes"
                                                                                    }
                                                                                ],
                                                                                "tag": "Link"
                                                                            },
                                                                            "tag": "Special"
                                                                        },
                                                                        "tag": "Group"
                                                                    }
                                                                ],
                                                                "tag": "NamedLink"
                                                            },
                                                            {
                                                                "contents": "like",
                                                                "tag": "Word"
                                                            },
                                                            {
                                                                "contents": {
                                                                    "contents": [
                                                                        {
                                                                            "contents": {
                                                                                "contents": [
                                                                                    {
                                                                                        "annotation": {
                                                                                            "contents": "##Sequence",
                                                                                            "tag": "TypeReference"
                                                                                        },
                                                                                        "segment": "List"
                                                                                    }
                                                                                ],
                                                                                "tag": "Link"
                                                                            },
                                                                            "tag": "Special"
                                                                        },
                                                                        {
                                                                            "contents": ",",
                                                                            "tag": "Word"
                                                                        }
                                                                    ],
                                                                    "tag": "Join"
                                                                },
                                                                "tag": "Group"
                                                            },
                                                            {
                                                                "contents": {
                                                                    "contents": [
                                                                        {
                                                                            "contents": {
                                                                                "contents": [
                                                                                    {
                                                                                        "annotation": {
                                                                                            "contents": "#prrhin67cemaummdiu0c35cj17g8m7t96qne5i8vfj9m6ur338250jukj6q33ob0llgl9vvgc50rfgiiu7u0nvg5fvajkpqa0amjct0",
                                                                                            "tag": "TypeReference"
                                                                                        },
                                                                                        "segment": "Set"
                                                                                    }
                                                                                ],
                                                                                "tag": "Link"
                                                                            },
                                                                            "tag": "Special"
                                                                        },
                                                                        {
                                                                            "contents": ",",
                                                                            "tag": "Word"
                                                                        }
                                                                    ],
                                                                    "tag": "Join"
                                                                },
                                                                "tag": "Group"
                                                            },
                                                            {
                                                                "contents": {
                                                                    "contents": [
                                                                        {
                                                                            "contents": {
                                                                                "contents": [
                                                                                    {
                                                                                        "annotation": {
                                                                                            "contents": "#nk9jfsoidsc5h3nhcf1p6528t6c5hqui3hridbvaqnruel4jns3qo6plgups2sgi82c9jgt9ba1qlkum1bdjdgp75h7si2thbo7tcfg",
                                                                                            "tag": "TypeReference"
                                                                                        },
                                                                                        "segment": "Map"
                                                                                    }
                                                                                ],
                                                                                "tag": "Link"
                                                                            },
                                                                            "tag": "Special"
                                                                        },
                                                                        {
                                                                            "contents": ",",
                                                                            "tag": "Word"
                                                                        }
                                                                    ],
                                                                    "tag": "Join"
                                                                },
                                                                "tag": "Group"
                                                            },
                                                            {
                                                                "contents": {
                                                                    "contents": [
                                                                        {
                                                                            "annotation": {
                                                                                "contents": "#8v9565gf9gu039kgnj3jlnarqmb75r2acoqsqspgnkcor7ac04f1smo75k3sqcb27nap3hn0mmmd3rg9i6lnegivpsdrikifbta0n28",
                                                                                "tag": "TypeReference"
                                                                            },
                                                                            "segment": "data.Array"
                                                                        }
                                                                    ],
                                                                    "tag": "Link"
                                                                },
                                                                "tag": "Special"
                                                            },
                                                            {
                                                                "contents": "and",
                                                                "tag": "Word"
                                                            },
                                                            {
                                                                "contents": "others.",
                                                                "tag": "Word"
                                                            }
                                                        ],
                                                        "tag": "Paragraph"
                                                    },
                                                    {
                                                        "contents": [
                                                            {
                                                                "contents": [
                                                                    {
                                                                        "contents": [
                                                                            {
                                                                                "contents": "Tuples",
                                                                                "tag": "Word"
                                                                            }
                                                                        ],
                                                                        "tag": "Paragraph"
                                                                    },
                                                                    {
                                                                        "contents": {
                                                                            "contents": {
                                                                                "contents": [
                                                                                    {
                                                                                        "annotation": {
                                                                                            "contents": "#ujp4b8jginm3nfh9lrp05kh1j4n3pgrofrn30b0o1r70pod8pmrrtjk0ntoaeugk0q676ph9q2mp0bcnh5f6vj8khbbt0mso4m2sl3g",
                                                                                            "tag": "TermReference"
                                                                                        },
                                                                                        "segment": "Tuple.doc"
                                                                                    }
                                                                                ],
                                                                                "tag": "Link"
                                                                            },
                                                                            "tag": "Special"
                                                                        },
                                                                        "tag": "Group"
                                                                    }
                                                                ],
                                                                "tag": "NamedLink"
                                                            },
                                                            {
                                                                "contents": "–",
                                                                "tag": "Word"
                                                            },
                                                            {
                                                                "contents": "the",
                                                                "tag": "Word"
                                                            },
                                                            {
                                                                "contents": {
                                                                    "contents": [
                                                                        {
                                                                            "annotation": {
                                                                                "contents": "#2lg4ah6ir6t129m33d7gssnigacral39qdamo20mn6r2vefliubpeqnjhejai9ekjckv0qnu9mlu3k9nbpfhl2schec4dohn7rjhjt8",
                                                                                "tag": "TypeReference"
                                                                            },
                                                                            "segment": "Tuple"
                                                                        }
                                                                    ],
                                                                    "tag": "Link"
                                                                },
                                                                "tag": "Special"
                                                            },
                                                            {
                                                                "contents": "type",
                                                                "tag": "Word"
                                                            },
                                                            {
                                                                "contents": "and",
                                                                "tag": "Word"
                                                            },
                                                            {
                                                                "contents": "associated",
                                                                "tag": "Word"
                                                            },
                                                            {
                                                                "contents": "functions.",
                                                                "tag": "Word"
                                                            }
                                                        ],
                                                        "tag": "Paragraph"
                                                    },
                                                    {
                                                        "contents": [
                                                            {
                                                                "contents": [
                                                                    {
                                                                        "contents": [
                                                                            {
                                                                                "contents": "Basic",
                                                                                "tag": "Word"
                                                                            },
                                                                            {
                                                                                "contents": "data",
                                                                                "tag": "Word"
                                                                            },
                                                                            {
                                                                                "contents": "types",
                                                                                "tag": "Word"
                                                                            }
                                                                        ],
                                                                        "tag": "Paragraph"
                                                                    },
                                                                    {
                                                                        "contents": {
                                                                            "contents": {
                                                                                "contents": [
                                                                                    {
                                                                                        "annotation": {
                                                                                            "contents": "#vti02g169ibiaamanaolcl2in1jfiruu7hg7ak6di9cpd4ckjm11cjbua539h6tht16kcedfdo9085bs9d2jkiudv5gi7vmp0pd0u5g",
                                                                                            "tag": "TermReference"
                                                                                        },
                                                                                        "segment": "basicDataTypes"
                                                                                    }
                                                                                ],
                                                                                "tag": "Link"
                                                                            },
                                                                            "tag": "Special"
                                                                        },
                                                                        "tag": "Group"
                                                                    }
                                                                ],
                                                                "tag": "NamedLink"
                                                            },
                                                            {
                                                                "contents": "–",
                                                                "tag": "Word"
                                                            },
                                                            {
                                                                "contents": {
                                                                    "contents": [
                                                                        {
                                                                            "contents": {
                                                                                "contents": [
                                                                                    {
                                                                                        "annotation": {
                                                                                            "contents": "#00nv2kob8fp11qdkr750rlppf81cda95m3q0niohj1pvljnjl4r3hqrhvp1un2p40ptgkhhsne7hocod90r3qdlus9guivh7j3qcq0g",
                                                                                            "tag": "TypeReference"
                                                                                        },
                                                                                        "segment": "Unit"
                                                                                    }
                                                                                ],
                                                                                "tag": "Link"
                                                                            },
                                                                            "tag": "Special"
                                                                        },
                                                                        {
                                                                            "contents": ",",
                                                                            "tag": "Word"
                                                                        }
                                                                    ],
                                                                    "tag": "Join"
                                                                },
                                                                "tag": "Group"
                                                            },
                                                            {
                                                                "contents": {
                                                                    "contents": [
                                                                        {
                                                                            "contents": {
                                                                                "contents": [
                                                                                    {
                                                                                        "annotation": {
                                                                                            "contents": "#6nbg92mjat8jl2ad8fl0mimqvdfbou9mc6o7q8a17sc09867upl35omb1ddqrsfplk338v6porgnlm2h35u2qv0pgqhtt0a67bf16u8",
                                                                                            "tag": "TypeReference"
                                                                                        },
                                                                                        "segment": "Void"
                                                                                    }
                                                                                ],
                                                                                "tag": "Link"
                                                                            },
                                                                            "tag": "Special"
                                                                        },
                                                                        {
                                                                            "contents": ",",
                                                                            "tag": "Word"
                                                                        }
                                                                    ],
                                                                    "tag": "Join"
                                                                },
                                                                "tag": "Group"
                                                            },
                                                            {
                                                                "contents": {
                                                                    "contents": [
                                                                        {
                                                                            "contents": {
                                                                                "contents": [
                                                                                    {
                                                                                        "annotation": {
                                                                                            "contents": "#nirp5os0q69o4e1u9p3t6mmq6l6otluefi3ksm7dhm0diidjvkkgl8o9bvnflbj0sanuvdusf34f1qrins3ktcaglpcqv9oums2slsg",
                                                                                            "tag": "TypeReference"
                                                                                        },
                                                                                        "segment": "Optional"
                                                                                    }
                                                                                ],
                                                                                "tag": "Link"
                                                                            },
                                                                            "tag": "Special"
                                                                        },
                                                                        {
                                                                            "contents": ",",
                                                                            "tag": "Word"
                                                                        }
                                                                    ],
                                                                    "tag": "Join"
                                                                },
                                                                "tag": "Group"
                                                            },
                                                            {
                                                                "contents": "and",
                                                                "tag": "Word"
                                                            },
                                                            {
                                                                "contents": {
                                                                    "contents": [
                                                                        {
                                                                            "contents": {
                                                                                "contents": [
                                                                                    {
                                                                                        "annotation": {
                                                                                            "contents": "#0o7mf021foma9acqdaibmlh1jidlijq08uf7f5se9tssttqs546pfunjpk6s31mqoq8s2o1natede8hkk6he45l95fibglidikt44v8",
                                                                                            "tag": "TypeReference"
                                                                                        },
                                                                                        "segment": "Either"
                                                                                    }
                                                                                ],
                                                                                "tag": "Link"
                                                                            },
                                                                            "tag": "Special"
                                                                        },
                                                                        {
                                                                            "contents": ".",
                                                                            "tag": "Word"
                                                                        }
                                                                    ],
                                                                    "tag": "Join"
                                                                },
                                                                "tag": "Group"
                                                            }
                                                        ],
                                                        "tag": "Paragraph"
                                                    },
                                                    {
                                                        "contents": [
                                                            {
                                                                "contents": [
                                                                    {
                                                                        "contents": [
                                                                            {
                                                                                "contents": "Basic",
                                                                                "tag": "Word"
                                                                            },
                                                                            {
                                                                                "contents": "abilities",
                                                                                "tag": "Word"
                                                                            }
                                                                        ],
                                                                        "tag": "Paragraph"
                                                                    },
                                                                    {
                                                                        "contents": {
                                                                            "contents": {
                                                                                "contents": [
                                                                                    {
                                                                                        "annotation": {
                                                                                            "contents": "#5vlhb8hsnfo5m9928qb715nv8tn90vh14ipf6vhkqjj82qnhsbn494q9q70n8osgd3dhgl0sgil3fe7848m5i2heajbbhh78khk0ub0",
                                                                                            "tag": "TermReference"
                                                                                        },
                                                                                        "segment": "basicAbilities"
                                                                                    }
                                                                                ],
                                                                                "tag": "Link"
                                                                            },
                                                                            "tag": "Special"
                                                                        },
                                                                        "tag": "Group"
                                                                    }
                                                                ],
                                                                "tag": "NamedLink"
                                                            },
                                                            {
                                                                "contents": "such",
                                                                "tag": "Word"
                                                            },
                                                            {
                                                                "contents": "as",
                                                                "tag": "Word"
                                                            },
                                                            {
                                                                "contents": {
                                                                    "contents": [
                                                                        {
                                                                            "contents": {
                                                                                "contents": [
                                                                                    {
                                                                                        "annotation": {
                                                                                            "contents": "#b589mbg492brf3k3t0lg706d7ob88jqslgmja9gkrimv4137utuittc2r9l1tgvhrl40f71c99m39ch48gubbjhn5vf2pf5evjsinn8",
                                                                                            "tag": "TypeReference"
                                                                                        },
                                                                                        "segment": "Abort"
                                                                                    }
                                                                                ],
                                                                                "tag": "Link"
                                                                            },
                                                                            "tag": "Special"
                                                                        },
                                                                        {
                                                                            "contents": ",",
                                                                            "tag": "Word"
                                                                        }
                                                                    ],
                                                                    "tag": "Join"
                                                                },
                                                                "tag": "Group"
                                                            },
                                                            {
                                                                "contents": {
                                                                    "contents": [
                                                                        {
                                                                            "contents": {
                                                                                "contents": [
                                                                                    {
                                                                                        "annotation": {
                                                                                            "contents": "#h4uhcub76va4tckj1iccnsb07rh0fhgpigqapb4jh5n07s0tugec4nm2vikuv973mab7oh4ne07o6armcnnl7mbfjtb4imphgrjgimg",
                                                                                            "tag": "TypeReference"
                                                                                        },
                                                                                        "segment": "Ask"
                                                                                    }
                                                                                ],
                                                                                "tag": "Link"
                                                                            },
                                                                            "tag": "Special"
                                                                        },
                                                                        {
                                                                            "contents": ",",
                                                                            "tag": "Word"
                                                                        }
                                                                    ],
                                                                    "tag": "Join"
                                                                },
                                                                "tag": "Group"
                                                            },
                                                            {
                                                                "contents": {
                                                                    "contents": [
                                                                        {
                                                                            "contents": {
                                                                                "contents": [
                                                                                    {
                                                                                        "annotation": {
                                                                                            "contents": "#jepp512vb4m2no30cvcueqs199iends2bnatu86t196k83radiguds4gkkk4btv1fvurjob4dv8i7tj3a750cg4lum7329e9m7fe45o",
                                                                                            "tag": "TypeReference"
                                                                                        },
                                                                                        "segment": "Random"
                                                                                    }
                                                                                ],
                                                                                "tag": "Link"
                                                                            },
                                                                            "tag": "Special"
                                                                        },
                                                                        {
                                                                            "contents": ",",
                                                                            "tag": "Word"
                                                                        }
                                                                    ],
                                                                    "tag": "Join"
                                                                },
                                                                "tag": "Group"
                                                            },
                                                            {
                                                                "contents": {
                                                                    "contents": [
                                                                        {
                                                                            "contents": {
                                                                                "contents": [
                                                                                    {
                                                                                        "annotation": {
                                                                                            "contents": "#fmj3l8nggpfuh0ueuhr2rcka4s91ihufqiq6rocn25vsnni3v8rtjjteq79d398shvrfvbmhhoc7amhoh9lmdlghhiirl81sodj3ti0",
                                                                                            "tag": "TypeReference"
                                                                                        },
                                                                                        "segment": "Store"
                                                                                    }
                                                                                ],
                                                                                "tag": "Link"
                                                                            },
                                                                            "tag": "Special"
                                                                        },
                                                                        {
                                                                            "contents": ",",
                                                                            "tag": "Word"
                                                                        }
                                                                    ],
                                                                    "tag": "Join"
                                                                },
                                                                "tag": "Group"
                                                            },
                                                            {
                                                                "contents": {
                                                                    "contents": [
                                                                        {
                                                                            "contents": {
                                                                                "contents": [
                                                                                    {
                                                                                        "annotation": {
                                                                                            "contents": "#rfi1v9429f9qluv533l2iba77aadttilrpmnhljfapfnfa6sru2nr8ibpqvib9nc4s4nb9s1as45upsfqfqe6ivqi2p82b2vd866it8",
                                                                                            "tag": "TypeReference"
                                                                                        },
                                                                                        "segment": "Stream"
                                                                                    }
                                                                                ],
                                                                                "tag": "Link"
                                                                            },
                                                                            "tag": "Special"
                                                                        },
                                                                        {
                                                                            "contents": ",",
                                                                            "tag": "Word"
                                                                        }
                                                                    ],
                                                                    "tag": "Join"
                                                                },
                                                                "tag": "Group"
                                                            },
                                                            {
                                                                "contents": "and",
                                                                "tag": "Word"
                                                            },
                                                            {
                                                                "contents": {
                                                                    "contents": [
                                                                        {
                                                                            "contents": {
                                                                                "contents": [
                                                                                    {
                                                                                        "annotation": {
                                                                                            "contents": "#32q9jqhmi8f08pec3hj0je4u7k52f9f1hdfsmn9ncg2kpki5da9dabigplvdcot3a00k7s5npc4n78psd6ojaumqjla259e9pqd4ov8",
                                                                                            "tag": "TypeReference"
                                                                                        },
                                                                                        "segment": "Throw"
                                                                                    }
                                                                                ],
                                                                                "tag": "Link"
                                                                            },
                                                                            "tag": "Special"
                                                                        },
                                                                        {
                                                                            "contents": ".",
                                                                            "tag": "Word"
                                                                        }
                                                                    ],
                                                                    "tag": "Join"
                                                                },
                                                                "tag": "Group"
                                                            }
                                                        ],
                                                        "tag": "Paragraph"
                                                    },
                                                    {
                                                        "contents": [
                                                            {
                                                                "contents": [
                                                                    {
                                                                        "contents": [
                                                                            {
                                                                                "contents": "Input",
                                                                                "tag": "Word"
                                                                            },
                                                                            {
                                                                                "contents": "and",
                                                                                "tag": "Word"
                                                                            },
                                                                            {
                                                                                "contents": "output",
                                                                                "tag": "Word"
                                                                            }
                                                                        ],
                                                                        "tag": "Paragraph"
                                                                    },
                                                                    {
                                                                        "contents": {
                                                                            "contents": {
                                                                                "contents": [
                                                                                    {
                                                                                        "annotation": {
                                                                                            "contents": "#joqrus67evfsd9bd5tkbqosotbosrsqt56699977ljia8uee4kv7dojkih84t1jvu2742r10mln40o39s98t3n6o1brbfo0iakob5ag",
                                                                                            "tag": "TermReference"
                                                                                        },
                                                                                        "segment": "IO.doc"
                                                                                    }
                                                                                ],
                                                                                "tag": "Link"
                                                                            },
                                                                            "tag": "Special"
                                                                        },
                                                                        "tag": "Group"
                                                                    }
                                                                ],
                                                                "tag": "NamedLink"
                                                            },
                                                            {
                                                                "contents": "–",
                                                                "tag": "Word"
                                                            },
                                                            {
                                                                "contents": "the",
                                                                "tag": "Word"
                                                            },
                                                            {
                                                                "contents": {
                                                                    "contents": [
                                                                        {
                                                                            "annotation": {
                                                                                "contents": "##IO",
                                                                                "tag": "TypeReference"
                                                                            },
                                                                            "segment": "IO"
                                                                        }
                                                                    ],
                                                                    "tag": "Link"
                                                                },
                                                                "tag": "Special"
                                                            },
                                                            {
                                                                "contents": "ability",
                                                                "tag": "Word"
                                                            },
                                                            {
                                                                "contents": "and",
                                                                "tag": "Word"
                                                            },
                                                            {
                                                                "contents": "basic",
                                                                "tag": "Word"
                                                            },
                                                            {
                                                                "contents": "I/O",
                                                                "tag": "Word"
                                                            },
                                                            {
                                                                "contents": "functions.",
                                                                "tag": "Word"
                                                            }
                                                        ],
                                                        "tag": "Paragraph"
                                                    },
                                                    {
                                                        "contents": [
                                                            {
                                                                "contents": [
                                                                    {
                                                                        "contents": [
                                                                            {
                                                                                "contents": "Basic",
                                                                                "tag": "Word"
                                                                            },
                                                                            {
                                                                                "contents": "networking",
                                                                                "tag": "Word"
                                                                            }
                                                                        ],
                                                                        "tag": "Paragraph"
                                                                    },
                                                                    {
                                                                        "contents": {
                                                                            "contents": {
                                                                                "contents": [
                                                                                    {
                                                                                        "annotation": {
                                                                                            "contents": "#074albp4a5uvbgl07tli1q3o70d27b9oh50dqdfgv0sihok5gt0k2rvpsg8uehima623sj3tfqg2nm625u0p3faompjaobcg66iojj0",
                                                                                            "tag": "TermReference"
                                                                                        },
                                                                                        "segment": "networkAccess"
                                                                                    }
                                                                                ],
                                                                                "tag": "Link"
                                                                            },
                                                                            "tag": "Special"
                                                                        },
                                                                        "tag": "Group"
                                                                    }
                                                                ],
                                                                "tag": "NamedLink"
                                                            },
                                                            {
                                                                "contents": "–",
                                                                "tag": "Word"
                                                            },
                                                            {
                                                                "contents": "networking",
                                                                "tag": "Word"
                                                            },
                                                            {
                                                                "contents": "primitives",
                                                                "tag": "Word"
                                                            },
                                                            {
                                                                "contents": "like",
                                                                "tag": "Word"
                                                            },
                                                            {
                                                                "contents": {
                                                                    "contents": [
                                                                        {
                                                                            "annotation": {
                                                                                "contents": "##Socket",
                                                                                "tag": "TypeReference"
                                                                            },
                                                                            "segment": "Socket"
                                                                        }
                                                                    ],
                                                                    "tag": "Link"
                                                                },
                                                                "tag": "Special"
                                                            },
                                                            {
                                                                "contents": "and",
                                                                "tag": "Word"
                                                            },
                                                            {
                                                                "contents": {
                                                                    "contents": [
                                                                        {
                                                                            "contents": {
                                                                                "contents": [
                                                                                    {
                                                                                        "annotation": {
                                                                                            "contents": "##Tls",
                                                                                            "tag": "TypeReference"
                                                                                        },
                                                                                        "segment": "Tls"
                                                                                    }
                                                                                ],
                                                                                "tag": "Link"
                                                                            },
                                                                            "tag": "Special"
                                                                        },
                                                                        {
                                                                            "contents": ".",
                                                                            "tag": "Word"
                                                                        }
                                                                    ],
                                                                    "tag": "Join"
                                                                },
                                                                "tag": "Group"
                                                            }
                                                        ],
                                                        "tag": "Paragraph"
                                                    },
                                                    {
                                                        "contents": [
                                                            {
                                                                "contents": [
                                                                    {
                                                                        "contents": [
                                                                            {
                                                                                "contents": "Concurrency",
                                                                                "tag": "Word"
                                                                            }
                                                                        ],
                                                                        "tag": "Paragraph"
                                                                    },
                                                                    {
                                                                        "contents": {
                                                                            "contents": {
                                                                                "contents": [
                                                                                    {
                                                                                        "annotation": {
                                                                                            "contents": "#69k4g1fb4u4djoabi26o85n3eelpo849bouptgsfjfdagsk6d6rgud5rf5bc35q6d92c5ouqcgev9fc36hf161qpr9psr82q1kalji8",
                                                                                            "tag": "TermReference"
                                                                                        },
                                                                                        "segment": "concurrency"
                                                                                    }
                                                                                ],
                                                                                "tag": "Link"
                                                                            },
                                                                            "tag": "Special"
                                                                        },
                                                                        "tag": "Group"
                                                                    }
                                                                ],
                                                                "tag": "NamedLink"
                                                            },
                                                            {
                                                                "contents": "–",
                                                                "tag": "Word"
                                                            },
                                                            {
                                                                "contents": "threads,",
                                                                "tag": "Word"
                                                            },
                                                            {
                                                                "contents": "mutable",
                                                                "tag": "Word"
                                                            },
                                                            {
                                                                "contents": "memory",
                                                                "tag": "Word"
                                                            },
                                                            {
                                                                "contents": "cells,",
                                                                "tag": "Word"
                                                            },
                                                            {
                                                                "contents": "and",
                                                                "tag": "Word"
                                                            },
                                                            {
                                                                "contents": "software-transactional",
                                                                "tag": "Word"
                                                            },
                                                            {
                                                                "contents": "memory.",
                                                                "tag": "Word"
                                                            }
                                                        ],
                                                        "tag": "Paragraph"
                                                    },
                                                    {
                                                        "contents": [
                                                            {
                                                                "contents": [
                                                                    {
                                                                        "contents": [
                                                                            {
                                                                                "contents": "Higher-order",
                                                                                "tag": "Word"
                                                                            },
                                                                            {
                                                                                "contents": "functions",
                                                                                "tag": "Word"
                                                                            }
                                                                        ],
                                                                        "tag": "Paragraph"
                                                                    },
                                                                    {
                                                                        "contents": {
                                                                            "contents": {
                                                                                "contents": [
                                                                                    {
                                                                                        "annotation": {
                                                                                            "contents": "#34ik76cm5ma0nr34h7ri427uicdaao7kou3jna00jeak384oe82759s8j82bs22f1u3af09fjckeojsgndh125aiprv1j2vc12lu9v0",
                                                                                            "tag": "TermReference"
                                                                                        },
                                                                                        "segment": "higherOrderFunctions"
                                                                                    }
                                                                                ],
                                                                                "tag": "Link"
                                                                            },
                                                                            "tag": "Special"
                                                                        },
                                                                        "tag": "Group"
                                                                    }
                                                                ],
                                                                "tag": "NamedLink"
                                                            },
                                                            {
                                                                "contents": "–",
                                                                "tag": "Word"
                                                            },
                                                            {
                                                                "contents": "functions",
                                                                "tag": "Word"
                                                            },
                                                            {
                                                                "contents": "that",
                                                                "tag": "Word"
                                                            },
                                                            {
                                                                "contents": "operate",
                                                                "tag": "Word"
                                                            },
                                                            {
                                                                "contents": "on",
                                                                "tag": "Word"
                                                            },
                                                            {
                                                                "contents": "functions.",
                                                                "tag": "Word"
                                                            }
                                                        ],
                                                        "tag": "Paragraph"
                                                    },
                                                    {
                                                        "contents": [
                                                            {
                                                                "contents": [
                                                                    {
                                                                        "contents": [
                                                                            {
                                                                                "contents": "Tests",
                                                                                "tag": "Word"
                                                                            }
                                                                        ],
                                                                        "tag": "Paragraph"
                                                                    },
                                                                    {
                                                                        "contents": {
                                                                            "contents": {
                                                                                "contents": [
                                                                                    {
                                                                                        "annotation": {
                                                                                            "contents": "#bclg8cr5khn4376d6t68a352p5v4rahst2atn4er416begrnor1kpgm7dn0kd3e3cr1vcu0oldm7fplsjt53ef9ahtp89i9722vd5k8",
                                                                                            "tag": "TermReference"
                                                                                        },
                                                                                        "segment": "docs.tests"
                                                                                    }
                                                                                ],
                                                                                "tag": "Link"
                                                                            },
                                                                            "tag": "Special"
                                                                        },
                                                                        "tag": "Group"
                                                                    }
                                                                ],
                                                                "tag": "NamedLink"
                                                            },
                                                            {
                                                                "contents": "–",
                                                                "tag": "Word"
                                                            },
                                                            {
                                                                "contents": "tests",
                                                                "tag": "Word"
                                                            },
                                                            {
                                                                "contents": "and",
                                                                "tag": "Word"
                                                            },
                                                            {
                                                                "contents": "test-case",
                                                                "tag": "Word"
                                                            },
                                                            {
                                                                "contents": "generation.",
                                                                "tag": "Word"
                                                            }
                                                        ],
                                                        "tag": "Paragraph"
                                                    },
                                                    {
                                                        "contents": [
                                                            {
                                                                "contents": [
                                                                    {
                                                                        "contents": [
                                                                            {
                                                                                "contents": "Unison",
                                                                                "tag": "Word"
                                                                            },
                                                                            {
                                                                                "contents": "language",
                                                                                "tag": "Word"
                                                                            },
                                                                            {
                                                                                "contents": "support",
                                                                                "tag": "Word"
                                                                            }
                                                                        ],
                                                                        "tag": "Paragraph"
                                                                    },
                                                                    {
                                                                        "contents": {
                                                                            "contents": {
                                                                                "contents": [
                                                                                    {
                                                                                        "annotation": {
                                                                                            "contents": "#th2bml23oakiivqe3qdhvuu0q9nqjogio3a482j5m4n2ffs56fjtso4m784hk848e6opj3940gqjkp02mflo61dr1hfj6jumsojg4ag",
                                                                                            "tag": "TermReference"
                                                                                        },
                                                                                        "segment": "languageSupport"
                                                                                    }
                                                                                ],
                                                                                "tag": "Link"
                                                                            },
                                                                            "tag": "Special"
                                                                        },
                                                                        "tag": "Group"
                                                                    }
                                                                ],
                                                                "tag": "NamedLink"
                                                            },
                                                            {
                                                                "contents": "–",
                                                                "tag": "Word"
                                                            },
                                                            {
                                                                "contents": "types",
                                                                "tag": "Word"
                                                            },
                                                            {
                                                                "contents": "and",
                                                                "tag": "Word"
                                                            },
                                                            {
                                                                "contents": "functions",
                                                                "tag": "Word"
                                                            },
                                                            {
                                                                "contents": "for",
                                                                "tag": "Word"
                                                            },
                                                            {
                                                                "contents": "the",
                                                                "tag": "Word"
                                                            },
                                                            {
                                                                "contents": "Unison",
                                                                "tag": "Word"
                                                            },
                                                            {
                                                                "contents": "language",
                                                                "tag": "Word"
                                                            },
                                                            {
                                                                "contents": "itself.",
                                                                "tag": "Word"
                                                            }
                                                        ],
                                                        "tag": "Paragraph"
                                                    },
                                                    {
                                                        "contents": [
                                                            {
                                                                "contents": [
                                                                    {
                                                                        "contents": [
                                                                            {
                                                                                "contents": "First-class",
                                                                                "tag": "Word"
                                                                            },
                                                                            {
                                                                                "contents": "documentation",
                                                                                "tag": "Word"
                                                                            }
                                                                        ],
                                                                        "tag": "Paragraph"
                                                                    },
                                                                    {
                                                                        "contents": {
                                                                            "contents": {
                                                                                "contents": [
                                                                                    {
                                                                                        "annotation": {
                                                                                            "contents": "#mp0apsvhkfs6ndp3icrqv5m3ajs5eqhdkf746oedsk0euqk4fkvojr6bdt32o60k5l5i58dpovectps2ddvq4juhp465g9m4cpobdbo",
                                                                                            "tag": "TermReference"
                                                                                        },
                                                                                        "segment": "Doc.doc"
                                                                                    }
                                                                                ],
                                                                                "tag": "Link"
                                                                            },
                                                                            "tag": "Special"
                                                                        },
                                                                        "tag": "Group"
                                                                    }
                                                                ],
                                                                "tag": "NamedLink"
                                                            },
                                                            {
                                                                "contents": "–",
                                                                "tag": "Word"
                                                            },
                                                            {
                                                                "contents": "the",
                                                                "tag": "Word"
                                                            },
                                                            {
                                                                "contents": {
                                                                    "contents": [
                                                                        {
                                                                            "annotation": {
                                                                                "contents": "#ej86si0ur1lsjade71dojr25phk9bbom9rdks6dltolos5tjivakujcriqe02npba53n9gd7tkh8bmv08ttjb9t35lq2ch5heshqcs0",
                                                                                "tag": "TypeReference"
                                                                            },
                                                                            "segment": "Doc"
                                                                        }
                                                                    ],
                                                                    "tag": "Link"
                                                                },
                                                                "tag": "Special"
                                                            },
                                                            {
                                                                "contents": "type",
                                                                "tag": "Word"
                                                            },
                                                            {
                                                                "contents": "for",
                                                                "tag": "Word"
                                                            },
                                                            {
                                                                "contents": "writing",
                                                                "tag": "Word"
                                                            },
                                                            {
                                                                "contents": "Unison",
                                                                "tag": "Word"
                                                            },
                                                            {
                                                                "contents": "docs,",
                                                                "tag": "Word"
                                                            },
                                                            {
                                                                "contents": "like",
                                                                "tag": "Word"
                                                            },
                                                            {
                                                                "contents": "this",
                                                                "tag": "Word"
                                                            },
                                                            {
                                                                "contents": "very",
                                                                "tag": "Word"
                                                            },
                                                            {
                                                                "contents": "document!",
                                                                "tag": "Word"
                                                            }
                                                        ],
                                                        "tag": "Paragraph"
                                                    },
                                                    {
                                                        "contents": [
                                                            {
                                                                "contents": [
                                                                    {
                                                                        "contents": [
                                                                            {
                                                                                "contents": "Very",
                                                                                "tag": "Word"
                                                                            },
                                                                            {
                                                                                "contents": "large",
                                                                                "tag": "Word"
                                                                            },
                                                                            {
                                                                                "contents": "numbers",
                                                                                "tag": "Word"
                                                                            }
                                                                        ],
                                                                        "tag": "Paragraph"
                                                                    },
                                                                    {
                                                                        "contents": {
                                                                            "contents": {
                                                                                "contents": [
                                                                                    {
                                                                                        "annotation": {
                                                                                            "contents": "#qjriier1l7voqpos5hslnrtmm6jq1m4nnvhfimg9b0bmkg1f33va0ctbm7v2ibvjt7nqm7mk096pdm8nk53bc2g36bi7o59mjtovvro",
                                                                                            "tag": "TermReference"
                                                                                        },
                                                                                        "segment": "Natural.doc"
                                                                                    }
                                                                                ],
                                                                                "tag": "Link"
                                                                            },
                                                                            "tag": "Special"
                                                                        },
                                                                        "tag": "Group"
                                                                    }
                                                                ],
                                                                "tag": "NamedLink"
                                                            },
                                                            {
                                                                "contents": "based",
                                                                "tag": "Word"
                                                            },
                                                            {
                                                                "contents": "on",
                                                                "tag": "Word"
                                                            },
                                                            {
                                                                "contents": "the",
                                                                "tag": "Word"
                                                            },
                                                            {
                                                                "contents": {
                                                                    "contents": [
                                                                        {
                                                                            "annotation": {
                                                                                "contents": "#mch0tun94eovcb1hdeugfu6319pl8q5es1kq5831aumc19b784bkhbhj4v436s38pintnj864nuuo6t05t5s14mlgi5mevkk47qk2mo",
                                                                                "tag": "TypeReference"
                                                                            },
                                                                            "segment": "Natural"
                                                                        }
                                                                    ],
                                                                    "tag": "Link"
                                                                },
                                                                "tag": "Special"
                                                            },
                                                            {
                                                                "contents": "type.",
                                                                "tag": "Word"
                                                            }
                                                        ],
                                                        "tag": "Paragraph"
                                                    },
                                                    {
                                                        "contents": [
                                                            {
                                                                "contents": [
                                                                    {
                                                                        "contents": [
                                                                            {
                                                                                "contents": "Date",
                                                                                "tag": "Word"
                                                                            },
                                                                            {
                                                                                "contents": "and",
                                                                                "tag": "Word"
                                                                            },
                                                                            {
                                                                                "contents": "time",
                                                                                "tag": "Word"
                                                                            }
                                                                        ],
                                                                        "tag": "Paragraph"
                                                                    },
                                                                    {
                                                                        "contents": {
                                                                            "contents": {
                                                                                "contents": [
                                                                                    {
                                                                                        "annotation": {
                                                                                            "contents": "#blcdk5knpnn6aiu70v1kb9jr643endk15c3741euhquvp1a8u1bs6plc05jd61771injbi0lru6ndg3ms828vckfr4pvfilv7tnbcc8",
                                                                                            "tag": "TermReference"
                                                                                        },
                                                                                        "segment": "time.README"
                                                                                    }
                                                                                ],
                                                                                "tag": "Link"
                                                                            },
                                                                            "tag": "Special"
                                                                        },
                                                                        "tag": "Group"
                                                                    }
                                                                ],
                                                                "tag": "NamedLink"
                                                            },
                                                            {
                                                                "contents": "–",
                                                                "tag": "Word"
                                                            },
                                                            {
                                                                "contents": "real-time",
                                                                "tag": "Word"
                                                            },
                                                            {
                                                                "contents": "clocks,",
                                                                "tag": "Word"
                                                            },
                                                            {
                                                                "contents": "date",
                                                                "tag": "Word"
                                                            },
                                                            {
                                                                "contents": "and",
                                                                "tag": "Word"
                                                            },
                                                            {
                                                                "contents": "time",
                                                                "tag": "Word"
                                                            },
                                                            {
                                                                "contents": "types,",
                                                                "tag": "Word"
                                                            },
                                                            {
                                                                "contents": "and",
                                                                "tag": "Word"
                                                            },
                                                            {
                                                                "contents": "supporting",
                                                                "tag": "Word"
                                                            },
                                                            {
                                                                "contents": "functions.",
                                                                "tag": "Word"
                                                            }
                                                        ],
                                                        "tag": "Paragraph"
                                                    }
                                                ],
                                                "tag": "BulletedList"
                                            }
                                        ]
                                    ],
                                    "tag": "Section"
                                }
                            ]
                        ],
                        "tag": "Section"
                    }
                ]
            ]
        }
    },
    "typeDefinitions": {},
    "missingDefinitions": []
}
"""
