# Denner Mobile API Spec

## Data and resources
The Denner Mobile Web Service provides mostly advertising related data.

### Stores

* `/stores` (Filialen, [example](examples/stores.json))
* `/store-channels` (Filialkanäle, [example](examples/store-channels.json))
* `/store-services` (Filialangebote, [example](examples/store-services.json))

### Articles

* `/online-groups` (Internet-Sortimente, [example](examples/groups.json))

### Promotions/Advertising

* `/online-filters` (Angebotsfilter, [example](examples/filters.json))
* `/publications` (Werbemittel, [example](examples/publications.json))

### Wines

* `/wines` (Weine, [example](examples/wines.json))


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
