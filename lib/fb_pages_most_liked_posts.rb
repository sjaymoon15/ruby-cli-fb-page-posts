require "fb_pages_most_liked_posts/version"
require 'thor'
require 'koala'

module FbPagesMostLikedPosts
  class CLI < Thor
    desc "fb_pages_most_liked_posts [-m MAX_POSTS_PER_PAGE] [-t TOP_POSTS_COUNT]",
         "[-m MAX_POSTS_PER_PAGE] - the number of posts to consider for evaluation per page,
          [-t TOP_POSTS_COUNT] - the number of top posts to display"
    method_option :MAX_POSTS_PER_PAGE, :numeric => :string, :default => 100, :aliases => "-m"
    method_option :TOP_POSTS_COUNT, :numeric => :string, :default => 10, :aliases => "-t"

    def fb_pages_most_liked_posts

      app_id = '1212685528863304'
      app_secret = ENV['FACEBOOK_APP_SECRET']
      oauth = Koala::Facebook::OAuth.new(app_id, app_secret, callback_url=nil)
      access_token = oauth.get_app_access_token

      client = Koala::Facebook::API.new(access_token)
      params = "posts?fields=likes.summary(true),message,created_time&limit=#{options[:MAX_POSTS_PER_PAGE]}"
      coca_cola_posts = client.get_connection('CocaColaUnitedStates', params)
      fc_barcelona_posts = client.get_connection('fcbarcelona', params)
      whole_foods_posts = client.get_connection('WholeFoods', params)

      coca_cola_posts_sorted = coca_cola_posts.sort { |a, b|
        a['likes']['summary']['total_count'] <=> b['likes']['summary']['total_count']
      }.reverse

      fc_barcelona_posts_sorted = fc_barcelona_posts.sort { |a, b|
        a['likes']['summary']['total_count'] <=> b['likes']['summary']['total_count']
      }.reverse

      whole_foods_posts_sorted = whole_foods_posts.sort { |a, b|
        a['likes']['summary']['total_count'] <=> b['likes']['summary']['total_count']
      }.reverse

      puts "#########################################################################"
      whole_foods_posts_sorted.each do |post|
        puts "id: #{post['id']}"
        puts "num_of_likes: #{post['likes']['summary']['total_count']}"
        puts "message: #{post['message']}"
        puts "created_time: #{post['created_time']}"
        puts "######################################"
      end
    end
  end
end