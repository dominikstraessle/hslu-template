#context {
  if query(figure.where(kind: raw)).len() > 0 {
    // TODO Needed, because context creates empty pages with wrong numbering
    set page(
      numbering: "i",
    )
    heading("Auflistungsverzeichnis", numbering: none)
    outline(
      title: none,      
      indent: true,
      fill: repeat(text(". ")),
      target: figure.where(kind: raw),
    )
  }
}