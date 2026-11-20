// University of Basel – Digital Humanities Lab
// Thesis / Seminar Paper Template by Stefan Freitag
// Native Typst conversion of the supplied LaTeX template, assisted by ChatGPT. Version 1.0. November 19th, 2026
//
// Project structure expected:
//   main.typ
//   bib-template.bib
//   uni-basel-logo-en.png
//   dhlab-logo-black.png
//
// The bibliography uses Typst's native Hayagriva/BibLaTeX-compatible bibliography reader and APA style.

// Set up document metadate, the title affects the name of the final PDF
#set document(
  title: "Paper & Thesis Template, DH Lab, University of Basel",
  author: "Stefan Freitag",
)

// Set up page size and margins
#set page(
  paper: "a4",
  margin: 2.5cm,
)

// Set up font size, family and language
#set text(
  font: "Libertinus Serif",
  size: 12pt,
  lang: "en",
)

// Set up paragraphs
#set par(
  justify: true,
  leading: 0.8em,
)

// Change how headings are numbered
#set heading(numbering: "1.1")

// Hyperlinks are colored blue
#show link: set text(fill: blue)

// ---------------------------------------------------------------------
// Metadata – edit these values for your own paper
// ---------------------------------------------------------------------

#let paper-title = "Thesis / Paper Title"
#let paper-subtitle = "Thesis / Paper Subtitle"
#let author-name = "Firstname Lastname"
#let matriculation-number = "12-345-678"
#let supervisors = "
Prof. Dr. Firstname Lastname 1
Prof. Dr. Firstname Lastname 2"
#let paper-date = "2026-11-01"

// ---------------------------------------------------------------------
// Title page
// ---------------------------------------------------------------------

// Make sure the title page and table of contents are unnumbered
#set page(numbering: none)

#align(center)[
  #v(0.5cm)
  #text(size: 22pt, weight: "bold")[#paper-title]
  
  #text(size: 16pt)[#paper-subtitle]

  #v(0.5cm)
  #text(size: 12pt)[
    #author-name \
    Mat No.: #matriculation-number \
    
    Supervisor(s): #supervisors
  ]

  #v(0.35cm)
  #paper-date

  #v(0.5cm)
  #line(length: 100%, stroke: 0.5pt + gray)

  // Abstract appears on the cover page
  #v(0.5cm)
  #text(size: 14pt, weight: "bold")[Abstract]
  #v(0.2cm)
  #set par(justify: true, leading: 0.8em)
  This is the Typst template from the DH Lab of the University of Basel. It is suitable for seminar papers and Master's / PhD theses, but can be adapted to fit a variety of use cases. It was created by Stefan Freitag and is derived from the LaTeX template, which is also available from the DH Lab.

  The abstract of your paper / thesis goes right here. It will appear on the cover sheet (very first page of the PDF), together with the title, subtitle, author name and date.

  If you do not want your document to have an abstract, you can delete this abstract block (or comment it out) and the final document will be created without it.

// Logos and text are anchored to the bottom of the page and do not move if the abstract text is changed
#place(
  bottom,
  block(width: 100%)[
    #grid(
      columns: (1fr, 1fr),
      column-gutter: -4cm,
      align: center,
      image("uni-basel-logo-en.png", width: 40%),
      image("dhlab-logo-black.png", width: 40%),
    )

    #v(0.5cm)
    #align(center)[
      University of Basel \
      Digital Humanities Lab \
      Switzerland
    ]
  ]
)
]

#pagebreak()

// ---------------------------------------------------------------------
// Table of contents
// ---------------------------------------------------------------------

#set par(leading: 0.8em)
#outline(
  title: [Table of Contents],
  depth: 5,
  indent: auto,
)

#pagebreak()

// Main text starts at page 1
#counter(page).update(1)
#set page(numbering: "1")

// ---------------------------------------------------------------------
// Main document content
// ---------------------------------------------------------------------

= The Basics

