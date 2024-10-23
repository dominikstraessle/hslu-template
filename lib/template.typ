#let template(
  title: "",
  thesis-type: "",

  author: "",
  department: "",
  advisor: (),
  expert: (),
  submission-date: none,
  body,
  partner: ""
) = {
  let HEADING_1_TOP_MARGIN = 104pt
  let PAGE_MARGIN_TOP = 37mm

  // Set the document's basic properties.
  set document(author: author, title: title, date: submission-date)
  set page(
    margin: (left: 31.5mm, right: 31.5mm, top: PAGE_MARGIN_TOP, bottom: 56mm),
    numbering: "1",
    number-align: right,
    binding: left,
    header-ascent: 24pt,
    header:  context {
      // Before
      let selector_before = selector(heading.where(level: 1)).before(here())
      let level_before = counter(selector_before)
      let headings_before = query(selector_before)

      if headings_before.len() == 0 {
        return
      }

      // After
      let selector_after = selector(heading.where(level: 1)).after(here())
      let level_after = counter(selector_after)
      let headings_after = query(selector_after)

      if headings_after.len() == 0 {
        return
      }

      // Get headings
      let heading_before = headings_before.last()
      let heading_after = headings_after.first()

      // Decide on heading
      let heading = heading_before
      let level = level_before

      if heading_after.location().page() == here().page() {
        if heading_after.location().position().y == (HEADING_1_TOP_MARGIN + PAGE_MARGIN_TOP) or heading_after.location().position().y == PAGE_MARGIN_TOP {
          // Next header is first element of page
          return
        } else {
          heading = heading_after
          level = level_after
        }
      }

      set text(size: 11.5pt)
      grid(
        rows: 2,
        gutter: 5pt,
        if heading.numbering != none { 
          emph(level.display() + " " + heading.body)
        } else {
          emph(heading.body)
        },
        line(length: 100%, stroke: 0.7pt),
      )
    }
  )
  set par(leading: 9pt)
  set text(font: "New Computer Modern", lang: "de", size: 10.85pt)
  set heading(
    numbering: "1.1", 
  )
  // Configure correct spacing between headings and headings or paragraphs
  show heading: h => {
    let top_margin = 0pt   
    let bottom_margin = 0pt
    let text_counter = text(counter(heading).display())
    let text_body = text(h.body)

    if h.level == 1 {
      text_counter = text(counter(heading).display(), font: "New Computer Modern", size: 21pt, weight: 600)
      text_body = text(h.body, font: "New Computer Modern", size: 21pt, weight: 600)

      // New page if configured
      pagebreak(weak: true)
      top_margin = HEADING_1_TOP_MARGIN
  

      bottom_margin = 20pt
    } else if h.level == 2 {
      text_counter = text(counter(heading).display(), size: 14pt)
      text_body = text(h.body, size: 14pt)

      top_margin = 20pt
      bottom_margin = 20pt
    } else {
      text_counter = text(counter(heading).display(), size: 9pt)
      text_body = text(h.body, size: 10pt)

      top_margin = 20pt
      bottom_margin = 20pt
    }

    // Draw headings
    v(top_margin)
    if h.numbering != none {
      grid(
        columns: 2,
        gutter: 10pt,
        text_counter,
        text_body
      )
    } else {
      text_body
    }
    v(bottom_margin)
  }

  // Cover
  import "pages/cover.typ": cover_page
  cover_page(
    title: title,
    author: author,
    department: department,
    thesis-type: thesis-type,
    advisor: advisor,
    expert: expert,
    submission-date: submission-date,
    partner: partner
  )

  page(background: image("pages/Deckblatt.svg"))[]

  // Table of contents.
  import "pages/outline.typ": outline_page
  outline_page()

  // List of Figures
    include "pages/list_of_figures.typ"

  // List of Tables
    include "pages/list_of_tables.typ"

  // Listings
    include "pages/listings.typ"

  // Reset page numbering and set it to numbers
  set page(
    numbering: "1",
  )
  counter(page).update(1)

  // Main body.
  set par(justify: true)

  body
}
