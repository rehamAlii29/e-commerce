# Flutter E-commerce App

This is a Flutter-based e-commerce app built for the Dubisign Flutter Developer position.
The app replicates the Figma design and fetches product data from the FakeStoreAPI.
It includes offline support, automatic data refresh when the internet connection is restored, and
cross-platform compatibility for Android and iOS.

## Features

- **Product Display**: Fetches products from FakeStoreAPI and displays them on the home screen in a
  grid format.
- **Offline Support**: Caches the product data locally using Hive. When the internet connection is
  lost, the cached data is shown. When the connection is restored, the app automatically refreshes
  the product and the cart data without user intervention.
- **Product Details Page**: Displays detailed information about each product, available offline as
  well.
- **Swipe for Details**: When the user swipes, a card appears showing additional product details.
- **Category Fetching**: Fetches categories from the API.
- **Category Filtering**: When a category is selected, the user is navigated to a filtered product
  page using a different API endpoint.
-
    - **Category Filtering**: In the category filtering part, I searched on Amazon and found that it
      navigated to another page. I implemented it similarly because the logic was unclear in the UI.
- **Cart Management**: Fetches the cart data using the user ID in the query parameters. Since the
  API does not return correct data for a specific user, I implemented custom logic to filter cart
  items correctly, which was a challenge I encountered during development.
- **Navigation to Cart**: Users can access the cart through the store icon in the app bar.

## Core Technologies Used

- **Dio**: For API handling.
- **Interceptor**: Used an interceptor to print the response and error in the Flutter E-commerce
  app.

- **Clean Architecture**: Implemented to separate concerns and maintain scalability.
- **Hive**: Used for local data storage (caching products for offline access). A generic function
  was implemented to store and retrieve any type of list.
- **Cubit (BLoC Pattern)**: Used for state management. A CubitInterface and CubitState were created
  to make the data-fetching cubit generic for any data type.
- **Manual Navigation Service**: Implemented using GlobalKey for efficient navigation control.
- **Singleton Pattern**: Used for managing shared instances and ensuring that the app uses only one
  instance of certain objects.
- **Custom Widgets**: Custom widgets were created to handle reusable UI components, ensuring a
  cleaner and more maintainable codebase.
- **Base Project Structure**: This is my own base structure, built with Clean Architecture and full
  API handling. Additionally, I made modifications to accommodate the FakeStoreAPI requirements.
- **Clean Code Practices**: Ensured readable, maintainable, and scalable code by following best
  practices.

## Setup Instructions

1. **Clone the repository**:

   ```bash