What is Typst? Similarly to LaTeX, Typst is, in short, a language that describes both content *and* layout of a text, as opposed to regular word processors like *Microsoft Word*. It is a very powerful tool for scientific publication and, when used correctly, gives you almost infinite control over the layout of your document and makes it look very professional.

*Note:* This is *not* a guide on how to write a paper / thesis. If you need guidance on those topics, check the appropriate DH Lab #link("https://dhlab.philhist.unibas.ch/en/master-course/seminar-masterarbeit-masterpruefung/")[resources] or ask a supervisor.

Instead, this template is meant to introduce you to what Typst can do and give you a starting point to use it on your own. While it is of course possible to install Typst locally and use it this way (for example via VS Code), it is recommended to use it via the #link("https://typst.app/")[Typst website], an editor that requires no installation and runs completely in the browser. This has multiple benefits over a local install: It works regardless of your device and your document and its associated files are always up to date and secure. All in all, it is clearly the most convenient and easy way to use Typst. This of course requires an internet connection to be used, which might be a downside to you.

*Note:* As Overleaf takes a long time to compile LaTeX documents and has a very short compile time limit for its free plan, it can time out on bigger projects, resulting in an error. Typst mostly avoids this due it compiling in near real-time.

If you have questions that are not addressed within this template, Typst offers #link("https://typst.app/docs/tutorial/")[tutorials] on nearly everything as well as a comprehensive #link("https://typst.app/docs/")[documentation] to help you understand how it works. This is also where you can find information that goes much more in-depth than is possible here. If all else fails, you can also ask an LLM of your choice. From experience, they struggle a bit more with Typst than they do with LaTeX. As Typst gains traction and is used more, this should improve in the future. As you can already see in this chapter, you can put clickable links (highlighted in blue) in your document.

= Structure of a document

The most important file when using Typst is your `.typ` file. This is the file in which you write the text for your paper / thesis, while also describing its layout.

In contrast to LaTeX, Typst documents do not have a dedicated preamble. However, similarly to writing Python code, it is considered best practice to set up the document (margins, font etc.) and import needed packages before the content of the document starts. Have a look at the beginning of this ``.typ`` file, where you will see how it's set up and what settings are used. You can of course change and expand this to your liking and adapt it to your needs. Images, links, references, code etc. can be embedded within the document and will be rendered when the document is compiled. Pages are auto-numbered, starting after the table of contents.

Segmenting your document into sections and subsections works like this:

== This is a section

=== This is a sub-section

==== This is a sub-sub-section

===== This is a paragraph

====== This is a sub-paragraph

Typst does not limit the amount of sublevels. So in theory, they could go as deep as you want.

By default, the sections are numbered automatically. This of course can be changed by you. The table of contents will be automatically generated upon compiling your document. *You do not need to write it yourself.*

= Formatting your document

Like LaTeX, Typst supports a variety of formatting options, although the syntax is different and much simpler:

You can write in _italics_.

Or *bold*.

*_Or both at the same time._*

You can also superscript#super("text") or subscript#sub("text").

You can also write lists (unordered or ordered):

- Example list
- This one is unordered in the form of bullet points
  - Lists can also have sublists
    - And sub-sublists

#v(0.5cm)

1. This
2. is
3. an
4. ordered
5. list

and use tables (with various formatting options, this is just an example):

#figure(
  table(
    columns: 3,
    inset: 8pt,
    align: center,
    stroke: 0.5pt,
    [*Col1*], [*Col2*], [*Col3*],
    [1], [2], [3],
    [2], [3], [4],
    [3], [4], [5],
    [4], [5], [6],
    [5], [6], [7],
  ),
  caption: [Example table],
)

This is a more complex table, but it shows what is theoretically possible. As you can see, the tables are automatically numbered as well, as long as you give them a caption.

It is possible to automatically generate a list of tables at any point of the document. To do this, use:

```typ
#outline(
  title: [List of Tables],
  target: figure.where(kind: table),
)
```

