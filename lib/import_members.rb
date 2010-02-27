require 'rubygems'
require 'roo'

class ImportMembers
  class << self    
    def members
      klass = self.new
      klass.members
    end
    
    def postal_code
      klass = self.new
      klass.postal_codes
    end
    
    def states
      klass = self.new
      klass.states
    end
    
    def cities
      klass = self.new
      klass.cities
    end
    
    def member_statuses
      klass = self.new
      klass.member_statuses
    end
    
    def companies
      klass = self.new
      klass.companies
    end
  end
  
  def filename
    '/users/nateklaiber/desktop/member_export.xls'
  end
  
  def spreadsheet
    @spreadsheet ||= ::Excel.new(self.filename)
  end
  
  def headers
    @headers ||= self.headers_with_index.values
  end
  
  def headers_with_index
    @headers_with_index ||= (self.spreadsheet.first_column..self.spreadsheet.last_column).inject({}) { |hsh,val| hsh[val] = self.spreadsheet.cell(1, val).extend(Import::Ext::String).to_attribute; hsh }
  end
  
  def headers_to_capture
    %w( :internal_id :member_number :member_title :member_firstname :member_middlename :member_lastname :member_suffix :member_company :member_street1 :member_street2 :member_city :member_state :member_postal_code :member_username :member_password :member_effdate :member_expdate )
  end
  
  def unique_companies
    @unique_companies ||= (self.first_row).upto(self.last_row).inject([]) { |arr,val| arr << self.value_for_column(val, :member_company); arr }.compact.uniq.sort
  end
  
  def companies
    @companies ||= self.unique_companies.inject([]) { |arr,val| arr << Import::Company.new(:name => val) }
  end
  
  def unique_states
    @unique_states ||= (self.first_row).upto(self.last_row).inject([]) { |arr,val| arr << self.value_for_column(val, :member_state); arr }.compact.map(&:downcase).uniq.sort
  end
  
  def states
    @states ||= self.unique_states.inject([]) { |arr,val| arr << Import::State.new(:name => val) }
  end
  
  def unique_cities
    @unique_cities ||= (self.first_row).upto(self.last_row).inject([]) { |arr,val| arr << self.value_for_column(val, :member_city); arr }.compact.map(&:downcase).uniq.sort
  end
  
  def cities
    @cities ||= self.unique_cities.inject([]) { |arr,val| arr << Import::City.new(:name => val) }
  end
  
  def unique_postal_codes
    @unique_postal_codes ||= (self.first_row).upto(self.last_row).inject([]) { |arr,val| arr << self.value_for_column(val, :member_postalcode).to_i.to_s; arr }.compact.uniq.sort
  end
  
  def postal_codes
    @postal_codes ||= self.unique_postal_codes.inject([]) { |arr,val| arr << Import::PostalCode.new(:code => val); arr }
  end
  
  def unique_member_statuses
    @unique_member_statuses ||= (self.first_row).upto(self.last_row).inject([]) { |arr,val| arr << { :code => self.value_for_column(val, :member_status_code), :description => self.value_for_column(val, :member_status_desc) } unless self.value_for_column(val, :member_status_code).blank?; arr }.uniq
  end
  
  def member_statuses
    @member_statuses ||= self.unique_member_statuses.inject([]) { |arr,attrs| arr << Import::MemberStatus.new(attrs); arr }
  end
  
  def members
    @members ||= (self.first_row).upto(self.last_row).inject([]) do |arr,val|
      addresses = []
      
      address_attributes = {
        :type => :work,
        :is_primary => true,
        :street => self.value_for_column(val, :member_street1),
        :street_secondary => self.value_for_column(val, :member_street2),
        :city => Import::City.new(:name => self.value_for_column(val, :member_city)),
        :state => Import::State.new(:name => self.value_for_column(val, :member_state)),
        :postal_code => Import::PostalCode.new(:code => self.value_for_column(val, :member_postalcode).to_i.to_s)
      }
      addresses << Import::Address.new(address_attributes)
      
      phone_numbers = []
      
      home_phone_number_attributes = {
        :type => :home,
        :is_primary => true,
        :number => self.value_for_column(val, :member_phonehome)
      }
      work_phone_number_attributes = {
        :type => :work,
        :is_primary => false,
        :number => self.value_for_column(val, :member_phonework)
      }
      mobile_phone_number_attributes = {
        :type => :mobile,
        :is_primary => false,
        :number => self.value_for_column(val, :member_phonemobile)
      }
      phone_numbers << Import::PhoneNumber.new(home_phone_number_attributes)
      phone_numbers << Import::PhoneNumber.new(work_phone_number_attributes)
      phone_numbers << Import::PhoneNumber.new(mobile_phone_number_attributes)
      
      email_addresses = []
      
      main_email_address_attributes = {
        :type => :main,
        :is_primary => true,
        :confirmed_at => Time.now,
        :address => self.value_for_column(val, :member_email)
      }
      email_addresses << Import::EmailAddress.new(main_email_address_attributes)
      
      company_attributes = {
        :name => self.value_for_column(val, :member_company)
      }
      company = Import::Company.new(company_attributes)
      
      status_attributes = {
        :code => self.value_for_column(val, :member_status_code),
        :description => self.value_for_column(val, :member_status_desc)
      }
      status = Import::MemberStatus.new(status_attributes)
      
      account_attributes = {
        :username => self.value_for_column(val, :member_username),
        :password => self.value_for_column(val, :member_password),
        :joined_at => self.value_for_column(val, :member_effdate),
        :expired_at => self.value_for_column(val, :member_expdate),
        :status => status
      }
      account = Import::Account.new(account_attributes)
      
      member_attributes = {
        :title => self.value_for_column(val, :member_title),
        :first_name => self.value_for_column(val, :member_firstname),
        :middle_name => self.value_for_column(val, :member_middlename),
        :last_name => self.value_for_column(val, :member_lastname),
        :suffix => self.value_for_column(val, :member_suffix),
        :birthdate => self.value_for_column(val, :member_birthdate),
        :gender => self.value_for_column(val, :member_gender),
        :addresses => addresses,
        :phone_numbers => phone_numbers,
        :email_addresses => email_addresses,
        :account => account,
        :company => company,
      }
      arr << Import::Member.new(member_attributes)
      arr
    end
  end
  
  def value_for_column(num, col)
    self.spreadsheet.cell(num, self.headers_with_index.invert[col])
  end
  
  def first_row
    @first_row ||= (self.spreadsheet.first_row.to_i + 1)
  end
  
  def last_row
    @last_row ||= self.spreadsheet.last_row.to_i
  end
end