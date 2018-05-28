# PHASE 2

require "byebug"
def convert_to_int(str)
  begin 
    num = Integer(str)
  rescue ArgumentError
    puts "Wrong kind of argument. Argument must be a string like '123'"
  ensure 
    num ||= nil
  end 
end



# PHASE 3
FRUITS = ["apple", "banana", "orange"]

class CoffeeError < StandardError 
  attr_reader :maybe_fruit
  def initialize(maybe_fruit)
    @maybe_fruit = maybe_fruit
  end
  
  def message 
    "#{maybe_fruit} is not a fruit! But try again..."
  end
end 

class NotAFruitError < StandardError
  attr_reader :maybe_fruit
  
  def initialize(maybe_fruit)
    @maybe_fruit = maybe_fruit
  end
  
  def message
    "#{maybe_fruit} is not included in the fruits"
  end 
end 

def reaction(maybe_fruit)
  if FRUITS.include?(maybe_fruit)
    puts "OMG, thanks so much for the #{maybe_fruit}!"
  elsif maybe_fruit.downcase == 'coffee'
    raise CoffeeError.new(maybe_fruit)
  else
    raise NotAFruitError.new(maybe_fruit)
  end 
end

def feed_me_a_fruit
  puts "Hello, I am a friendly monster. :)"

  puts "Feed me a fruit! (Enter the name of a fruit:)"
  
  begin 
    maybe_fruit = gets.chomp
    reaction(maybe_fruit) 
  rescue  CoffeeError => e 
    puts e.message
    retry
  end
end  

# PHASE 4
class FriendError < ArgumentError
  attr_reader :best_friend, :years_known 
  
  def initialize(best_friend, years_known)
    @best_friend = best_friend
    @years_known = years_known
  end 
  
  def message 
    "You known #{best_friend} for only #{years_known} years"
  end 
end 

class BestFriend
  def initialize(name, yrs_known, fav_pastime)
    @name = name
    @yrs_known = yrs_known
    @fav_pastime = fav_pastime
    byebug
    if @yrs_known < 5 
      raise FriendError.new(@name, @yrs_known)
    end 
  end

  def talk_about_friendship
    puts "Wowza, we've been friends for #{@yrs_known}. Let's be friends for another #{1000 * @yrs_known}."
  end

  def do_friendstuff
    puts "Hey bestie, let's go #{@fav_pastime}. Wait, why don't you choose. 😄"
  end

  def give_friendship_bracelet
    puts "Hey bestie, I made you a friendship bracelet. It says my name, #{@name}, so you never forget me." 
  end
end

bob = BestFriend.new("bob", 4, "frisbee")
puts "?????"
p "*******"

