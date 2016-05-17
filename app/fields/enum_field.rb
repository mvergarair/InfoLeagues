require "administrate/field/base"

class EnumField < Administrate::Field::Base
  def to_s
    if data.nil?
      ''
    else
      data.humanize
    end
  end
end
