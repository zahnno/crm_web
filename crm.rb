require 'sinatra'

get '/' do 
	@crm_app_name = "My CRM"
	erb :index
end

get '/contacts' do
	erb :contacts
end