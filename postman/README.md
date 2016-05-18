# Denner Shop API for Postman
[Postman](https://www.getpostman.com/) settings for Denner Shop Web Service.

## How to use it
Following guide applies for:

- [Postman REST client (Packaged App)](https://www.getpostman.com/)
- [Postman REST client (Chrome extension)](https://chrome.google.com/webstore/detail/postman-rest-client/fdmmgilgnpjigdojojpjoooidkmcomcm)

### Initial setup
 
- Remove collection if already present _([see note below](#initial-setup-note))_.
- Import collection:
  - Select "Collections" tab (left menu), click on "Import into Postman" icon.
  - Choose tab "Download from link".
  - Enter collection link ([choose from section below](#collection-data)).
  - Click on "Import" button (once only).
- [Setup/Import environments](#import-environments).
- Choose an environment.
- Run requests.

> <a name="initial-setup-note"></a>Important: If you already have the collection into your Postman application, you should first remove it before import.
> If not, the latest collection (copy) you import will change all collection reference UUID's, making the future commit/merge unreadable.

#### Collection data

Choose the one that best fits the testing situation you need:

- Main GitHub repository | https://raw.githubusercontent.com/detailnet/denner-shop-api-spec/master/postman/collections/denner-shop-api.json
- Local checkout through Protobox | http://denner-shop-api-spec.web01.detailnet.me/postman/collections/denner-shop-api.json

> You can also access different branches on GitHub (replace `master` with the branch name).

#### Import environments

- Go to the environments manager window.
  - Move the mouse pointer over the eye dropdown menu (top bar).
  - Click on "Manage environments"
- Click on "Import" button, choose all files in the project environments directory (all at once).

> There is no direct possibility to import from an URL, but you can use your OS as wrapper. 
> To do so enter an URL instead of a file in the file selection window (e.g.: https://raw.githubusercontent.com/detailnet/denner-shop-api-spec/master/postman/environments/denner-shop-api_apig-test.json).

### Save tool changes back to project/repository

- Move your mouse pointer over the collection name (left menu), click on "Share collection" icon.
- Click on "Download" button.
- Overwrite your local repository's [denner-shop-api.json](collections/denner-shop-api.json) file.
- Review changes with your preferred editor:
  - Replace tabs with 4 whitespaces.
  - Reset owner to original.
  - Commit only modified/added routes through Git.
