const fs = require("fs");
const xml = require("node-xml");

// delete old apps
require("rimraf").sync("_apps/*");

// download xml data
require('https').get('https://f-droid.org/repo/index.xml', (res) => {
  let data = '';
  let time1 = (new Date()).getTime();
  let time2;

  res.on('data', (chunk) => {
    data += chunk;
  });
  res.on('end', () => {
    const apps = [];

    let currentApp;
    let property;

    // get apps by parsing the xml
    new xml.SaxParser(function(cb) {
      let isPackage = false;

      cb.onStartElementNS(function(elem, attrs, prefix, uri, namespaces) {
          switch (elem) {
            case "application":
              currentApp = attrs[0][1];
              apps.push({});
              break;

            case "id":
              property = "package";
              break;

            case "added":
              property = "added";
              break;

            case "name":
              property = "title";
              break;

            case "summary":
              property = "summary";
              break;

            case "license":
              property = "license";
              break;

            case "icon":
              property = "icon";
              break;

            case "lastupdated":
              property = "lastupdated";
              break;

            case "package":
              isPackage = true;
              break;
          }
      });
      cb.onEndElementNS(function(elem, prefix, uri) {
        switch (elem) {
          case "package":
            isPackage = false;
            break;
        }
      })
      cb.onCharacters(function(chars) {
        if (property !== undefined && !isPackage) {
          apps[apps.length - 1][property] = chars;
        }
        property = undefined;
      });
    }).parseString(data);

    // create new apps directory if necessary
    if (!fs.existsSync('_apps')) {
      fs.mkdirSync('_apps');
    }

    // create app files
    for (let app of apps) {
      let appData = [
        `---`,
        `layout: app`,
        `permalink: "/repository/apps/${app.package}/"`,
        `redirect_from:`,
        `  - "/app/${app.package}/"`,
        `---`
      ];

      for (let property of ['package', 'title', 'summary', 'license', 'icon', 'added', 'lastupdated']) {
        if (app[property] !== undefined) {
          appData.splice(
            appData.length-1, 0,
            `${property}: "${app[property]}"`
          );
        }
      }

      fs.writeFileSync(`_apps/${app.package}.html`, appData.join('\n'));
    }
  });
});
