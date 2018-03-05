# FbPagesMostLikedPosts

A command-line program that lists the top liked posts (ranked by likes) for 3 Facebook Pages given their public API data.

Pages used:
```
https://www.facebook.com/CocaColaUnitedStates/
https://www.facebook.com/fcbarcelona/
https://www.facebook.com/WholeFoods/
```

## Requirements
Ruby version >= 2.1
bundler 

## Getting Started

Clone this repo and install dependencies
```
$ git clone https://github.com/sjaymoon15/ruby-cli-fb-page-posts.git
$ cd ruby-cli-fb-page-posts
$ bundle install
```

Set a facebook app secret environment variable
```
$ export FACEBOOK_APP_SECRET=thisisfakeappsecretplzreplacewithrightsecret
```
And then execute:

    $ bundle exec exe/fb_pages_most_liked_posts -m 100 -t 10    
    
Or execute:

    $ fb_pages_most_liked_posts -m 100 -t 10

Options:
```
    -m -MAX_POSTS_PER_PAGE: the number of posts to consider for evaluation per page 
        (optional, default to 100, Maximum number: 100)
    -t -TOP_POSTS_COUNT: the number of top posts to display (optional, default to 10)
```

Alternatively, you can define the environment variables before the name of the command.
```
$ FACEBOOK_APP_SECRET=thisisfakeappsecretplzreplacewithrightsecret fb_pages_most_liked_posts -m 100 -t 10
```

## Output example
```
  Searching 100 posts for each page...

  Showing 5 posts for each page...

  Coca Cola United States
  +--------------+----------------------------------+--------------------------+
  | num_of_likes | id                               | created_time             |
  +--------------+----------------------------------+--------------------------+
  | 19139        | 820882001277849_1435396799826363 | 2016-12-24T14:00:29+0000 |
  +--------------+----------------------------------+--------------------------+
  | 16764        | 820882001277849_1439894569376586 | 2016-12-26T14:00:02+0000 |
  +--------------+----------------------------------+--------------------------+
  | 8500         | 820882001277849_1399933660039344 | 2016-11-29T01:45:33+0000 |
  +--------------+----------------------------------+--------------------------+
  | 6270         | 820882001277849_1818745688158137 | 2017-12-20T22:38:25+0000 |
  +--------------+----------------------------------+--------------------------+
  | 6009         | 820882001277849_1653572854675422 | 2017-07-10T20:43:51+0000 |
  +--------------+----------------------------------+--------------------------+

  FC Barcelona
  +--------------+--------------------------------+--------------------------+
  | num_of_likes | id                             | created_time             |
  +--------------+--------------------------------+--------------------------+
  | 173469       | 197394889304_10156578963364305 | 2018-03-04T17:09:35+0000 |
  +--------------+--------------------------------+--------------------------+
  | 161723       | 197394889304_10156539385409305 | 2018-02-20T21:38:14+0000 |
  +--------------+--------------------------------+--------------------------+
  | 137554       | 197394889304_10156539562294305 | 2018-02-21T01:30:00+0000 |
  +--------------+--------------------------------+--------------------------+
  | 124023       | 197394889304_10156552262359305 | 2018-02-24T21:41:02+0000 |
  +--------------+--------------------------------+--------------------------+
  | 117804       | 197394889304_10156553565614305 | 2018-02-25T08:40:06+0000 |
  +--------------+--------------------------------+--------------------------+

  Whole Foods
  +--------------+-------------------------------+--------------------------+
  | num_of_likes | id                            | created_time             |
  +--------------+-------------------------------+--------------------------+
  | 8237         | 24922591487_10155863154201488 | 2018-01-25T15:20:26+0000 |
  +--------------+-------------------------------+--------------------------+
  | 6627         | 24922591487_10155845632296488 | 2018-01-19T20:31:01+0000 |
  +--------------+-------------------------------+--------------------------+
  | 6062         | 24922591487_10155737382231488 | 2017-12-08T21:27:47+0000 |
  +--------------+-------------------------------+--------------------------+
  | 4192         | 24922591487_10155809144296488 | 2018-01-05T15:36:13+0000 |
  +--------------+-------------------------------+--------------------------+
  | 2649         | 24922591487_10155714711586488 | 2017-11-30T20:14:54+0000 |
  +--------------+-------------------------------+--------------------------+
```