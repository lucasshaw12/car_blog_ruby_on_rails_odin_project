<!-- Improved compatibility of back to top link: See: https://github.com/othneildrew/Best-README-Template/pull/73 -->
<a name="readme-top"></a>
<!--
*** Thanks for checking out the Best-README-Template. If you have a suggestion
*** that would make this better, please fork the repo and create a pull request
*** or simply open an issue with the tag "enhancement".
*** Don't forget to give the project a star!
*** Thanks again! Now go create something AMAZING! :D
-->



<!-- PROJECT SHIELDS -->
<!--
*** I'm using markdown "reference style" links for readability.
*** Reference links are enclosed in brackets [ ] instead of parentheses ( ).
*** See the bottom of this document for the declaration of the reference variables
*** for contributors-url, forks-url, etc. This is an optional, concise syntax you may use.
*** https://www.markdownguide.org/basic-syntax/#reference-style-links
-->
[![Contributors][contributors-shield]][contributors-url]



<!-- PROJECT LOGO -->
<br />
<div align="center">
  <a href="https://github.com/othneildrew/Best-README-Template">
    <img src="images/logo.png" alt="Logo" width="80" height="80">
  </a>

  <p align="center">
    <a href="https://github.com/othneildrew/Best-README-Template"><strong>Explore the docs »</strong></a>
    <br />
    <br />
    <a href="https://github.com/othneildrew/Best-README-Template">View Demo</a>
    ·
    <a href="https://github.com/othneildrew/Best-README-Template/issues">Report Bug</a>
    ·
    <a href="https://github.com/othneildrew/Best-README-Template/issues">Request Feature</a>
  </p>
</div>

<!-- ABOUT THE PROJECT -->
## About The Project

