class Owner
  attr_reader :name, :species
  
  @@all = []
  
  def initialize(name)
    @name = name 
    @species = "human"
    save 
  end 
  
  def say_species
    return "I am a #{species}."
  end 
  
  def save 
    @@all << self 
  end 
  
  def self.all 
    @@all 
  end 
  
  def self.count 
    all.count
  end 
  
  def self.reset_all 
    all.clear 
  end 
  
  #Associations 
  def cats 
     Cat.all.select{|cats|
      cats.owner == self 
     }
  end 
  
  def dogs 
     Dog.all.select{|dogs|
      dogs.owner == self 
     }
  end 
  
  def buy_cat(name)
    new_cat = Cat.new(name, self)
    cats << new_cat
  end
  
  def buy_dog(name)
    new_dog = Dog.new(name, self)
    dogs << new_dog
  end
  
  def walk_dogs
    Dog.all.each{|dog|
      dog.mood = "happy"
    }
  end 
  
  def feed_cats 
    Cat.all.each{|cat|
      cat.mood = "happy"
    }
  end 
  
  def sell_pets 
    Dog.all.each{|dog|
      dog.mood = "nervous"
    }
    
    Cat.all.each{|cat|
      cat.mood = "nervous"
    }
    
    Dog.all.each{|dog|
      dog.owner = nil 
    }
    
    Cat.all.each{|cat|
      cat.owner = nil 
    }
  end 
  
  def list_pets
    "I have #{dogs.count} dog(s), and #{cats.count} cat(s)."
  end 
  
end