defmodule FreelancerRates do
  def daily_rate(hourly_rate) do
    hourly_rate * 8.0
  end

  def apply_discount(before_discount, discount) do
    amount_discounted = discount / 100 * before_discount
    before_discount - amount_discounted
  end

  def monthly_rate(hourly_rate, discount) do
    monthly_before_discount = daily_rate(hourly_rate) * 22
    trunc(ceil(apply_discount(monthly_before_discount, discount)))
  end

  def days_in_budget(budget, hourly_rate, discount) do
    Float.floor(budget / daily_rate(apply_discount(hourly_rate, discount)), 1)
  end
end
