class CalculatorController < ApplicationController
  before_action :validate_params, only: [ :add, :subtract, :multiply, :divide ]

  def add
    result = @a + @b
    render json: { operation: "add", a: @a, b: @b, result: result }
  end

  def subtract
    result = @a - @b
    render json: { operation: "subtract", a: @a, b: @b, result: result }
  end

  def multiply
    result = @a * @b
    render json: { operation: "multiply", a: @a, b: @b, result: result }
  end

  def divide
    if @b.zero?
      render json: { error: "Division by zero is not allowed." }, status: :bad_request
    else
      result = @a / @b
      render json: { operation: "divide", a: @a, b: @b, result: result }
    end
  end

  private

  def validate_params
    unless params[:a].match?(/\A-?\d+(\.\d+)?\z/) && params[:b].match?(/\A-?\d+(\.\d+)?\z/)
      render json: { error: "Invalid numeric input." }, status: :bad_request
      return
    end
    @a = params[:a].to_f
    @b = params[:b].to_f
  end
end
