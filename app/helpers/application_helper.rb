# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def main_tab_class(tab)
    c = controller.controller_name
    if tab == 'parliament'
      'class="active"' if ['parliamentarians', 'parties'].include?(c)
    elsif tab == 'activity'
        'class="active"' if ['activity', 'initiatives', 'taggings', 'interventions', 'commisions', 'topics'].include?(c)
    elsif tab == 'about'
      'class="active"' if c == 'page'
    else
      ''
    end
  end
  
  # i18n will_paginate
  include WillPaginate::ViewHelpers

  def will_paginate_with_i18n(collection, options = {})
  will_paginate_without_i18n(collection, options.merge(:previous_label => I18n.t(:previous), :next_label => I18n.t(:next)))
  end

  alias_method_chain :will_paginate, :i18n
end
