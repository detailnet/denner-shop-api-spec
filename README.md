# Denner Shop API Spec

## Data and resources
The Denner Shop Web Service provides data and functions for the Denner Wineshop.

### Wines

* `GET /wines/{id}/appraisals` (Weinbewertungen, [example](examples/wine-appraisals.json))
* `POST /wines/{id}/appraisals` (Weinbewertungen, [example request](examples/wine-appraisals.post-request.json))

### Other

* `POST /sweepstake-participants` (Gewinnspielteilnehmer, [example request](examples/sweepstake-participants.post-request.json))

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
            -i ../denner-shop-api-spec/src/swagger.yml \
            -l swagger \
            -o ../denner-shop-api-spec/build/swagger
        
The file will be located at `build/swagger/swagger.json`.

#### HTML
You can also generate a static HTML page:

        java -jar modules/swagger-codegen-cli/target/swagger-codegen-cli.jar generate \
            -i ../denner-shop-api-spec/src/swagger.yml \
            -l html \
            -o ../denner-shop-api-spec/build/html
            
The file will be located at `build/html/index.html`.
