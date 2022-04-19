{- TODO: Add Design Tokens!!! -}


module Code.Hashvatar.HexGrid exposing (..)

import Html exposing (Html)
import Svg exposing (g, mask, path, rect, svg)
import Svg.Attributes as Attrs
    exposing
        ( d
        , fill
        , height
        , id
        , maskUnits
        , rx
        , style
        , viewBox
        , width
        , x
        , y
        )
import UI.Color as Color exposing (Color)


type alias HexGrid =
    { background : Color
    , tendrils : Color
    , cell1 : Color
    , cell2 : Color
    , cell3 : Color
    }


empty : HexGrid
empty =
    { background = Color.grayDarken20
    , tendrils = Color.grayBase
    , cell1 = Color.grayLighten30
    , cell2 = Color.grayLighten30
    , cell3 = Color.grayLighten30
    }


view : HexGrid -> Html msg
view cfg_ =
    let
        cfg =
            { background = Color.toCssString cfg_.background
            , tendrils = Color.toCssString cfg_.tendrils
            , cell1 = Color.toCssString cfg_.cell1
            , cell2 = Color.toCssString cfg_.cell2
            , cell3 = Color.toCssString cfg_.cell3
            }

        tendrils =
            g []
                [ path [ fill cfg.tendrils, d "M7.65541 2.93911L10.3665 1.37384C8.12966 -2.50053 3.99576 -4.88724 -0.47798 -4.88724V-1.75671C2.87732 -1.75671 5.97777 0.0333302 7.65541 2.93911ZM10.3665 1.37384C9.9343 0.62518 8.977 0.368677 8.22835 0.80092C7.47969 1.23315 7.22317 2.19045 7.65541 2.93911C8.08764 3.68777 9.04497 3.94429 9.79362 3.51205C10.5423 3.07982 10.7988 2.12249 10.3665 1.37384ZM-0.47798 -4.88724C-1.34246 -4.88724 -2.04324 -4.18644 -2.04324 -3.32197C-2.04324 -2.45749 -1.34246 -1.75671 -0.47798 -1.75671C0.386494 -1.75671 1.08731 -2.45749 1.08731 -3.32197C1.08731 -4.18644 0.386494 -4.88724 -0.47798 -4.88724Z" ] []
                , path [ fill cfg.tendrils, d "M10.3665 1.37384L7.65541 2.93911C9.89228 6.81348 14.0262 9.2002 18.5 9.2002V6.06965C15.1447 6.06965 12.0442 4.27962 10.3665 1.37384ZM7.65541 2.93911C8.08764 3.68777 9.04497 3.94429 9.79362 3.51205C10.5423 3.07982 10.7988 2.12249 10.3665 1.37384C9.9343 0.62518 8.977 0.368677 8.22835 0.80092C7.47969 1.23315 7.22317 2.19045 7.65541 2.93911ZM18.5 9.2002C19.3645 9.2002 20.0652 8.49938 20.0652 7.63491C20.0652 6.77043 19.3645 6.06965 18.5 6.06965C17.6355 6.06965 16.9347 6.77043 16.9347 7.63491C16.9347 8.49938 17.6355 9.2002 18.5 9.2002Z" ] []
                , path [ fill cfg.tendrils, d "M18.5 9.2002V6.06965C14.0262 6.06965 9.89233 8.45638 7.65546 12.3307L10.3666 13.896C12.0442 10.9902 15.1447 9.2002 18.5 9.2002ZM18.5 6.06965C17.6355 6.06965 16.9347 6.77043 16.9347 7.63491C16.9347 8.49938 17.6355 9.2002 18.5 9.2002C19.3645 9.2002 20.0652 8.49938 20.0652 7.63491C20.0652 6.77043 19.3645 6.06965 18.5 6.06965ZM7.65546 12.3307C7.22322 13.0794 7.47973 14.0367 8.22838 14.469C8.97704 14.9012 9.93435 14.6447 10.3666 13.896C10.7988 13.1474 10.5423 12.1901 9.79366 11.7578C9.045 11.3256 8.08769 11.5821 7.65546 12.3307Z" ] []
                , path [ fill cfg.tendrils, d "M7.65546 12.3307L10.3666 13.896C12.6034 10.0217 12.6034 5.24822 10.3665 1.37384L7.65541 2.93911C9.33307 5.84489 9.33311 9.42498 7.65546 12.3307ZM10.3666 13.896C10.7988 13.1474 10.5423 12.1901 9.79366 11.7578C9.045 11.3256 8.08769 11.5821 7.65546 12.3307C7.22322 13.0794 7.47973 14.0367 8.22838 14.469C8.97704 14.9012 9.93435 14.6447 10.3666 13.896ZM10.3665 1.37384C9.9343 0.62518 8.977 0.368677 8.22835 0.80092C7.47969 1.23315 7.22317 2.19045 7.65541 2.93911C8.08764 3.68777 9.04497 3.94429 9.79362 3.51205C10.5423 3.07982 10.7988 2.12249 10.3665 1.37384Z" ] []
                , path [ fill cfg.tendrils, d "M10.3666 13.896L7.65546 12.3307C5.41859 16.2051 5.41859 20.9786 7.65546 24.853L10.3666 23.2877C8.68892 20.3819 8.68892 16.8018 10.3666 13.896ZM7.65546 12.3307C7.22322 13.0794 7.47973 14.0367 8.22838 14.469C8.97704 14.9012 9.93435 14.6447 10.3666 13.896C10.7988 13.1474 10.5423 12.1901 9.79366 11.7578C9.045 11.3256 8.08769 11.5821 7.65546 12.3307ZM7.65546 24.853C8.08769 25.6016 9.04499 25.8581 9.79364 25.4259C10.5423 24.9936 10.7988 24.0363 10.3666 23.2877C9.93435 22.539 8.97703 22.2825 8.22837 22.7148C7.47971 23.147 7.22321 24.1043 7.65546 24.853Z" ] []
                , path [ fill cfg.tendrils, d "M7.65546 24.853L10.3666 23.2877C8.12971 19.4133 3.99576 17.0265 -0.47798 17.0265V20.1571C2.87732 20.1571 5.97782 21.9472 7.65546 24.853ZM10.3666 23.2877C9.93435 22.539 8.97703 22.2825 8.22837 22.7148C7.47971 23.147 7.22321 24.1043 7.65546 24.853C8.08769 25.6016 9.04499 25.8581 9.79364 25.4259C10.5423 24.9936 10.7988 24.0363 10.3666 23.2877ZM-0.47798 17.0265C-1.34246 17.0265 -2.04324 17.7273 -2.04324 18.5918C-2.04324 19.4563 -1.34246 20.1571 -0.47798 20.1571C0.386494 20.1571 1.08731 19.4563 1.08731 18.5918C1.08731 17.7273 0.386494 17.0265 -0.47798 17.0265Z" ] []
                , path [ fill cfg.tendrils, d "M-0.47798 17.0265V20.1571C3.99576 20.1571 8.12971 17.7704 10.3666 13.896L7.65546 12.3307C5.9778 15.2365 2.87732 17.0265 -0.47798 17.0265ZM-0.47798 20.1571C0.386494 20.1571 1.08731 19.4563 1.08731 18.5918C1.08731 17.7273 0.386494 17.0265 -0.47798 17.0265C-1.34246 17.0265 -2.04324 17.7273 -2.04324 18.5918C-2.04324 19.4563 -1.34246 20.1571 -0.47798 20.1571ZM10.3666 13.896C10.7988 13.1474 10.5423 12.1901 9.79366 11.7578C9.045 11.3256 8.08769 11.5821 7.65546 12.3307C7.22322 13.0794 7.47973 14.0367 8.22838 14.469C8.97704 14.9012 9.93435 14.6447 10.3666 13.896Z" ] []
                , path [ fill cfg.tendrils, d "M6.56578 19.835C7.31443 19.4028 7.57095 18.4455 7.1387 17.6968C6.70647 16.9482 5.74916 16.6917 5.0005 17.1239C4.25185 17.5561 3.99534 18.5135 4.42758 19.2621C4.85981 20.0108 5.81712 20.2673 6.56578 19.835Z" ] []
                , path [ fill cfg.tendrils, d "M26.6334 13.896L29.3445 12.3307C27.1077 8.45638 22.9737 6.06965 18.5 6.06965V9.2002C21.8553 9.2002 24.9558 10.9902 26.6334 13.896ZM29.3445 12.3307C28.9123 11.5821 27.955 11.3256 27.2063 11.7578C26.4577 12.1901 26.2012 13.1474 26.6334 13.896C27.0656 14.6447 28.023 14.9012 28.7716 14.469C29.5203 14.0367 29.7768 13.0794 29.3445 12.3307ZM18.5 6.06965C17.6355 6.06965 16.9347 6.77043 16.9347 7.63491C16.9347 8.49938 17.6355 9.2002 18.5 9.2002C19.3645 9.2002 20.0652 8.49938 20.0652 7.63491C20.0652 6.77043 19.3645 6.06965 18.5 6.06965Z" ] []
                , path [ fill cfg.tendrils, d "M18.5 6.06965V9.2002C22.9737 9.2002 27.1077 6.81347 29.3445 2.9391L26.6334 1.37383C24.9558 4.27961 21.8553 6.06965 18.5 6.06965ZM18.5 9.2002C19.3645 9.2002 20.0652 8.49938 20.0652 7.63491C20.0652 6.77043 19.3645 6.06965 18.5 6.06965C17.6355 6.06965 16.9347 6.77043 16.9347 7.63491C16.9347 8.49938 17.6355 9.2002 18.5 9.2002ZM29.3445 2.9391C29.7768 2.19045 29.5203 1.23314 28.7716 0.800907C28.0229 0.368676 27.0656 0.625174 26.6334 1.37383C26.2012 2.12249 26.4577 3.0798 27.2063 3.51203C27.955 3.94426 28.9123 3.68776 29.3445 2.9391Z" ] []
                , path [ fill cfg.tendrils, d "M7.65546 24.853L10.3666 23.2877C8.12971 19.4133 3.99576 17.0265 -0.47798 17.0265V20.1571C2.87732 20.1571 5.97782 21.9472 7.65546 24.853ZM10.3666 23.2877C9.93435 22.539 8.97703 22.2825 8.22837 22.7148C7.47971 23.147 7.22321 24.1043 7.65546 24.853C8.08769 25.6016 9.04499 25.8581 9.79364 25.4259C10.5423 24.9936 10.7988 24.0363 10.3666 23.2877ZM-0.47798 17.0265C-1.34246 17.0265 -2.04324 17.7273 -2.04324 18.5918C-2.04324 19.4563 -1.34246 20.1571 -0.47798 20.1571C0.386494 20.1571 1.08731 19.4563 1.08731 18.5918C1.08731 17.7273 0.386494 17.0265 -0.47798 17.0265Z" ] []
                , path [ fill cfg.tendrils, d "M11.4563 6.39175C10.7076 6.82398 10.4511 7.78129 10.8834 8.52995C11.3156 9.2786 12.2729 9.53511 13.0216 9.10287C13.7702 8.67064 14.0267 7.71333 13.5945 6.96467C13.1623 6.21602 12.2049 5.95951 11.4563 6.39175Z" ] []
                , path [ fill cfg.tendrils, d "M10.3666 23.2877L7.65546 24.853C9.89233 28.7273 14.0262 31.114 18.5 31.114V27.9835C15.1447 27.9835 12.0442 26.1935 10.3666 23.2877ZM7.65546 24.853C8.08769 25.6016 9.04499 25.8581 9.79364 25.4259C10.5423 24.9936 10.7988 24.0363 10.3666 23.2877C9.93435 22.539 8.97703 22.2825 8.22837 22.7148C7.47971 23.147 7.22321 24.1043 7.65546 24.853ZM18.5 31.114C19.3645 31.114 20.0652 30.4132 20.0652 29.5488C20.0652 28.6843 19.3645 27.9835 18.5 27.9835C17.6355 27.9835 16.9347 28.6843 16.9347 29.5488C16.9347 30.4132 17.6355 31.114 18.5 31.114Z" ] []
                , path [ fill cfg.tendrils, d "M10.3666 -8.01774L7.65544 -9.58302C5.41857 -5.70865 5.41854 -0.935271 7.65541 2.93911L10.3665 1.37384C8.68888 -1.53194 8.68891 -5.11197 10.3666 -8.01774ZM7.65544 -9.58302C7.22321 -8.83436 7.4797 -7.87703 8.22835 -7.4448C8.97701 -7.01257 9.93433 -7.26909 10.3666 -8.01774C10.7988 -8.7664 10.5423 -9.7237 9.79363 -10.1559C9.04497 -10.5882 8.08767 -10.3317 7.65544 -9.58302ZM7.65541 2.93911C8.08764 3.68777 9.04497 3.94429 9.79362 3.51205C10.5423 3.07982 10.7988 2.12249 10.3665 1.37384C9.9343 0.62518 8.977 0.368677 8.22835 0.80092C7.47969 1.23315 7.22317 2.19045 7.65541 2.93911Z" ] []
                ]

        cell2 =
            g []
                [ path [ fill cfg.cell2, d "M18.5 -0.191418V2.93912C20.7369 2.93912 22.8038 1.74576 23.9223 -0.191418L21.2111 -1.75669C20.6519 -0.788103 19.6184 -0.191418 18.5 -0.191418ZM18.5 2.93912C19.3645 2.93912 20.0653 2.23832 20.0653 1.37385C20.0653 0.509374 19.3645 -0.191418 18.5 -0.191418C17.6355 -0.191418 16.9347 0.509374 16.9347 1.37385C16.9347 2.23832 17.6355 2.93912 18.5 2.93912ZM23.9223 -0.191418C24.3545 -0.940073 24.098 -1.89738 23.3493 -2.32962C22.6007 -2.76185 21.6434 -2.50535 21.2111 -1.75669C20.7789 -1.00804 21.0354 -0.0507262 21.7841 0.381505C22.5327 0.813736 23.49 0.557238 23.9223 -0.191418Z" ] []
                , path [ fill cfg.cell2, d "M15.789 -1.75669L13.0778 -0.191412C14.1963 1.74578 16.2631 2.93912 18.5 2.93912V-0.191418C17.3816 -0.191418 16.3482 -0.788085 15.789 -1.75669ZM13.0778 -0.191412C13.5101 0.557243 14.4674 0.813754 15.216 0.38151C15.9647 -0.0507211 16.2212 -1.00803 15.789 -1.75669C15.3567 -2.50534 14.3994 -2.76185 13.6507 -2.32961C12.9021 -1.89738 12.6456 -0.940068 13.0778 -0.191412ZM18.5 2.93912C19.3645 2.93912 20.0653 2.23832 20.0653 1.37385C20.0653 0.509374 19.3645 -0.191418 18.5 -0.191418C17.6355 -0.191418 16.9347 0.509374 16.9347 1.37385C16.9347 2.23832 17.6355 2.93912 18.5 2.93912Z" ] []
                ]

        cell1 =
            g
                []
                [ path [ fill cfg.cell1, d "M2.23312 6.0697L4.94425 4.50443C3.82582 2.56724 1.75886 1.37389 -0.478011 1.37389V4.50443C0.640418 4.50443 1.67391 5.1011 2.23312 6.0697ZM4.94425 4.50443C4.51202 3.75577 3.55472 3.49927 2.80606 3.93151C2.05741 4.36374 1.80088 5.32105 2.23312 6.0697C2.66536 6.81836 3.62268 7.07488 4.37134 6.64263C5.11999 6.2104 5.37649 5.25308 4.94425 4.50443ZM-0.478011 1.37389C-1.34249 1.37389 -2.04327 2.0747 -2.04327 2.93918C-2.04327 3.80365 -1.34249 4.50443 -0.478011 4.50443C0.386464 4.50443 1.08728 3.80365 1.08728 2.93918C1.08728 2.0747 0.386464 1.37389 -0.478011 1.37389Z" ] []
                , path [ fill cfg.cell1, d "M2.23307 9.20018L4.9442 10.7655C6.06262 8.82827 6.06268 6.44161 4.94425 4.50443L2.23312 6.0697C2.79234 7.03829 2.79229 8.23159 2.23307 9.20018ZM4.9442 10.7655C5.37643 10.0168 5.11994 9.05949 4.37128 8.62726C3.62263 8.19503 2.6653 8.45152 2.23307 9.20018C1.80084 9.94884 2.05735 10.9062 2.80601 11.3384C3.55467 11.7706 4.51196 11.5141 4.9442 10.7655ZM4.94425 4.50443C4.51202 3.75577 3.55472 3.49927 2.80606 3.93151C2.05741 4.36374 1.80088 5.32105 2.23312 6.0697C2.66536 6.81836 3.62268 7.07488 4.37134 6.64263C5.11999 6.2104 5.37649 5.25308 4.94425 4.50443Z" ] []
                , path [ fill cfg.cell1, d "M-0.477996 10.7655V13.896C1.75887 13.896 3.82575 12.7026 4.9442 10.7655L2.23307 9.20018C1.67386 10.1688 0.640433 10.7655 -0.477996 10.7655ZM-0.477996 13.896C0.386479 13.896 1.08728 13.1952 1.08728 12.3308C1.08728 11.4663 0.386479 10.7655 -0.477996 10.7655C-1.34247 10.7655 -2.04327 11.4663 -2.04327 12.3308C-2.04327 13.1952 -1.34247 13.896 -0.477996 13.896ZM4.9442 10.7655C5.37643 10.0168 5.11994 9.05949 4.37128 8.62726C3.62263 8.19503 2.6653 8.45152 2.23307 9.20018C1.80084 9.94884 2.05735 10.9062 2.80601 11.3384C3.55467 11.7706 4.51196 11.5141 4.9442 10.7655Z" ] []
                ]

        cell3 =
            g
                []
                [ path [ fill cfg.cell3, d "M21.2111 17.0265L23.9222 15.4613C22.8038 13.5241 20.7369 12.3307 18.5 12.3307V15.4613C19.6184 15.4613 20.6519 16.0579 21.2111 17.0265ZM23.9222 15.4613C23.49 14.7126 22.5327 14.4561 21.7841 14.8884C21.0354 15.3206 20.7789 16.2779 21.2111 17.0265C21.6433 17.7752 22.6007 18.0317 23.3493 17.5995C24.098 17.1672 24.3545 16.2099 23.9222 15.4613ZM18.5 12.3307C17.6355 12.3307 16.9347 13.0315 16.9347 13.896C16.9347 14.7605 17.6355 15.4613 18.5 15.4613C19.3645 15.4613 20.0653 14.7605 20.0653 13.896C20.0653 13.0315 19.3645 12.3307 18.5 12.3307Z" ] []
                , path [ fill cfg.cell3, d "M21.2111 20.1571L23.9222 21.7224C25.0407 19.7852 25.0407 17.3984 23.9222 15.4613L21.2111 17.0265C21.7703 17.9951 21.7703 19.1885 21.2111 20.1571ZM23.9222 21.7224C24.3545 20.9737 24.098 20.0164 23.3493 19.5842C22.6007 19.1519 21.6433 19.4085 21.2111 20.1571C20.7789 20.9058 21.0354 21.8631 21.784 22.2953C22.5327 22.7275 23.49 22.471 23.9222 21.7224ZM23.9222 15.4613C23.49 14.7126 22.5327 14.4561 21.7841 14.8884C21.0354 15.3206 20.7789 16.2779 21.2111 17.0265C21.6433 17.7752 22.6007 18.0317 23.3493 17.5995C24.098 17.1672 24.3545 16.2099 23.9222 15.4613Z" ] []
                , path [ fill cfg.cell3, d "M18.5 21.7224V24.8529C20.7369 24.8529 22.8038 23.6596 23.9222 21.7224L21.2111 20.1571C20.6519 21.1257 19.6184 21.7224 18.5 21.7224ZM18.5 24.8529C19.3645 24.8529 20.0653 24.1521 20.0653 23.2877C20.0653 22.4232 19.3645 21.7224 18.5 21.7224C17.6355 21.7224 16.9347 22.4232 16.9347 23.2877C16.9347 24.1521 17.6355 24.8529 18.5 24.8529ZM23.9222 21.7224C24.3545 20.9737 24.098 20.0164 23.3493 19.5842C22.6007 19.1519 21.6433 19.4085 21.2111 20.1571C20.7789 20.9058 21.0354 21.8631 21.784 22.2953C22.5327 22.7275 23.49 22.471 23.9222 21.7224Z" ] []
                , path [ fill cfg.cell3, d "M15.7889 20.1571L13.0778 21.7224C14.1963 23.6596 16.2631 24.8529 18.5 24.8529V21.7224C17.3816 21.7224 16.3482 21.1257 15.7889 20.1571ZM13.0778 21.7224C13.5101 22.4711 14.4674 22.7276 15.216 22.2953C15.9647 21.8631 16.2212 20.9058 15.7889 20.1571C15.3567 19.4085 14.3994 19.152 13.6507 19.5842C12.9021 20.0164 12.6456 20.9738 13.0778 21.7224ZM18.5 24.8529C19.3645 24.8529 20.0653 24.1521 20.0653 23.2877C20.0653 22.4232 19.3645 21.7224 18.5 21.7224C17.6355 21.7224 16.9347 22.4232 16.9347 23.2877C16.9347 24.1521 17.6355 24.8529 18.5 24.8529Z" ] []
                , path [ fill cfg.cell3, d "M15.7888 17.0266L13.0777 15.4613C11.9592 17.3985 11.9594 19.7852 13.0778 21.7224L15.7889 20.1571C15.2297 19.1886 15.2296 17.9951 15.7888 17.0266ZM13.0777 15.4613C12.6454 16.2099 12.9019 17.1673 13.6506 17.5995C14.3992 18.0317 15.3565 17.7752 15.7888 17.0266C16.221 16.2779 15.9645 15.3206 15.2158 14.8884C14.4672 14.4561 13.5099 14.7126 13.0777 15.4613ZM13.0778 21.7224C13.5101 22.4711 14.4674 22.7276 15.216 22.2953C15.9647 21.8631 16.2212 20.9058 15.7889 20.1571C15.3567 19.4085 14.3994 19.152 13.6507 19.5842C12.9021 20.0164 12.6456 20.9738 13.0778 21.7224Z" ] []
                , path [ fill cfg.cell3, d "M18.5 15.4613V12.3307C16.2631 12.3307 14.1961 13.5241 13.0777 15.4613L15.7888 17.0266C16.348 16.058 17.3816 15.4613 18.5 15.4613ZM18.5 12.3307C17.6355 12.3307 16.9347 13.0315 16.9347 13.896C16.9347 14.7605 17.6355 15.4613 18.5 15.4613C19.3645 15.4613 20.0653 14.7605 20.0653 13.896C20.0653 13.0315 19.3645 12.3307 18.5 12.3307ZM13.0777 15.4613C12.6454 16.2099 12.9019 17.1673 13.6506 17.5995C14.3992 18.0317 15.3565 17.7752 15.7888 17.0266C16.221 16.2779 15.9645 15.3206 15.2158 14.8884C14.4672 14.4561 13.5099 14.7126 13.0777 15.4613Z" ] []
                ]

        background =
            rect [ width "24", height "24", rx "4", fill cfg.background ] []
    in
    -- the background rect provides both background color and boundary in the form of the mask hence its double usage
    svg [ width "24", height "24", viewBox "0 0 24 24", fill "none" ]
        [ mask [ id "hashvatar-mask", style "mask-type: alpha", maskUnits "userSpaceOnUse", x "0", y "0", width "24", height "24" ]
            [ background ]
        , g [ Attrs.mask "url(#hashvatar-mask)" ]
            [ background
            , tendrils
            , cell1
            , cell2
            , cell3
            ]
        ]
