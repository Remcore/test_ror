# frozen_string_literal: true

class Skype
  def initialize(skype)
    @skype = skype
  end

  def escape
    @skype.gsub(/(:\K(\S{0,})?(?=\?))|(:\K(\S{0,}))/, "xxx")
  end
end
