# InternationalBusinessMen

## Index  
- [Project structure](#project-structure)
- [Dependencies](#dependencies)
- [Project Architecture](#project-architecture)

## Project structure
The project is organized into folders, with the primary ones being:

- **Common**: It contains the reusable styles, components and utils. 
- **Base**: It contains the base classes.
- **Feature**: It contains subfolders of each main functionality, and these has all the necessary files for developing the functionality. See the *Features organization* for more detail.
- **Resources**: It has all the data related to assets and localizable strings.

## Dependencies

It's prefered to include the Dependencies by SPM, if they are not available we include them by CocoaPods. 


## Project Architecture
CLEAN is based in 3 layers (Data, Domain, Presentation/UI). It helps you write better, more organized code and it's also easier to maintain. The data flows like this:

### 📃 DATA
1. **Database** or **API** → It is the part of your code that communicates with a server to get or send data.
2. **DAO** → It stands for Data Access Object. It is the part of your code that handles the data after it's been received from the API ot the database. The DAO is responsible for storing the data in a database, so that it can be retrieved later.
3. **DataSourceImpl** → This class implements the DataSourceProtocol. It is the part of your code that gets the data from the DAO and makes it available to the rest of the code.

The API communicates with the server, the DAO stores the data, and the DataSourceImpl makes the data available to the rest of the code.

### 🔄 DOMAIN
4. **DataSourceProtocol** → It defines the methods that the DAO and DataSourceImpl should implement, so that the rest of the code knows how to get and store data.
5. **UseCase** → Each UseCase has an instance of each DataSource needed, the invoke method, and the business logic.
6. **Models** → Models are the objects that hold the data for your app. It is the object that holds the information received from the API or Database.

The DataSourceProtocol provides a blueprint for handling data, the UseCases define what your app should do, and the Models hold the data for your app.

### 📱 UI
7. **ViewModel** → This is the part of your code that prepares the data for the View to display. It might take the data about a task from the UseCase, format it, and make it ready to display in the View.
8. **View** → It is the part of your code that actually displays the user interface. The View takes the data from the ViewModel.
