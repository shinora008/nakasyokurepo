# frozen_string_literal: true

module ApplicationHelper
  def full_title(page_title = '')
    base_title = 'なか食レポ'
    if page_title.blank?
    else
      "#{page_title} - #{bese_title}"
      end
    end
end
