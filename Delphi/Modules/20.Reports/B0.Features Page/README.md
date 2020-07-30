# Features

This is a real world demo, showing how we create the \"features\" HTML
sheet you can find at

https://www.tmssoftware.com/flexcel/featuresflexcel.htm

## Concepts

- Everything in this demo is shown in more detail somewhere else. This
  is just a showcase of a real application of a FlexCel report, but
  anyway there are some ideas worth noting.

- We use the [Image Fit](https://doc.tmssoftware.com/flexcel/vcl/guides/reports-tag-reference.html#image-fit) tag in the image to autofit the
  containing cell to the height of the image. Bus as we also need to
  autofit the whole row, we need to do an autofit with a \"**Dont
  Shrink**\" option on the rows. If we didn't, when autofitting the
  rows the images would get outside their cells again.

- We use [Intelligent Page Breaks](https://doc.tmssoftware.com/flexcel/vcl/guides/reports-designer-guide.html#intelligent-page-breaks) to have a nice PDF output.

- As we wanted to use Access so we can distribute this demo easily to
  you, we did not store the images in the database. (Access is not
  good at storing images). So we saved the images in a folder, and
  used an **user defined function** to load them and feed the
  report.
