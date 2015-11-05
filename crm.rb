require_relative 'contact'
require 'sinatra'

Contact.create("Johnny", "Bravo", "johnny@bitmakerlabs.com", "Rockstar")

get '/' do 
	@crm_app_name = "My CRM"
	erb :index
end

get '/contacts' do
    erb :contacts
end

get '/contacts/new' do
	erb :new_contact
end

# at the end of the file
post '/contacts' do
  Contact.create(params[:first_name], params[:last_name], params[:email], params[:notes])
  redirect to('/contacts')
end

get '/contacts/1000' do
	@contact = Contact.find(1)
	erb :show_contact
end
