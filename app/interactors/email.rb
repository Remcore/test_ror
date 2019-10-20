# frozen_string_literal: true

class Email
  def initialize(email, character)
    @email = email
    @character = character
  end

  def escape
    temp = @email.split("@")
    temp[0].gsub!(/\S/, @character)
    temp.join("@")
  end
end