#outline(
  title: [List of Tables],
  target: figure.where(kind: table),
)

You can also insert page breaks like this:

```typ
#pagebreak()
```

= Using images <using-images>

With Typst, images are embedded within the text with a caption and a path to the image. This requires the images to be a part of your project and uploaded to Typst. In this template, all images go into the `assets` folder and are loaded from there.

This is how an image is inserted into the document:

#figure(
  image("dhlab-logo-black.png", width: 100%),
  caption: [Logo of the DH Lab],
) <logo-full>

You can also resize images:

#figure(
  image("dhlab-logo-black.png", width: 50%),
  caption: [Logo of the DH Lab, but smaller],
) <logo-small>

As you can see, images with captions are numbered automatically. Like with tables, it is possible to generate a list of figures at any point of the document. To do this, use:

```typ
#outline(
  title: [List of Figures],
  target: figure.where(kind: image),
)
```

#outline(
  title: [List of Figures],
  target: figure.where(kind: image),
)

= Using code

When writing a paper or thesis in the field of Digital Humanities, it is likely that you will need to also use code within your document. This is possible with Typst, if you are working with a lot of code however and / or want it to be executable within the document file, it is recommended to use the #link("(https://github.com/SteFre95/Digital_Humanities_Lab_UniBas_Quarto_Template")[Quarto template] of the DH Lab instead. This also enables you to easily include the output of your code in a document. It is, however, more complex to set up, get running and work with.

In order to properly display code including syntax highlighting, this template uses Typst's native raw blocks, which support syntax highlighting:

```python
# This is a Python code cell written and highlighted with Typst's native raw blocks

for n in range(3):
    print('This is an example for a Python code cell')
```

Keep in mind that you need to manually include the output of the code in the document, should this be important to you. The Typst compile process does *not* run the code in any way.

= Citations and References

Citations and references to literature and other things work like this:

Authors X and Y say a lot of things about many topics @abdullahlajamPerformanceEvaluationIPFS2021.

These guys also talk about interesting stuff on certain pages @alniamyAttributebasedAccessControl2020.

You can also do citations that flow naturally with the text, like this: According to #cite(<abdullahlajamPerformanceEvaluationIPFS2021>, form: "prose"), topic X is really cool.

This style of citation (footnotes) is also possible#footnote[This guy @gauthierReligionModernityGlobalisation2019 also talks about stuff].

The same without further text in the footnote#footnote[@gauthierReligionModernityGlobalisation2019].

You can also reference other (sub) chapters from your document#footnote[See for example @using-images]. This goes backwards *and* forwards, so you can reference chapters after the current one, like this#footnote[See @exporting-your-document]. For this to work, the sections that are referenced must be labeled correctly, like this:

```typ
= Using images <using-images>
```

If you simply create the section without the label (the part inside the ``<...>``), referencing it this way within the document will not work.

The way references are formatted in the final document depends on the chosen style in the document bibliography configuration. This template uses APA style.

Citations and references using literature are handled by the `.bib` bibliography file within the `assets` folder. It contains all your literature (in BibTeX format), which can then be referenced within the text.

It is also possible to link your Typst account to *Zotero* and organise your bibliography this way. See #link("https://typst.app/docs/web-app/reference-sync/")[here] for further details. Keep in mind that this is unfortunately a premium function and therefore requires a Typst Pro subscription.

The References section in the document is generated automatically, when called with the `#bibliography` command. By default, it only includes literature that is actually referenced within the text. This behavior can be changed by you, should you wish to do so.

= Exporting your document <exporting-your-document>

Exporting your final document with Typst is really easy: Simply compile it one final time to get the most up-to-date version and export the PDF. Just like that, it is on your device and ready to be handed in :)

#pagebreak()

// The bibliography file is expected at this path.
// APA is a built-in Typst bibliography style.
#bibliography("bib-template.bib", title: "References", style: "apa")
