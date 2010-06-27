class ConvertsRegistrationToAccountInformation

  def do_it registration
    ActiveRecord::Base.transaction do
      account = converts_registration_to_account(registration)

      handles_account_to_user_configuration(registration, account)
      handles_account_to_user_profile_configuration(registration, account.user)
      handles_account_to_user_address_configuration(registration, account.user)
      converts_registration_to_primary_email_address(registration, account.user)

      account.save! #single write to db
      account
    end
  end

private

  def handles_account_to_user_configuration(registration, account)
    user = converts_registration_to_user(registration)
    account.user = user
  end

  def converts_registration_to_user(registration)
    user = User.create! :first_name => registration.first_name, :last_name => registration.last_name
    user
  end

  def handles_account_to_user_profile_configuration(registration, user)
    user_profile = UserProfile.new
    user_profile.user = user
    user_profile.save!
    user_profile
  end

  def handles_account_to_user_address_configuration(registration, user)
    user_address = UserAddress.new
    user_address.user = user
    user_address.address_type_id = 1
    user_address.address = registration.address
    user_address.address2 = registration.address2
    user_address.city = registration.city
    user_address.state_code = registration.state
    user_address.zip = registration.zip
    user_address.is_primary = true
    user_address.save!
    user_address
  end

  def converts_registration_to_primary_email_address(registration, user)
    user.email_addresses.create:address => registration.email_address, :primary => true
    user
  end

  def converts_registration_to_account(registration)
    account = Account.new
    account.login = registration.login
    account.password = registration.password
    account.password_confirmation = registration.password_confirmation
    account.save! #do this once here so all future dependent create methods wont raise exceptions
    account
  end

end

