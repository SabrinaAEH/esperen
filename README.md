# ESPEREN_WEBSITE

ESPEREN_WEBSITE is a Rails application for managing the website of the association and social company ESPEREN.

## Requirements

- Ruby version 3.2.2
- Rails version 7.1.3.2
- PostgreSQL database
- gem Devise
- gem Stripe

## Installation

1. Clone the repository:

   bash:  
   git clone https://github.com/SabrinaAEH/esperen.git

2. Install Ruby dependencies:

   bash:  
   bundle install

3. Create the database and run migrations:

   bash:  
   rails db:create  
   rails db:migrate

4. (Optional) Run seeds to create demo data:

   bash:  
   rails db:seed

5. Start the Rails server:

   bash:  
   rails server

## Usage

- developement:  
  Once the server is running, you can access the application in your browser by visiting http://localhost:3000.
- production:  
  You can visit the website with heroku: ///////////

## Key Features

- Presentation Site: Information about the Esperen project and its mission.
- E-Shop: Users can browse and purchase Esperen's own branded textile products.
- User Authentication (with Devise): Secure user registration and login.
- Online Payment (with Stripe): Users can make online payments for their purchases.

## Navigation

- Home: /
- Shop: /shop
- Product Details: /shop/:id
- Cart: /cart
- Checkout: /checkout
- And of couse, different pages to present the project & the team.

## Contributors

Sabrina AEH 👩🏻‍💻
