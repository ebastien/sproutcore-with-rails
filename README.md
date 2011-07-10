# SproutCore with Rails

A case study for integrating SproutCore 2.0 with Rails 3.1.
So far a simple login flow to get access to an abstract "account" resource.
The purpose of this project is to experiment a RESTFul (i.e hypermedia-driven) web service driving SproutCore controllers/statecharts.
I would like to go beyond CRUD services and bulk APIs and check whether this is a practical approach.

## Media types

### `application/vnd.dsim+json`

#### Relations

* `"self"`
* `"login"`: POST user credentials for login

#### Elements

* User credentials `{ "login": _, "password": _ }`


