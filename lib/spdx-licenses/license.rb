module SpdxLicenses
  class License
    attr_reader :id, :name, :osi_approved
    alias_method :osi_approved?, :osi_approved

    def initialize(id, name, osi)
      @id = id
      @name = name
      @osi_approved = osi
    end
  end
end
