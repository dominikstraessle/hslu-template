#import "lib/template.typ": template
#import "dependencies.typ": *

// Take a look at the file `template.typ` in the file panel
// to customize this template and discover how it works.
#show: template.with(
  title: "Einfache Netzanschlussgesuche auf der SGOP entgegennehmen und bewerten",
  thesis-type: "Wirtschaftsprojekt",
  author: "Dominik Strässle",
  department: "Hochschule Luzern Informatik",
  advisor: ("Prof. Dr. René Meier"),
  expert: ("Michael Handschuh"),
  submission-date: datetime(year: 2024, month: 12, day: 20),
  partner: "VIVAVIS Schweiz AG"
)

// Enable glossary
// Use: #gls("key") or #glspl("key") to reference and #print-glossary to print it
// More documentation: https://typst.app/universe/package/glossarium/
#show: make-glossary
#include "glossary/glossary.typ"

// Include chapters of thesis
#pagebreak(weak: true)
#include "chapters/01_Einleitung.typ"
#include "chapters/02_Recherche.typ"
#include "chapters/03_Konzeption.typ"
#include "chapters/04_Methoden.typ"
#include "chapters/05_Realisierung.typ"
#include "chapters/06_Evaluation.typ"
#include "chapters/07_Ausblick.typ"

// Print glossary
#pagebreak(weak: true)
#include "glossary/print.typ"

// Print bibliography
#pagebreak(weak: true)
#bibliography("bib.yaml")
