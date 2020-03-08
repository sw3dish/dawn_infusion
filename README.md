# DawnInfusion

This is a coding challenge for Morning Brew.

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes.

### Prerequisites

- Docker + Docker Compose

### Installing

```
docker-compose build

docker-compose run app rake db:create

docker-compose up -d
```

### Thought Process
- Started by setting up Docker + Docker Compose
  - Set up Postgres and Rails containers
- Created CRUD for stories
- Created CRUD for newsletters
  - Tried to make a React component for better story selection
  - Used out of box `collection_select` after running into Webpacker slowness
- Integrated TinyMCE into stories
  - Tried again to use Webpacker
  - Tried to use `tinymce-rails`
  - Ended up using the `script` tag because of time spent debugging
- Wrote a Lyra API wrapper using `faraday`
  - `app/lib/lyra.rb`
  - Tried to generalize between newsletters and stories, supporting all CRUD actions
- Integrated Lyra CRUD into CMS
- Used `roadie` to inline styles for transport to Lyra

### Additions
- Ensure that newsletters in Lyra are made of the same HTML that is in Lyra for all stories
- If Lyra acts like I think it does (acts like a central repository?)
  - I tightly coupled Lyra to the individual stories
    - Would break out Lyra interaction separately from the individual stories
    - Especially for deleting -- right now, the Lyra ID is tied directly to the story, so if it is deleted, there is no local reference to the Lyra version
  - Allow for writers to fetch from Lyra, then diff the changes
- Get webpacker to properly pack CSS (couldn't figure it out)
- Better story selection
  - Searching for stories based on various metadata
    - By tags
    - By words body html
  - Ordering
    - Might do it with React DnD
- Generate a teaser from body html to display in the CMS