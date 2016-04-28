# Pre-requisites
- elastissearch
  ```
  brew install elasticsearch
  ```

- ruby: ruby-2.1.1

- MySql: 5.5.25

- Create the following in your ~/.bash_profile
  ```
  export TTDS_FB_APP_ID=XXX
  export TTDS_FB_APP_SECRET=XXX
  ```

Creating a separate GemSet for this project assuming you are using RVM

  ```
  # We assume your application name space is *ttr*
  rvm gemset create ttr

  # Checking all the existing different gemsets
  rvm gemset list

  # Switching to the gem set we created for this project
  rvm 2.1.1@ttr

  ```


# Setting up
Run the following command
  ```
  bundle install
  ```