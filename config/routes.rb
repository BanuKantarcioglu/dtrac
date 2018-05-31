Rails.application.routes.draw do

  root 'static_pages#home'
  get  '/help',    to: 'static_pages#help'
#  root 'application#hello'  #For test
  resources  :personnels do
    resources  :documents
  end
end
