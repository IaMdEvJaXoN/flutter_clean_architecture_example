This is a flutter project showing the use of flutter clean architecture principles together with riverpod for state management.
This project is simply for the purpose of showing the project structure and showing dependency injection techniques which are Constructor injection and riverpod injection.
This project mainly focuses on the architecture and integration of riverpod.This is the reason for using a single feature which is UserProfile to avoid a complicated code/dependencies.
This is project can be used when setting up a new project.The folder and file structures remains the same even for larger projects(It is just a basis).

         UNDERSTANDING CLEAN ARCHITECTURE
The folder structure makes the project easier to navigate and maintain.
The primary purpose is to manage dependencies.To minimise chaos via dependency rule whereby dependencies always point inward.Dependencies flow inward that Presentation depends on Domain,Data depends on domain but domain doesn't depend on either making it independent and stable core of the application.
Domain layer holds the rules.The business rules remain unchanged i.e even if you change data source,state management technique etc.It's  isolated from flutter,riverpod,HTTP libraries,databases and UI frameworks.It defines what a user is(Entity),what operations are allowed(repository interface) and what business action should happen(use cases).It does not know where the data comes from. 
Presentation layer is the face of the app.The part the user interacts with.Has the screens,widgets,providers.It handles user input,displaying of data,calling of usecases through providers and reacting to state changes.It never contains business logic or data fetching logic.
Data layer answers the domain's requests.It knows how to call APIs ,read databases,cache data,convert JSON to objects and implement repository contracts.Depends on the domain because it implements the interface defined there.
Allowed imports----Domain layer can only import dart libraries and other files within domain folder  but no flutter,http packages and databases.Domain must remain independent of frameworks and implemention
details. 
               ----Data layer can import domain files and files within domain layer but not files in the presentation layer.
               ----Presentation layer can import files from domain folder and files within the presentation folder itself but no files from the data folder.We avoid importing from data layer as this would tightly couple the datasource and the UI which we dont want.The UI should not know where the API lives,how the data is fethced and the network works.The UI should not care whre the data comes from.Use cases handles user actions.
The dependecy flow(dependencies flow inward-compile time flow) and runtime flow are different(UI to datasource and back).
