# frozen_string_literal: true

class Email
  def initialize(email, character)
    throw "invalid email" if phone.match(/^\S{0,}@\S{1,}.[a-z]{0,5}/).nil?
    throw "invalid character, it must be a single character" if character.size > 1
    throw "invalid character, it must be a [a-z] or *" if character.match?(/^[a-zA-z*]{1}/)

    @email = email
    @character = character
  end

  def escape
    temp = @email.split("@")
    temp[0].gsub!(/\S/, @character)
    temp.join("@")
  end
end
