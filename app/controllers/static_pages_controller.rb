class StaticPagesController < ApplicationController
    def home
    end

    def dashboard
        @entries = current_user.entries.all
        @tasks = current_user.tasks.all
    end
end
