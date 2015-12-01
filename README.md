# Denner Mobile API Spec

## Data and resources
The Denner Mobile Web Service provides data and functions for the Denner Mobile Apps.

### Stores

* `/stores` (Filialen, [example](examples/stores.json))
* `/store-channels` (Filialkanäle, [example](examples/store-channels.json))
* `/store-services` (Filialangebote, [example](examples/store-services.json))
* `/store-filters` (Filter)

### Promotions

* `/featured-articles` (Startseitenartikel)
* `/online-filters` (Angebotsfilter, [example](examples/online-filters.json))
* `/online-filters/{id}/online-publications` (Werbemittel, [example](examples/online-publications.json))
* `/online-filters/{id}/online-groups` (Internet-Sortimente), [example](examples/online-groups.json))

### Wines

* `/wines` (Weine)
* `/wine-filters` (Filter)
* `/wines/{id}/appraisals` (Weinbewertungen)

### Banners

* `/banners` (Banner)


## Building

### Protobox
To build the specification we're using [swagger-codegen](https://github.com/swagger-api/swagger-codegen).

Run the following commands in [Protobox](https://bitbucket.org/detailnet/protobox) to install it (and it's dependencies):

        sudo apt-get install maven
        sudo apt-get install openjdk-7-jdk
        git clone git@github.com:swagger-api/swagger-codegen.git
        cd swagger-codegen
        mvn package

#### JSON
Once installed, `swagger.json` can be generated as follows:

        java -jar modules/swagger-codegen-cli/target/swagger-codegen-cli.jar generate \
            -i ../denner-mobile-api-spec/src/swagger.yml \
            -l swagger \
            -o ../denner-mobile-api-spec/build/swagger
        
The file will be located at `build/swagger/swagger.json`.

#### HTML
You can also generate a static HTML page:

        java -jar modules/swagger-codegen-cli/target/swagger-codegen-cli.jar generate \
            -i ../denner-mobile-api-spec/src/swagger.yml \
            -l html \
            -o ../denner-mobile-api-spec/build/html
            
The file will be located at `build/html/index.html`.
