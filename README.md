# InternationalBusinessMen
This app was made as a technical test for a company.  Its goal is to show a list of all the products that company X trades, along with the total sales of each product in different currencies. When the user selects a product, the application shows each of the transactions related to that product and a sum of all the transactions transformed into EUR.

## Index  
- [App View](#app-view)
- [Project structure](#project-structure)
- [Project Architecture](#project-architecture)

## App View
#### Simple List View
![Screenshot 2023-02-06 at 19 38 50](https://user-images.githubusercontent.com/72110927/217061665-915c741c-5b2e-4ac2-86e4-db89fb98ddb7.png)
#### Simple Detail View
![Screenshot 2023-02-06 at 19 38 55](https://user-images.githubusercontent.com/72110927/217061676-5aabdbe7-8d35-4ea4-a893-7e4b2cfa541e.png)
#### Generic Error View
![Screenshot 2023-02-06 at 19 28 30](https://user-images.githubusercontent.com/72110927/217061683-4f2d800b-994c-406b-beeb-a7ebc5327234.png)

## Project Structure
The project is organized into folders, with the primary ones being:

- **Common**: It contains the reusable styles, components and utils. In addition, it also has the functions and classes for the api calls. 
- **Coordinator**: It is where all the navigation of the app is managed.
- **Feature**: This part of the app has folders for each main feature, and each folder has all the necessary files for building that feature.
- **Resources**: It has all the data related to assets and localizable strings.

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

The ViewModel communicates with the UseCases and the DataSourceProtocol to get the data it needs, and then prepares it for the View to display.
