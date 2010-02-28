class PaymentsController < ApplicationController
  include ActiveMerchant::Billing
  
  def index
  end
  
  def checkout
    ActiveMerchant::Billing::Base.mode = :test    
    
    setup_response = gateway.setup_purchase(50000,
        :ip                => request.remote_ip,
        :return_url        => url_for(:action => 'confirm', :only_path => false),
        :cancel_return_url => url_for(:action => 'index', :only_path => false)
      )
      
    redirect_to gateway.redirect_url_for(setup_response.token)    
  end
  
  def return_url
    
  end
  
  def cancel_return_url
    
  end

  def confirm
    redirect_to :action => 'index' unless params[:token]

    details_response = gateway.details_for(params[:token])

    if !details_response.success?
      @message = details_response.message
      render :action => 'error'
      return
    end

    @address = details_response.address
  end

  def complete
    purchase = gateway.purchase(5000,
      :ip       => request.remote_ip,
      :payer_id => params[:payer_id],
      :token    => params[:token]
    )

    if !purchase.success?
      @message = purchase.message
      render :action => 'error'
      return
    end
  end

private
  def gateway
    @gateway ||= PaypalExpressGateway.new(
      :login => '2030-s_1267310476_biz_api1.gmail.com',
      :password => '1267310482',
      :signature => 'An5ns1Kso7MWUdW4ErQKJJJ4qi4-ACRaxL7DtK7ZJ0XOzew1tWof0IlT'
    )
  end  
  
end
