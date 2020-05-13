# Images

Inserting images from a database on a FlexCel report is simple, just
insert a blank image and name it as \<\#table.field\>. All the
complexity is handled by FlexCel. But when you need more options, there
are always things you can do.

## Concepts

- Using the [Image Size](https://download.tmssoftware.com/flexcel/doc/vcl/guides/reports-tag-reference.html#image-size) (**\<\#IMGSIZE(Zoom, AspectRatio)\>**) tag. This tag only works
  when written on an image name, and allows you to define which size
  the inserted image will have. Use this tag only if the image
  dimension changes on the database. If all images are the same size
  (most common scenario) just set the size of the image at design
  time, as it is faster.

- Using an Alias on the config sheet. As the image name has a small
  length, we defined the report variables **\<\#Photo\>**, **\<Photo100\>**,
  etc. on the config sheet.

- Using the **ImgPos**, **ImgFit** and **ImgDelete** tags. On the
  second sheet of this report you can see those tags in action.

- Using the [TFlexCelReport.GetImageData](https://download.tmssoftware.com/flexcel/doc/vcl/api/FlexCel.Report/TFlexCelReport/GetImageData.html) event. 
  This is a last resort option. If
  you need to do some further processing on the image, you can do it
  on this event. The preferred order of option then is:

   1. If all images are the same size and on a standard format, just
   name the image as \<\#table.field\> and do nothing more.

   2. If you need to adjust dynamically the image dimensions, use
   [Image Size](https://download.tmssoftware.com/flexcel/doc/vcl/guides/reports-tag-reference.html#image-size) tag. It can be a little slower than 1, as the image
   has to be processed to calculate its dimensions.

   3. If you need to define a custom image size, or the image is on a
   proprietary format you need to convert, use [TFlexCelReport.GetImageData](https://download.tmssoftware.com/flexcel/doc/vcl/api/FlexCel.Report/TFlexCelReport/GetImageData.html) event.
