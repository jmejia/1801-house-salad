class MemberSearch
  def initialize(state)
    @state = state
  end

  def members
    raw_members = service.members

    raw_members.map do |raw_member|
      Member.new(raw_member)
    end
  end

  private
    attr_reader :state

    def service
      @service ||= PropublicaService.new(state)
    end
end


