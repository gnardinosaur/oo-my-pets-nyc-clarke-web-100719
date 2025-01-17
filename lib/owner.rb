class Owner

    attr_reader :name, :species

    @@all = []

    def initialize(name, species = "human")
        @name = name
        @species = species
        self.class.all << self
    end 

    def say_species 
        "I am a #{@species}."
    end

    def self.all
        @@all
    end

    def self.count
       @@all.length
    end

    def self.reset_all
       @@all.clear 
    end

    def cats
        Cat.all.select { |cat| cat.owner == self}
    end

    def dogs
        Dog.all.select { |dog| dog.owner == self}
    end

    def buy_cat(cat)
        Cat.new(cat, self)
    end

    def buy_dog(dog)
        Dog.new(dog, self)
    end

    def walk_dogs
        dogs.each { |dog| dog.mood = "happy"}
    end

    def feed_cats
        cats.each { |cat| cat.mood = "happy"}
    end

    def sell_pets
        cats.each do |cat| 
            cat.mood = "nervous"
            cat.owner = nil
        end

        dogs.each do |dog| 
            dog.mood = "nervous"
            dog.owner = nil
        end

     def list_pets
        p "I have #{dogs.length} dog(s), and #{cats.length} cat(s)."
     end


    end




end