Following the guidance from [Rails getting started](https://guides.rubyonrails.org/getting_started.html#using-a-model-to-interact-with-the-database). This small project functions as a basic application for managing articles. With the ability to comment and use search filters to find content. You can also edit your user details and add an avatar as your profile picture. 

We hope to develop and improve this application as a learning platform for those who love building web applications with Ruby on Rails. 

<p align="right">(<a href="#readme-top">back to top</a>)</p>



## Built With

[![Ruby][Rails-badge]][Ruby-on-Rails-url]
[![Bootstrap][Bootstrap-badge]][Bootstrap-url]

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- CURRENT FUNCTIONALTY-->
## Current functionality

Article CRUD with comments
User registration with email verification
User accounts 

TODO:

User roles
- "Admin". Full service access. CRUD all articles. Edit and delete users. Create and delete all comments. 

- "Basic". Create, edit and delete own articles. Delete own comments. Read all articles and comments.

- "Guest". View public articles and comments only. 

User avatars

<!-- GETTING STARTED -->
## Getting Started

This is an example of how you may give instructions on setting up your project locally.
To get a local copy up and running follow these simple example steps.

The application has a seeds.rb file to create dummy users with article posts and comments. The comments will be posted on the other users articles. 

### Setting up the database:

Create the database with

```sh
rake db:create
```

Run migrations

```sh
rake db:migrate
```

Seed the database with users with their articles and comments

```sh
rake db:seed
```

If any errors occur you can drop the database and follow the above steps again.

```sh
rake db:drop
```

### Prerequisites

### Installation

1. Clone the repo
   ```sh
   git clone https://github.com/your_username_/Project-Name.git
   ```
2. Navigate into the project directory
   ```sh
   cd rails_odin_project
   ```

<p align="right">(<a href="#readme-top">back to top</a>)</p>



<!-- USAGE EXAMPLES -->
## Usage

### Signing up 
Sign up to create a user before you can interact with the application. After clicking 'sign up' an authentication token will be displayed within your terminal. Visit the given url to submit the token to verify your user. You MUST do this before you can sign in. 

### User roles
There are 3 different types of users. "Admin", "Basic" and "Guest". 

Admin can see all posts whether private or public, and can also change the roles of other users. Can write posts and comments. Can edit and delete other users articles and comments.

Basic users can see all posts whether private or public, but cannot modify other users. Can write articles or comments.

Guests can only see public posts and comments. No other functionality.

### Testing and test coverage
- [Brakeman](https://github.com/presidentbeef/brakeman) checks for code vulnerabilities. This should be run before merge to main for non-local databases. To see a full breakdown of the scan run: ```brakeman``` in the root directory ``` car_blog_ruby_on_rails_odin_project```
 
- [Simplecov](https://github.com/simplecov-ruby/simplecov) runs when a test is executed ```bundle exec rspec```. To see a full breakdown of test coverage run ```open coverage/index.html``` in the root directory ``` car_blog_ruby_on_rails_odin_project```

### Linting and Style
- [Rubocop](https://gist.github.com/jhass/a5ae80d87f18e53e7b56#file-rubocop-yml) for code style and linting. The ```rubocop.yaml``` config file sets the desired cops. To detect all offences enter the command ```rubocop```. To detect and change offences run ```rubocop -A```

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- POTENTIAL ISSUES -->
## Potential Issues

<p align="right">(<a href="#readme-top">back to top</a>)</p>


<!-- Known issues -->
## Known issues

~~See the [open issues](https://github.com/othneildrew/Best-README-Template/issues) for a full list of proposed features (and known issues).~~

<p align="right">(<a href="#readme-top">back to top</a>)</p>


## Guides

### Run with bare metal installation

The application can be run using a bare metal installation. 

   ```sh
   rails s
   ```

### Run with Docker

The application can be run using Docker for configuration exercises and further development, stored in the Dockerfile. 

1. Run the Docker container. The port definition within the command publishes a container's port(s) to the host
   ```sh
   docker run -p 3000:3000 rails-car-app
   ```

Used this [guide](https://www.youtube.com/watch?v=J7hUHnQtFNo) to create the docker image for the application


<!-- CONTRIBUTING -->
## Contributing

Contributions are what make the open source community such an amazing place to learn, inspire, and create. Any contributions you make are **greatly appreciated**.

If you have a suggestion that would make this better, please fork the repo and create a pull request. You can also simply open an issue with the tag "enhancement".
Don't forget to give the project a star! Thanks again!

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the Branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

<p align="right">(<a href="#readme-top">back to top</a>)</p>



<!-- LICENSE -->
## License

Distributed under the MIT License. See `LICENSE.txt` for more information.

<p align="right">(<a href="#readme-top">back to top</a>)</p>



<!-- CONTACT -->
## Contact

Project Link: [https://github.com/your_username/repo_name](https://github.com/your_username/repo_name)

<p align="right">(<a href="#readme-top">back to top</a>)</p>


<!-- ACKNOWLEDGMENTS -->
## Acknowledgments

Use this space to list resources you find helpful and would like to give credit to. I've included a few of my favorites to kick things off!

* [Choose an Open Source License](https://choosealicense.com)
* [Img Shields](https://shields.io)
* https://github.com/othneildrew/Best-README-Template
* [Rails Getting started](https://guides.rubyonrails.org/getting_started.html)
* [Rails Odin Project](https://www.theodinproject.com/paths/full-stack-ruby-on-rails/courses/ruby-on-rails)
* [Rubocop config](https://gist.github.com/jhass/a5ae80d87f18e53e7b56#file-rubocop-yml)

<p align="right">(<a href="#readme-top">back to top</a>)</p>



<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->
[contributors-shield]: https://img.shields.io/github/contributors/othneildrew/Best-README-Template.svg?style=for-the-badge
[contributors-url]: https://github.com/othneildrew/Best-README-Template/graphs/contributors
[Bootstrap-badge]: https://img.shields.io/badge/Bootstrap-563D7C?style=for-the-badge&logo=bootstrap&logoColor=white
[Bootstrap-url]: https://getbootstrap.com
[Ruby-on-Rails-url]: https://rubyonrails.org
[Rails-badge]: https://img.shields.io/badge/rails-%23CC0000.svg?style=for-the-badge&logo=ruby-on-rails&logoColor=white