// Style outline as LaTeX "Table of contents".
#let style-outline(it) = {
	// Use spacing to group header level 1 entries.
	show outline.entry.where(level: 1): set block(above: 1.5em)

	// Use bold text for header level 1 entries.
	show outline.entry.where(level: 1): set text(weight: "bold")

	// Skip dots between section title and page number for header level 1.
	show outline.entry.where(level: 1): set outline.entry(fill: none)

	// Increase gap between dots for other header levels.
	set outline.entry(fill: pad(left: 0.2em, right: 1em, repeat(gap: 0.50em, [.])))

	// Increase spacing between section number and section title.
	show outline.entry: it => link(
		it.element.location(),
		if it.prefix() == none {
			it.indented(none, it.inner())
		} else {
			it.indented(it.prefix() + h(0.4em), it.inner())
		},
	)

	it
}

// make-title displays the title, authors and date as specified by the
// corresponding document metadata variables.
#let make-title() = context {
	let authors = document.author
	let date = none
	if document.date == auto {
		date = datetime.today()
	} else if document.date != none {
		date = document.date
	}
	show title: set text(weight: "regular")
	v(1.7cm)
	align(center)[
		#block(
			below: 3em,
			title()
		)
		#if authors.len() > 0 {
			block(
				below: 2.3em,
				text(size: 1.3em)[#authors.join(",", last: " and ")]
			)
		}
		#if date != none {
			block(
				below: 2.1em,
				text(size: 1.3em)[#date.display()]
			)
		}
	]
}

// abstract displays an abstract block.
#let abstract(body, title: "Abstract") = {
	set par(
		justify: true,
		first-line-indent: (amount: 1.5em, all: true),
		leading: 0.55em, // adjust line height
		spacing: 0.55em, // no space between paragraphs
	)
	block(
		inset: (x: 1.07cm),
	)[
		#align(center,
			block(
				below: 1.45em,
				strong[#title]
			)
		)

		#body
	]
}
