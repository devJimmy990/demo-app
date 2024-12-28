# Flutter Fundamentals - Widgets Module

## Create Simple Shopping App Interface
create a simplified version of a shopping app interface using Flutter. 
This app will feature a main screen with multiple sections, displaying products, hot offers and recently purchased  products

- Title: create stateful widget
- Description: 
  - use media query to design responsive UI.
  
  - give a title to the page using appBar.

  - place at the start of the page text says ""our products"" below it a pageView that shows images of the products.

  - place gridView that display 2 cards in the single row of the gridView these cards shows text , image and add to cart icon (make sure when the icon is tapped to display snackbar that says item added to the cart). 

  - below the gridView add a text says ""hot offers"" and using ListView builder build a list of 5 items with images and text inside it use expanded widget for both images and text.

  - make sure that the page is scrollable horizontally.

==================================================
#### Draft 
  - create `shopping page` as stateless widget and i has 3 seprate `stateless-widgets`:
    - our-products: it has `page-preview` with images
    
    - products-list: it has `grid-view` to display list of `item-card`
    
    - hot-offers: it has `list-view` with vertical direction
  
- `item-card` it is a `stateful-widget` and it has states for each item like: {favorite, cart} and each action call `snack-bar`
