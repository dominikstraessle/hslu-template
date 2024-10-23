#import "../dependencies.typ": register-glossary

#let abbr-entry-list = (
  (
    key: "cpu", 
    short: "CPU",
    long: "Central Processing Unit"
  ),
)

#register-glossary(abbr-entry-list)

#let glossary-entry-list = (
  (
    key: "freedom", 
    short: "freedom",
    description: "Freedom is the power or right to speak, act and change as one wants without hindrance or restraint. Freedom is often associated with liberty and autonomy in the sense of \"giving oneself one's own laws\""
  ),
)

#register-glossary(glossary-entry-list)
