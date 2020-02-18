class StaticPagesController < ApplicationController
    def home
    end

    def dashboard
        @entries = current_user.entries.all
    end
end
