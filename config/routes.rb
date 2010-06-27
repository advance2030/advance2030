ActionController::Routing::Routes.draw do |map|
  map.resources :committees
  map.resources :venues, :member => { :destroy_avatar => :delete } do |venue|
    venue.resources :venue_notes, :as => :notes
  end
  map.resources :organizations, :member => { :destroy_logo => :delete }
  map.resources :events, :only => [:new, :create]
  map.root :controller => 'home'
  # The priority is based upon order of creation: first created -> highest priority.

  # Sample of regular route:
  #   map.connect 'products/:id', :controller => 'catalog', :action => 'view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   map.purchase 'products/:id/purchase', :controller => 'catalog', :action => 'purchase'
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   map.resources :products

  # Sample resource route with options:
  #   map.resources :products, :member => { :short => :get, :toggle => :post }, :collection => { :sold => :get }

  # Sample resource route with sub-resources:
  #   map.resources :products, :has_many => [ :comments, :sales ], :has_one => :seller

  # Sample resource route with more complex sub-resources
  #   map.resources :products do |products|
  #     products.resources :comments
  #     products.resources :sales, :collection => { :recent => :get }
  #   end

  # Sample resource route within a namespace:
  #   map.namespace :admin do |admin|
  #     # Directs /admin/products/* to Admin::ProductsController (app/controllers/admin/products_controller.rb)
  #     admin.resources :products
  #   end

  # You can have the root of your site routed with map.root -- just remember to delete public/index.html.
  # map.root :controller => "welcome"

  # See how all your routes lay out with "rake routes"

  # Install the default routes as the lowest priority.
  # Note: These default routes make all actions in every controller accessible via GET requests. You should
  # consider removing or commenting them out if you're using named routes and resources.
  map.resource :user_session
  map.resource :account
  map.resource :alert
  map.resource :registration
  map.registration_review 'registration/review', :controller => 'registrations', :action => 'review'
  map.registration_start_over 'registration/start_over', :controller => 'registrations', :action => 'start_over'

  map.benefits 'benefits', :controller => 'benefits', :action => 'index'
  map.benefits_social 'benefits/social', :controller => 'benefits', :action => 'social'
  map.benefits_networking 'benefits/networking', :controller => 'benefits', :action => 'networking'
  map.benefits_philanthropic 'benefits/philanthropic', :controller => 'benefits', :action => 'philanthropic'
  map.benefits_educational 'benefits/educational', :controller => 'benefits', :action => 'educational'
  map.benefits_involved 'benefits/involved', :controller => 'benefits', :action => 'involved'
  map.benefits_discounts 'benefits/discounts', :controller => 'benefits', :action => 'discounts'
  map.benefits_join 'benefits/join', :controller => 'benefits', :action => 'join'
      
  map.calendar 'calendar/:year/:month/:day',
    :controller => 'calendar',
    :action => 'index',
    :year => /\d{4}/,
    :month => /\d{1,2}/,
    :day => /\d{1,2}/
  map.calendar_redirect 'calendar/redirect', :controller => 'calendar', :action => 'redirect'
  map.event_detail 'events/:id', :controller => 'events', :action => 'detail'
  map.venue_detail 'venues/:id', :controller => 'venues', :action => 'detail'
  map.about 'about', :controller => 'about', :action => 'index'
  map.about_directors 'about/directors', :controller => 'about', :action => 'directors'
  map.about_facts 'about/facts', :controller => 'about', :action => 'facts'
  map.about_corporate 'about/facts', :controller => 'about', :action => 'corporate'
  map.members 'members', :controller => 'members', :action => 'index'
  map.cleveland_plus 'clevelandplus', :controller => 'clevelandplus', :action => 'index'
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end

