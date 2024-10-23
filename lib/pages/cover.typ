#let cover_page(
  title: "",
  author: "",
  department: "",
  advisor: (),
  expert: (),
  thesis-type: "",
  submission-date: none,
  partner: ""
) = {
  // Set the document's basic properties.
  set page(
    margin: (left: 0mm, right: 0mm, top: 0mm, bottom: 0mm),
    numbering: none,
    number-align: center,
  )

  // HAW Logo
  place(
    top + right,
    dx: -13mm,
    dy: 10mm,
    image("../assets/logo.svg", width: 164pt)
  )

  // Title etc.
  pad(
    left: 30mm,
    top: 80mm,
    right: 18mm,
    stack(
      // Type
      upper(text(thesis-type, size: 9pt, weight: "bold")),
      v(4mm),
      text(department, size: 12pt),
      v(4mm),
      text(submission-date.display("[day].[month].[year]"), size: 12pt),
      v(8mm),
      // Title
      par(
        leading: 9pt,
        text(title, size: 31pt, weight: 500, font: "New Computer Modern"),
      ),
      v(5mm),
      line(start: (0pt, 0pt), length: 30pt, stroke: 1mm),
    )
  )

  pad(
    left: 30mm,
    top: 115mm,
    right: 18mm,
    terms(
        [/ Autor: #author],
        [/ Betreuer: #advisor],
        [/ Experte: #expert],
        [/ Industriepartner: #partner]
      ),
  )
}