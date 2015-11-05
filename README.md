## Intro
_________________________________________________________

#### Overview

Intro is a service that introduces professionals to other professionals each fortnight. Introductions are manually curated and registered users will receive an email from Intro each fortnight introducing them to a professional within the industry they are interested in. It is then up to the users if and how they will connect.

#### Objective

Build an application with Ruby in the backend that utilises CRUD operations on an SQL database ([spec](https://gist.github.com/epoch/afbcc7148078da035cc3#file-wdi4_project2-md)).

#### Technologies used

1. Ruby
2. PostgreSQL
3. Sinatra
4. Active Record
5. JavaScript
6. HTML
7. CSS
8. Bootstrap framework
9. Heroku hosting

#### Key features

1. Users specify the industry they best associate with
2. Users specify the industries they are interested to meet people from
3. Users have a dashboard to view a feed of their previous introductions
4. Users can give feedback (i.e. thumbs up or down) on their past connections (this will only be visible to the administrators curating the introductions)
5. Administrators can generate a list of potential introductions for a selected user

#### Approach / design notes

[TBC]

##### CRUD operations

###### Create
Users are able to sign up to receive introductions by creating an account with the following information:
- Name
- Email
- Password
- LinkedIn URL
- Personal URL (optional)
- Location (predefined dropdown selection)
- Industry they are in (predefined dropdown selection)
- Industries they are interested in meeting people from (predefined checkbox selection)

  Users are also able to provide feedback on each introduction via their personalised dashboard (i.e. thumbs up or down).

Administrators are able, via the administrator dashboard, to create the following:
- New industry
- New location

###### Read
Users are able to log into their account to view a personalised dashboard containing the following details:
- Personal details
- List of past introductions including:
⋅⋅* Name
⋅⋅* Industry
⋅⋅* Date of introduction
⋅⋅* Feedback given (thumbs up or down)

Administrators are able, via the administrator dashboard, to view the following:
- List of all introductions (pending)

###### Update
Users are able to log into their account to update the following:
- Personal details
- Industry preferences
- Password
- Feedback provided

###### Delete
Users are able to unsubscribe and delete their account (requires them to validate their email)

#### Links

Check out the app on Heroku - [https://heyintro.herokuapp.com/](https://heyintro.herokuapp.com/)

#### Acknowledgements

Thanks to [DT](https://github.com/epoch), [Matt](https://github.com/mattswann) and the WDI4 appleandriods class for all your assistance and guidance!

Shout out also to [Tammy](https://au.linkedin.com/pub/tammy-li/84/62a/733) for user testing.

*This project was undertaken as part of the General Assembly WDI course I undertook in 2015.*
