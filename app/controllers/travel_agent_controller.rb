require("sinatra")
require("sinatra/contrib/all") if(development?())

require_relative("../models/travel_agent.rb")


get('/travel_agent') do
  @travel_agents = TravelAgent.get_all()
  erb(:"travel_agent/index")
end

get('/travel_agent/new') do
  @form_name = "New Travel Agent"
  @edit = false
  erb(:"travel_agent/form")
end

get('/travel_agent/:id') do
  @travel_agent = TravelAgent.find_by_id(params["id"])
  @has_holidays = @travel_agent.get_holidays().length > 0
  erb(:"travel_agent/show")
end

get('/travel_agent/:id/edit') do
  @travel_agent = TravelAgent.find_by_id(params["id"])
  @edit = true
  erb(:"travel_agent/form")
end

post('/travel_agent') do
  @travel_agent = TravelAgent.new(params)
  @travel_agent.save()
  erb(:"travel_agent/show")
end

post('/travel_agent/:id/delete') do
  @travel_agent = TravelAgent.new(params)
  @travel_agent.delete()
  redirect to("/travel_agent")
end

post('/travel_agent/:id/update') do
  @travel_agent = TravelAgent.new(params)
  @travel_agent.update()
  redirect to("/travel_agent/#{@travel_agent.id}")
end
