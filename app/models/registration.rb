class Registration < ActiveRecord::Base

  belongs_to :account

  attr_accessor :password
  attr_accessor :password_confirmation

  attr_writer :current_step

  validates_presence_of :login, :first_name, :last_name, :email_address,
    :password, :password_confirmation, :if => lambda { |o| o.current_step == 'create' }
  validates_format_of :email_address,
    :with => RegistrationsHelper::EMAIL_REGEX,
    :if => :email_address?

  def validate
    errors.add('password', 'and confirmation do not match') unless password_confirmation == password
  end

  def steps
    %w[create personal_info review]
  end

  def current_step
    @current_step || steps.first
  end

  def next_step
    self.current_step = steps[steps.index(current_step)+1]
  end

  def previous_step
    self.current_step = steps[steps.index(current_step)-1]
  end

  def first_step?
    current_step == steps.first
  end

  def last_step?
    current_step == steps.last
  end

end

