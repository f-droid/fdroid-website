const fs = require("fs");
const xml = require("node-xml");

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
      cb.onStartElementNS(function(elem, attrs, prefix, uri, namespaces) {
          switch (elem) {
            case "application":
              currentApp = attrs[0][1];
              apps.push({});
              break;

            case "id":
              property = "id";
              break;

            case "added":
              property = "added";
              break;

            case "name":
              property = "name";
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
          }
      });
      cb.onCharacters(function(chars) {
          if (property !== undefined) {
            apps[apps.length - 1][property] = chars;
          }
          property = undefined;
      });
    }).parseString(data);

    // sort by added descending
    apps.sort(function(a, b) {
      return parseInt(b.added.replace(/-/g, '')) - parseInt(a.added.replace(/-/g, ''));
    });

    // save latest 10 apps into json file
    const latestApps = [];
    for (let i = 0; i < 10 && i < apps.length; i++) {
      let app = apps[i];
      latestApps[i] = {
        id: app.id,
        name: app.name,
        summary: app.summary,
        license: app.license,
        icon: app.icon
      };
    }
    fs.writeFile('_data/latest-apps.json', JSON.stringify(latestApps));
  });
});