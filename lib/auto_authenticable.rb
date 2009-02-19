module AutoAuthenticable

  def self.included(base) #:nodoc:
    super

    base.class_eval do
      include InstanceMethods
      
      before_filter :fake_login
    end
  end

  module InstanceMethods #:nodoc:
    private
  
    def fake_login
      return unless Rails.env.development?
      return if self.current_user
      return unless DEV_CONFIG[:do_auto_login]
      throw 'Failure doing fake login: cannot find DEV_CONFIG.' if DEV_CONFIG.nil?
      user = User.authenticate( DEV_CONFIG[:logged_in_user], DEV_CONFIG[:logged_in_password] )

      if user
        self.current_user = user
      else
        throw 'Failure doing fake login.'
      end
    end

  end

end