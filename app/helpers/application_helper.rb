# frozen_string_literal: true

module ApplicationHelper
  def header_content
    return unless user_signed_in?

    content_tag(:div, class: "flex items-center") do
      concat content_tag(:span, current_user.email, class: "text-white mr-4")
      concat button_to(t('layout.header.sign_out'), destroy_user_session_path, method: :delete, class: "text-white")
    end
  end
end
