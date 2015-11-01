## Intro
_________________________________________________________

#### Overview

Intro is a service that introduces professionals to other professionals. It does this via a random selection process whereby two professionals will be introduced in an email sent by Intro X times a month. It is then up to the people introduced if and how they will connect.

#### Technologies

1. Ruby
2. LinkedIn REST API
3. PostgreSQL
4. Sinatra
5. Active Record
5. JavaScript
6. HTML
7. CSS
8. Heroku

#### Features

1. Live feed showing user feedback (e.g. John gave Mary a thumbs up)
2. Users specify the industry they best associate with
3. Users can specify they industry they would like to meet people from
4. Users can give feedback (i.e. thumbs up or down) on their past connections

#### CRUD
###### Create
Users will be able to create an account that will include the following:
- Name
- Email
- Password
- LinkedIn URL
- Location
- Industry they are in (these will be predefined selection boxes)
- Industry(ies) they want to meet people from (these will be predefined selection boxes)

###### Read
Users will be able to see their profile information and past connections

###### Update
Users will be able to update their profile information, as well as provide feedback on their past connections (to enable a more tailored service)

###### Delete
Users will be able to delete their accounts and admins will be able to delete items from the live feed
