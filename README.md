# MERCHANDISING STORE API

A simple Rails API-only-application for a merchandising store. 

## Built With

- Ruby v3.0.1
- Ruby on Rails v6.1.4.6
- RSpec-Rails for testing

## Current API Endpoints

The API will expose the following RESTful endpoints.
### BaseUrl: {Host-URL}/api/v1

| Endpoint                  | Functionality                |
|---------------------------|------------------------------|
| GET /items                | List all items/product       |
| PUT /items/:id            | Update the price of an item  |
| POST /items/check_price   | Returns total price of items |
| POST /items/apply_discout | Returns discounted total     |


To get a local copy up and running follow these simple example steps.

### Prerequisites

Ruby: 3.0.1
Rails: 6.1.4.6
Postgres: >=9.5

### Setup

~~~bash
$ git clone git@github.com:acushlakoncept/mechandising_store.git
$ cd mechandising_store
~~~

Install gems with:

```
bundle install
```

Setup database with:

> make sure you have postgress sql installed and running on your system

```
   rails db:create
   rails db:migrate
   rails db:seed
```

### Usage

Start server with:

```
    rails server
```

Open `http://localhost:3000/` in your browser.


<hr/>
## GET /items

`http://localhost:3000/api/v1/items`

**Results**
```json
[
    {
        "id": "89219d7b-c786-4dae-b3d7-c85f81e22e0c",
        "code": "TSHIRT",
        "name": "Reedsy T-Shirt",
        "price": "15.00€"
    },
    {
        "id": "41e6a256-8b2b-4985-a32d-9c051eccf683",
        "code": "MUG",
        "name": "Reedsy mug",
        "price": "6.00€"
    },
    {
        "id": "8d5cf0cf-a2cd-4c61-b339-eebe1c00ba41",
        "code": "HOODIE",
        "name": "Reedsy Hoodie",
        "price": "20.00€"
    }
]
```


<hr/>
## PUT /items/:id

`http://localhost:3000/api/v1/items/70642f21-9021-41f0-ab9a-6ccb8724254f`

### params

```json 
{
  "price": 20.50
}
```


**Results**
```json
{
    "message": "Item price updated"
}
```

<hr/>
## POST /items/check_price

`http://localhost:3000/api/v1/items/check_price`

### params

```json 
{
  "items_code": "MUG, TSHIRT, TSHIRT, TSHIRT, TSHIRT, MUG, HOODIE"
}
```


**Results**
```json
{
    "Total": "92.00€",
    "message": "success"
}
```

<hr/>
## POST /items/apply_discount

`http://localhost:3000/api/v1/items/apply_discount`

### params

```json 
{
  "items_code": "MUG, TSHIRT, TSHIRT, TSHIRT, TSHIRT, MUG, HOODIE"
}
```


**Results**
```json
{
  "Total": "68.00€"
}
```

### Deploy to a live server

Deploying to a live server like Heroku is easy, make sure you have the necessary credentials setup on your local machine

```bash
heroku create
heroku rename app-new-name
git push heroku $BRANCH_NAME:master 
```
if you are already in master branch no need to add $BRANCH_NAME, just use `git push heroku master`

```bash
heroku run rails db:migrate
heroku run rails db:seed
heroku open
```

Enjoy your newly deployed rails API


### Run tests

```
  rpsec 
```

# Author

👤 **Uduak Essien**

- Github: [@acushlakoncept](https://github.com/acushlakoncept/)
- Twitter: [@acushlakoncept](https://twitter.com/acushlakoncept)
- Linkedin: [acushlakoncept](https://www.linkedin.com/in/acushlakoncept/)


## 🤝 Contributing

Contributions, issues and feature requests are welcome!

Feel free to check the [issues page](issues/).

## Show your support

Give a ⭐️ if you like this project!

