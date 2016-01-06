Rails.application.routes.draw do
  root 'static_pages#home'

  get 'home' => 'static_pages#home'
  get 'story' => 'static_pages#story'
  get 'wedding' => 'static_pages#wedding'
  get 'accommodations' => 'static_pages#accommodations'
  get 'registry' => 'static_pages#registry'
  get 'help' => 'static_pages#help'
  get 'rsvp' => 'static_pages#rsvp'

get 'guestlist' => 'static_pages#guestlist' 

get 'parties/search', to: 'parties#edit', controller: :parties

resources :parties

end
