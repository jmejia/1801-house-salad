class Member
  attr_reader :name, :role, :district, :party

  def initialize(attrs)
    @name = attrs[:name]
    @role = attrs[:role]
    @district = attrs[:district]
    @party = attrs[:party]
  end
end

