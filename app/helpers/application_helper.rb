# frozen_string_literal: true

module ApplicationHelper
  def header_content
    return unless user_signed_in?

    content_tag(:div, class: "flex items-center") do
      concat content_tag(:span, current_user.email, class: "text-white mr-4")
      concat button_to(t('layout.header.sign_out'), destroy_user_session_path, method: :delete, class: "text-white")
    end
  end

  def form_url_and_method(object)
    object_type = object.class.to_s.downcase.pluralize

    if object.persisted?
      { url: send("#{object_type}_path", object, locale: I18n.locale), method: :patch }
    else
      { url: send("#{object_type}_path", locale: I18n.locale), method: :post }
    end
  end
end
