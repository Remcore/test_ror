# frozen_string_literal: true

class Phone
  def initialize(phone, character, length = 3)
    @phone = phone
    @character = character
    @length = length
  end

  def escape
    i = @phone.size
    escape_character = 0
    while i > 0
      if @phone.scan(/\d/).size
        @phone[i - 1] = @phone[i - 1].gsub(/\d/, @character)
        escape_character += 1
      end
      break unless escape_character <= @length

      i -= 1
    end
    @phone
  end
end
