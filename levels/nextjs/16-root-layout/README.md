# browser overlay: "Missing <html> and <body> tags in the root layout"
"After a layout cleanup every page shows a red error overlay in the browser. curl still gets 200, but the HTML validator says the document has no `<html>`/`<body>` and the `lang` attribute is gone."
App: `~/.k8s-wargame/nextjs/app`. Goal: pages are served as a full document — `<html lang="de">` and `<body>` present, header and nav still rendered.
