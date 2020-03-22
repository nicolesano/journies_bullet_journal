class StaticPagesController < ApplicationController
  def home
  end

  def dashboard
    @entries = current_user.entries.all

    @total_entries = @entries.count

    @first_entry_date = Date.parse(@entries.first.created_at.to_s)
    @total_days_since_first_entry = (Date.today - @first_entry_date).to_i
    @percentage_of_days_with_entries = (@entries.map { |entry| entry.created_at.beginning_of_day }.uniq.size / @total_days_since_first_entry.to_f * 100).round(0)

    @entry_word_lengths = []
    @entries.each do |entry|
      @entry_word_lengths << entry.content.split(' ').size
    end
    @average_entry_word_length = @entry_word_lengths.reduce(:+) / @entry_word_lengths.size.round(0) 

    @tasks = current_user.tasks.all
    
    @total_completed_tasks = @tasks.select { |task| task.status == true }.count
    @todays_tasks_percentage_completed = (@tasks.select { |task| task.status == true && task.due_date == Date.today }.count / @tasks.select { |task| task.due_date == Date.today }.count.to_f * 100).round(0)
    @todays_number_of_remaining_tasks = @tasks.select { |task| task.status == false && task.due_date == Date.today }.count
  end
end
