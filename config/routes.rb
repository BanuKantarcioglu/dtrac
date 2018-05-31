Rails.application.routes.draw do

  root 'static_pages#home'
  get  '/help',    to: 'static_pages#help'

  get  '/plist',    to: 'personnels#activelist'
  get  '/pastdue',  to: 'documents#pastdue'
  get  '/duesoon',  to: 'documents#duesoon'
#  root 'application#hello'  #For test
  resources  :personnels do
    resources  :documents
  end
end
