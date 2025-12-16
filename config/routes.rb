Rails.application.routes.draw do
  get "add",      to: "calculator#add"
  get "subtract", to: "calculator#subtract"
  get "multiply", to: "calculator#multiply"
  get "divide",   to: "calculator#divide"
end
