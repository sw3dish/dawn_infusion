- What I did
  - Started using the [Docker Compose docs](https://docs.docker.com/compose/rails/) to set up dev environment
  - Went with Rails 6 because I wanted to use Rails 6 guide
    - Had to modify Dockerfile slightly (add yarn)
  - Created stories and newsletter models
    - https://guides.rubyonrails.org/getting_started.html
    - https://guides.rubyonrails.org/association_basics.html
  - Wanted to be able to add multiple stories to a single newsletter in a non-gross way
    - Decided to make a React component
  - Installed React using `webpacker` and `react-rails`
    - https://www.botreetechnologies.com/blog/how-to-add-react-js-to-your-ruby-on-rails-app-with-webpacker
  - Ended up not using React because of time
  - Tried to use `tinymce-rails`
    - Ended up not usign `tinymce-rails`
    - Integration with Webpacker is bad
  - Tried to manually use Webpacker for `tinymce`
  - Ended up just including the script because of time


- What I would do
  - Use slim images/alpine for size
  - Better story select -- probably Drag-and-Drop