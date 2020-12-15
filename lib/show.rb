class Show
    attr_reader :name,
                :creator,
                :characters

  def initialize(name, creator, characters)
    @name       = name
    @creator    = creator
    @characters = characters
  end

  def total_salary
  end

  def highest_paid_actor
  end

  def actors
    @characters.find_all do |character|
    character.actor == actor
    end

  end
end
