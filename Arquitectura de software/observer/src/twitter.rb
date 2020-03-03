# Observer Pattern
# Date: 02-Mar-2020
# Authors:
#          A01377154 Felipe Osornio
#          A01378838 Eric Gómez

# File name: twitter.rb


# Observer module that includes the Twitter class.
module User

    # Initialize for the list of followers of an user.
    def initialize
        @followers_list=[]
    end

    # Adds and new user to follow list
    def follow_user(user_to_follow)
        @followers_list.push(user_to_follow)
    end

    # Notifies to every follower the tweet
    def notify_followers(user, tweet)
        @followers_list.each do |follower|
            follower.notify(user, tweet)
        end

    end
end

# A little model of Twitter class
class Twitter
    include User

    # Declaration of username
    attr_reader :user

    # Initializes to a new user
    def initialize(user)
        super()
        @user = user
    end

    # Follows a user
    def follow(follower)
        follower.follow_user(self)
        self
    end

    # Writes a Tweet
    def tweet(new_tweet)
        notify_followers(self, new_tweet)
    end

    # Prints a tweet notification
    def notify(follower, tweet)
        puts "#{self.user} received a tweet from #{follower.user}: #{tweet}"
    end

end