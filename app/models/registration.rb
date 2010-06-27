class Registration < ActiveRecord::Base

  belongs_to :account

  attr_accessor :password
  attr_accessor :password_confirmation

  attr_writer :current_step

  validates_presence_of :login, :first_name, :last_name, :email_address,
    :password, :password_confirmation, :if => lambda { |r| r.current_step == 'create' }
  validates_format_of :email_address,
    :with => RegistrationsHelper::EMAIL_REGEX,
    :if => :email_address?

  validates_presence_of :address, :city, :state, :zip, :phone_number,
    :if => lambda { |r| r.current_step == 'personal_info' }
  validates_length_of :password, :minimum => 4, :if => :password?

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

  def password?
    return true unless @password == nil || @password.strip == ''
    false
  end

end

