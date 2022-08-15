# ZoundTest
Case test app for displaying a list of cryptocurruncies for users in USA and Sweden

![Simulator Screen Shot - iPhone 8 - 2022-08-15 at 10 20 24](https://user-images.githubusercontent.com/11787037/184581821-47809b05-ed13-436c-af71-a17dacb818b8.png)
![Simulator Screen Shot - iPhone 8 - 2022-08-15 at 10 20 58](https://user-images.githubusercontent.com/11787037/184581827-97b0476e-a73c-4d87-9df3-6e017614e348.png)

Interface Highlights:
- Switching between USD and SEK using segmented control
- TableView Used for displaying list
- Display Low Price and High Price against each currency
- Green/Red color is decided based on open price is less than last price
- Open Price is displayed in colored box
- symbl and baseAsset keys being displayed in Title and Subtitle
- Support for Dark and Light Theme

Key Details:
- MVVM architecture used
- Protocols used keeping in mind modern design patterns
- Sample unit test also included
- Protocols designed keeping in view code scalability
- SOLID principles followed for maintainability.
- View Layer handles only interface elements.
- View Models for main controller and cell are injected as dependancies into their respective views
- Total segregation of layers and their responsibilities
- USD and SEK are managed via a singleton. The idea being that they can used in further points as well.
- Featching/Parsing Data is managed by DataProvider and it's protocol is mocked for unit tests using a json sample.
