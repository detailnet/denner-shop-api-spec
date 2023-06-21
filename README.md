# Denner Shop API Spec

## Data and resources
The Denner Shop Web Service provides data and functions for the Denner Wineshop.

### Wines
* `GET /wines` (Weine, [example response](examples/wines.get.json))
* `GET /wines/{wine_id}/appraisals` (Weinbewertungen, [example response](examples/wine-appraisals.get.json))
* `POST /wines/{wine_id}/appraisals` (Weinbewertungen, [example request](examples/wine-appraisals.post-request.json))
* `POST /wines/{wine_id}/appraisals/{appraisal_id}/votes` (Hoch-/Runterwählen von Weinbewertungen, [example request](examples/wine-appraisal-votes.post-request.json))

### Wine characteristics
* `GET /wine-characteristics` (Wein-Geschmacksprofil, [example response](examples/wine-characteristics.get.json))

### Wine growers
* `GET /wine-growers` (Winzer, [example response](examples/wine-growers.get.json))

### Wine experts
* `GET /wine-experts` (Experte, [example response](examples/wine-experts.get.json))

### Appraisals
* `GET /appraisals` (Weinbewertungen, [example response](examples/wine-appraisals.get.json))

### Other
* `POST /sweepstake-participants` (Gewinnspielteilnehmer, [example request](examples/sweepstake-participants.post-request.json))

## Documentation and Building

To see the documentation page [Swagger UI](https://swagger.io/tools/swagger-ui/) visit  http://denner-shop-api.detailnet.ch/
or for development, start the Docker instance (`lando start`) that presents the static HTML pages in `/docs` directory and
load the page http://denner-shop-apic.detailnet.me.

### Building
To build the specification we're using [swagger-codegen](https://github.com/swagger-api/swagger-codegen).

This project is already setup to build directly through `lando`.

```shell
lando start
lando build-docs
```

The file will be located at `docs/openapi.json`.

**Important: after generation revert the servers section at beginning of `docs/openapi.json`**

You can then review the changes in the [local browser](http://denner-shop-api.detailnet.me/) before commit.


To filter out examples and descriptions execute following (JSON processor needed):
(You should install the JSON processor utility  `sudo npm install -g json`)

        json -e '
          function dropRecursive(obj, objName) {
            if (objName != "properties") {
                delete obj.examples;
                delete obj.example;
                delete obj.description;
                delete obj.summary;
            }
            
            for (var key in obj) {
              if (obj[key] && typeof obj[key] === "object") { 
                dropRecursive(obj[key], key);
              }
            }
          }
          
          dropRecursive(this, 'this');
        ' < docs/openapi.json > docs/openapi.no_texts.json

The file will be located at `docs/openapi.no_texts.json`.

To compress all your JSON data execute following (JSON processor needed):

        json -o json-0 < docs/openapi.no_texts.json > docs/openapi.no_texts.compressed.json

#### HTML
You can also generate a static HTML page:

        java -jar modules/swagger-codegen-cli/target/swagger-codegen-cli.jar generate \
            -i ../denner-shop-api-spec/src/swagger.yml \
            -l html \
            -o ../denner-shop-api-spec/build/html

The file will be located at `build/html/index.html`.



### Preserve AWS API changes

AWS API gateway does a good job with the "Deployment History" but for a better consultation on changes and in case of disaster recovery,
we download in this project the export as "OpenAPI 3 + API Gateway Extensions" after every deployment.

The download is performed with `lando export-api`. (Can be also dane manually through the AWS console)


### Compiling Stylesheets

To compile the stylesheets for the swagger docs, globally install npm sass with `install -g sass` and run sass:

        sass docs/style/main.scss docs/swagger-ui.css --style=compressed

For continuous watch and build during development run:

        sass docs/style/main.scss docs/swagger-ui.css --watch

      
