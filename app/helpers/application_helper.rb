module ApplicationHelper
  def stylesheet_inline(name)
    content = Rails.cache.read("octo_css_#{name}")
    if content.nil?
      name << ".min" if Rails.env.production?
      content = File.read(Rails.root.join('public', 'stylesheets', "#{name}.css"))
      Rails.cache.write("octo_css_#{name}", content)
    end

    "<style>#{content}</style>".html_safe
  end
end
