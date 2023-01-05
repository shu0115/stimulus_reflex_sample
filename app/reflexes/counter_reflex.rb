# frozen_string_literal: true

class CounterReflex < ApplicationReflex
  def increment
    @count = element.dataset[:count].to_i + element.dataset[:step].to_i
  end

  def words
    @words = element[:value]
  end

  def decrement
    @count = element.dataset[:count].to_i - element.dataset[:step].to_i

    morph "#decrement_result", "<div id='decrement_result'>#{@count.to_i}</div>"
    morph "#decrement_result_1", "<div id='decrement_result'>#{@count.to_i - 1}</div>"
    morph "#decrement_result_2", "<div id='decrement_result'>#{@count.to_i - 2}</div>"
  end

  def change
    @count = element.dataset[:count].to_i + element.dataset[:step].to_i

    morph "#change_count", render(partial: "/pages/parts", locals: { count: @count })
  end
end
