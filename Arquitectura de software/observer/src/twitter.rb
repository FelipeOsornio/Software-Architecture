# Observer Pattern
# Date: 02-Mar-2020
# Authors:
#          A01377154 Felipe Osornio
#          A01378838 Eric Gómez

# File name: twitter.rb


#Observer module that includes the Twitter class.
module User

    #Initialize for the list of followers of an user.
    def initialize
        @followersList=[]
    end

    #Adds and new user to follow list
    def followUser(userToFollow)
        @followersList.push(userToFollow)
    end

    #notify every follower the tweet
    def notify_followers(user, tweet)
        @followersList.each do |follower|
            follower.notify(user, tweet)
        end

    end
end

#The Twitter class
class Twitter
    include User

    #Declaration of user name
    attr_reader :user

    #Initialize to a new user
    def initialize(user)
        super()
        @user = user
    end

    #Follows a user
    def follow(follower)
        follower.followUser(self)
        self
    end

    #Write a Tweet
    def tweet(tweetMsg)
        notify_followers(self, tweetMsg)
    end

    #Prints a tweet notification
    def notify(follower, tweet)
        puts "#{self.user} received a tweet from #{follower.user}: #{tweet}"
    end

end