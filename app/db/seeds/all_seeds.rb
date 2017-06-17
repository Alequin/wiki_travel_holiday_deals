require("pry")

require_relative("travel_agent_seeds.rb")
require_relative("hotel_seeds.rb")
require_relative("holiday_seeds.rb")
require_relative("deal_seeds.rb")
require_relative("../../models/travel_agent.rb")

def save_all_models(models)
  models.each() do |model|
    model.save()
  end
end

Deal.delete_all()
Holiday.delete_all()
TravelAgent.delete_all()
Hotel.delete_all()

travel_agents = make_travel_agents()
save_all_models(travel_agents)

hotels = make_hotels()
save_all_models(hotels)

holidays = make_holidays(travel_agents, hotels)
save_all_models(holidays)

deals = make_deals(holidays)
save_all_models(deals)

binding.pry
nil
