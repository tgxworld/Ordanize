# Copied from https://github.com/sgruhier/foundation_rails_helper/blob/master/lib/foundation_rails_helper/flash_helper.rb
require 'action_view/helpers'

module FoundationRailsHelper
  module FlashHelper
    # <div class="alert-box [success alert secondary]">
    #   This is an alert box.
    #   <a href="" class="close">&times;</a>
    # </div>
    DEFAULT_KEY_MATCHING = {
      :alert     => :alert,
      :notice    => :success,
      :info      => :standard,
      :secondary => :secondary,
      :success   => :success,
      :error     => :alert
    }
    def display_flash_messages(key_matching = {})
      key_matching = DEFAULT_KEY_MATCHING.merge(key_matching)

      flash.inject "" do |message, (key, value)|
        message += content_tag :div, :data => { :alert => "" }, :class => "alert-box #{key_matching[key.to_sym] || :standard}" do
          (value + link_to("&times;".html_safe, "#", :class => :close)).html_safe
        end
      end.html_safe
    end
  end
end
