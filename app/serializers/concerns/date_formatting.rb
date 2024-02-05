# frozen_string_literal: true

module DateFormatting
  extend ActiveSupport::Concern

  def formatted_date(datetime)
    datetime.strftime('%Y-%m-%d %H:%M:%S')
  end
end
