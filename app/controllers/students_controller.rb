class StudentsController < ApplicationController

    def index
        #stuff will happen here
        if params[:movie].present?
          @students =  Rails.cache.fetch("students_bymovie_#{params[:movie]}", expires_in: 5.seconds) do
            @students = Student.by_movie(params[:movie])
          end
        else
          @students =  Rails.cache.fetch("students_all", expires_in: 5.seconds) do
            Student.all
          end

        end
    end

end
