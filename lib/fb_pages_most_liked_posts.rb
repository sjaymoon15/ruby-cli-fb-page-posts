require "fb_pages_most_liked_posts/version"
require 'thor'

module FbPagesMostLikedPosts
  class CLI < Thor
    desc "hello world", "testing cli setup"
    def hello
      puts "Hello world"
    end
  end
end
