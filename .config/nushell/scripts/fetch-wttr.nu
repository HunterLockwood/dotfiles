# a simple nushell command to get the weather from wttr.in.
export def weather [
  --forecast (-f) # return v2 of wttr.in, which includes forecast, a graph & other details.
] {
     if $forecast {
      http get https://v2.wttr.in
     } else {
      http get https://wttr.in/?m&format=%t+%m+%w+%P
     }
}
