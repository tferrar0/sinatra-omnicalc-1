require "sinatra"
require "sinatra/reloader"

get("/") do
  erb(:square)
end

get("/square/new") do
  erb(:square)
end

get("/square/results") do
  @square_number = params.fetch("number").to_f
  @square_result = @square_number ** 2.to_f

  erb(:results_square)
end

get("/square_root/new") do
  erb(:sqrt)
end

get("/square_root/results") do
  @sqrt_number = params.fetch("user_number").to_f
  @sqrt_result = @sqrt_number ** 0.5.to_f

  erb(:results_sqrt)
end

get("/random/new") do
  erb(:random)
end

get("/random/results") do
  @min_number = params.fetch("user_min").to_f
  @max_number = params.fetch("user_max").to_f
  @random_result = rand(@min_number..@max_number)

  erb(:results_random)
end

get("/payment/new") do
  erb(:payment)
end

get("/payment/results") do
  @apr = params.fetch("user_apr").to_f
  @years = params.fetch("user_years").to_f * 12
  @principal = params.fetch("user_pv").to_f
  @annual_rate = @apr.fdiv(100)
  @rate = @annual_rate.fdiv(12)
  @numerator =  @rate * @principal
  @denominator = 1 - (1 + @rate)**-@years
  @payment_result = @numerator.fdiv(@denominator)


  erb(:results_payment)
end
