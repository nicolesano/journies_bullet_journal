class StaticPagesController < ApplicationController
  helper_method :sort_column, :sort_direction
  def home
  end

  def dashboard
    @entries = current_user.entries.all

    @total_entries = @entries.count

    if @entries.exists?
      @first_entry_date = Date.parse(@entries.first.created_at.to_s)
      (Date.today - @first_entry_date).to_i == 0 ? @total_days_since_first_entry = 1 : @total_days_since_first_entry = (Date.today - @first_entry_date).to_i
      @percentage_of_days_with_entries = (@entries.map { |entry| entry.created_at.beginning_of_day }.uniq.size / (@total_days_since_first_entry + 1).to_f * 100).round(0)
      
      @entry_word_lengths = []
      @entries.each do |entry|
        @entry_word_lengths << entry.content.split(' ').size
      end
      @average_entry_word_length = @entry_word_lengths.reduce(:+) / @entry_word_lengths.size.round(0)

      @entry_completion_hash = {}
      @entry_completion_hash[:complete] = @percentage_of_days_with_entries
      @entry_completion_hash[:incomplete] = 100 - @percentage_of_days_with_entries
    end

    @tasks = current_user.tasks.all.order(sort_column + " " + sort_direction)
    
    if @tasks.exists?
      @total_completed_tasks = @tasks.select { |task| task.status == true }.count

      @todays_task_completed = @tasks.select { |task| task.status == true && task.due_date == Date.today }.count
      @todays_task_total = (@tasks.select { |task| task.due_date == Date.today }.count.to_f * 100).round(0)
      @todays_task_total == 0 ? @todays_tasks_percentage_completed = 0 : @todays_tasks_percentage_completed = @todays_task_completed / @todays_task_total

      @todays_number_of_remaining_tasks = @tasks.select { |task| task.status == false && task.due_date == Date.today }.count

      @task_completion_hash = {}
      @task_completion_hash[:complete] = @todays_tasks_percentage_completed
      if @todays_tasks_percentage_completed.nil?
        @task_completion_hash[:complete] == 100
      else
        @task_completion_hash[:incomplete] = 100 - @todays_tasks_percentage_completed
      end
    end
  end

  def sort_column
    Task.column_names.include?(params[:sort]) ? params[:sort] : "due_date"
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end

end
