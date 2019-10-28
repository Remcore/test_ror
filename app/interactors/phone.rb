# frozen_string_literal: true

class Phone
  def initialize(phone, character, length = 3)
    throw "invalid character, it must be a single character" if character.size > 1
    throw "invalid character, it must be a [a-z] or *" unless character.match?(/^[a-zA-z*]{1}/)
    throw "invalid length" unless length.integer?

    @phone = phone
    @character = character
    @length = length
  end

  def escape
    flag = true
    space = 0
    i = @phone.size
    escape_character = 0

    while i > 0
      if @phone[i - 1].match(/\d{1}/) && flag
        @phone[i - 1] = @phone[i - 1].gsub(/\d/, @character)
        escape_character += 1
      end

      if @phone[i - 1] == " "
        space += 1

        if space > 1
          @phone[i - 1] = ""
        end
      end

      if @phone[i - 1].match?(/\d{1}/)
        space = 0
      end

      flag = false unless escape_character < @length

      i -= 1
    end
    @phone
  end
end
