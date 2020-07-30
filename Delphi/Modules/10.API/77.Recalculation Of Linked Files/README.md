# Recalculation of linked files

FlexCel allows complete control over recalculation of linked files. In
this demo, we will show how to create 3 linked files and how to
recalculate them.

## Concepts

- How to create files with formulas that link to other files.

- There are two ways to create a workspace to calculate linked files:

  1. When you know all the files needed in advance, you just add them to
     the workspace before recalculating.

  2. If you don\'t know which files (if any) you are going to need, you
     can use an event to load them on demand. This is the approach we
     use in the [Validate Recalc](https://doc.tmssoftware.com/flexcel/vcl/samples/delphi/api/validate-recalc/index.html) example, since it deals with arbitrary
     files. Whenever you know which files are needed, it is better to
     use the first method.

- **Workspaces can take a lot of memory**. Make sure you free them after recalculating, and also the XlsFiles used in it. If you
  keep the files, those files will point to the workspace even if
  you free it, and it will not be released. You can also
  Clear() the workspace before freeing it to make sure you leave
  no references to it.
